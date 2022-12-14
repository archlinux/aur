# Maintainer: HamletDuFromage <https://github.com/HamletDuFromage/slippi-online-git-PKGBUILD/issues>

_projectname='slippi-online'
_mainpkgname="$_projectname"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase")
_tagname='v3.0.1'
pkgver='v3.0.1.r0.gfba5537d1'
pkgrel='0'
pkgdesc='Super Smash Bros. Melee rollback netcode'
_pkgdescappend=' - git version'
arch=('x86_64')
url="https://slippi.gg/"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpng'
	'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt5-base'
	'sfml' 'zlib' 'webkit2gtk'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
	'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
source=("$pkgname::git+https://github.com/project-slippi/Ishiiruka.git#tag=$_tagname")
sha256sums=('SKIP')

_sourcedirectory="$pkgbase"
_dolphinemu="dolphin-emu"

pkgver() {
	cd "$_sourcedirectory/"
	git checkout --quiet "$(git rev-list -n 1 $(git describe --tags --abbrev=0))"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$_sourcedirectory/"

	CMAKE_FLAGS='-DLINUX_LOCAL_DEV=true'

	# Move into the build directory, run CMake, and compile the project
	mkdir -p build
	cd build
	cmake ${CMAKE_FLAGS} ../
	make -j$(nproc)
}

package() {
	pkgdesc="$pkgdesc$_pkgdescappend"
	provides=("$_mainpkgname")
	conflicts=("$_mainpkgname")

	cd "$_sourcedirectory/"
	make DESTDIR="$pkgdir" -C 'build/' install

	# Rename the binary to not be mistaken with Dolphin
	mv "$pkgdir/usr/local/bin/$_dolphinemu" "$pkgdir/usr/local/bin/$_mainpkgname"

	cp -r "Data/Sys/" "$pkgdir/usr/local/bin/"

	rm -r "$pkgdir/usr/local/share/man/"

	# Get the rules for the GC adapter
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/52-usb-device.rules"

	# Generate a Desktop file
	rm "$pkgdir/usr/local/share/applications/dolphin-emu.desktop"
	printf "[Desktop Entry]\nVersion=$pkgver\nName=Slippi Online (Melee Rollback)\nComment=Super Smash Bros. Melee rollback netcode\nPath=/usr/local/bin\nExec=slippi-online\nIcon=slippi-online\nType=Application\nCategories=Game\nKeywords=slippi;melee;rollback\n" > "$pkgdir/usr/local/share/applications/slippi-online.desktop"

	# Generate an icon
	rm -r "$pkgdir/usr/local/share/icons/"
	mkdir -p "$pkgdir/usr/local/share/pixmaps/"
	printf "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"256\" height=\"256\" stroke=\"#000\" stroke-linecap=\"round\" stroke-linejoin=\"round\" fill=\"#fff\" fill-rule=\"evenodd\"><circle cx=\"128\" cy=\"128\" fill=\"#21ba45\" stroke=\"#21ba45\" r=\"127.5\"/><g stroke=\"none\"><path d=\"M216.5489 106.4668l6.552 3.7627c3.766 2.1701 6.893 5.2856 9.068 9.035s3.325 8.0014 3.331 12.3309v11.0364c-.009 4.3271-1.1589 8.5762-3.334 12.3228s-5.301 6.8595-9.065 9.0285l-83.931 48.217c-3.771 2.162-8.047 3.3-12.399 3.3s-8.628-1.138-12.399-3.3l-83.9314-48.245c-3.7632-2.169-6.8886-5.282-9.0644-9.0289s-3.3255-7.9957-3.3345-12.3228v-11.0222c.009-4.3271 1.1588-8.5762 3.3345-12.3228s5.3012-6.86 9.0644-9.0289l6.5524-3.7627a34.175 34.175 0 0 1-2.2604-12.3033c.0033-7.1467 2.2285-14.1175 6.3703-19.9565s9.9976-10.2603 16.7644-12.6577 14.1132-2.6534 21.032-.7331 13.0711 5.9232 17.6135 11.4595l17.8592-10.2393c3.77-2.1656 8.046-3.3056 12.399-3.3056s8.629 1.14 12.399 3.3056l17.859 10.2393c4.543-5.5363 10.695-9.5391 17.614-11.4595s14.265-1.6643 21.032.7331 12.622 6.8187 16.764 12.6577 6.367 12.8098 6.37 19.9565a34.183 34.183 0 0 1-2.26 12.3033zm-11.502 3.2503l13.763 7.9097c2.462 1.4182 4.507 3.455 5.929 5.9064a16.103 16.103 0 0 1 2.178 8.0623v11.0222a16.103 16.103 0 0 1-2.178 8.0623c-1.422 2.4514-3.467 4.4882-5.929 5.9064l-83.932 48.2167c-2.466 1.411-5.262 2.154-8.107 2.154s-5.64-.743-8.107-2.154l-83.9313-48.2167c-2.4622-1.4182-4.507-3.455-5.9297-5.9064s-2.1735-5.2315-2.1773-8.0623v-11.0222c.0038-2.8308.7546-5.6109 2.1773-8.0623s3.4675-4.4882 5.9297-5.9064l13.7628-7.9097c-2.2141-2.9536-3.7744-6.3403-4.5783-9.9371a25.967 25.967 0 0 1-.0858-10.9312 26.032 26.032 0 0 1 4.4217-10.0072c2.1675-2.9877 4.9463-5.4848 8.1535-7.3271A26.322 26.322 0 0 1 66.861 68.153c3.6843-.3736 7.4063.0334 10.9211 1.1941s6.7428 3.0487 9.4715 5.54 4.8961 5.5291 6.3597 8.9139l25.0506-14.3911a16.327 16.327 0 0 1 8.107-2.154c2.845 0 5.641.7427 8.107 2.154l25.051 14.3911c1.463-3.3848 3.631-6.4227 6.36-8.9139s5.956-4.3794 9.471-5.54a26.353 26.353 0 0 1 10.921-1.1941c3.684.3736 7.247 1.5192 10.455 3.3615s5.986 4.3394 8.153 7.3271 3.675 6.3983 4.422 10.0072a25.972 25.972 0 0 1-.086 10.9312c-.804 3.5968-2.364 6.9835-4.578 9.9371z\"/><path d=\"M215.4709 148.544c-.172-.1514-.387-.2473-.615-.2752l-79.096-10.021c-5.976-.6311-12.002-.6311-17.978 0l-79.0865 10.021c-.2282.0279-.4427.1238-.6151.2752a7.18 7.18 0 0 0 .9537.6453l83.9219 48.2168c1.161.662 2.477 1.011 3.815 1.011s2.654-.349 3.815-1.011l83.931-48.2121c.334-.1926.653-.4099.954-.65zm-145.926-36.8246c3.4897 0 6.9011-1.0296 9.8028-2.9587s5.1632-4.6708 6.4987-7.8788a17.474 17.474 0 0 0 1.0041-10.1433c-.6808-3.4055-2.3612-6.5336-4.829-8.9889s-5.6116-4.1272-9.0344-4.8046a17.728 17.728 0 0 0-10.1946.999c-3.2241 1.3288-5.9798 3.579-7.9187 6.466s-2.9736 6.2813-2.9736 9.7535c0 4.6561 1.859 9.1215 5.168 12.4138s7.797 5.142 12.4767 5.142zm-9.0608-17.5558c0-1.783.5315-3.526 1.527-5.0086s2.4107-2.638 4.0663-3.3203 3.4775-.8609 5.2352-.513 3.372 1.2064 4.6392 2.4672 2.1301 2.8671 2.4797 4.616.1702 3.5613-.5156 5.2086a9.025 9.025 0 0 1-3.3372 4.0459 9.093 9.093 0 0 1-5.0338 1.5193c-2.4031 0-4.7077-.9497-6.407-2.6404s-2.6538-3.9837-2.6538-6.3747zm123.3818 17.5558c3.49 0 6.901-1.0296 9.803-2.9587s5.163-4.6708 6.499-7.8788 1.684-6.7378 1.004-10.1433-2.362-6.5336-4.829-8.9889-5.612-4.1272-9.035-4.8046-6.97-.3297-10.194.999-5.98 3.579-7.919 6.466-2.974 6.2813-2.974 9.7535c0 4.6561 1.859 9.1215 5.168 12.4138s7.797 5.142 12.477 5.142zm-9.061-17.5558c0-1.783.532-3.526 1.527-5.0086s2.411-2.638 4.067-3.3203a9.103 9.103 0 0 1 5.235-.513c1.758.3479 3.372 1.2064 4.639 2.4672s2.13 2.8671 2.48 4.616a8.976 8.976 0 0 1-.516 5.2086c-.686 1.6473-1.847 3.0553-3.337 4.0459s-3.242 1.5193-5.034 1.5193c-2.403 0-4.708-.9497-6.407-2.6404s-2.654-3.9837-2.654-6.3747z\" fill-rule=\"nonzero\"/></g></svg>" > "$pkgdir/usr/local/share/pixmaps/slippi-online.svg"
}
