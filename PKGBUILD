# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>
# Contributor: Andrew Phelps <andrewphelpsj@gmail.com>
_projectname='dolphin'
_mainpkgname="$_projectname-emu"
_noguipkgname="$_projectname-emu-nogui"
_toolpkgname="$_projectname-emu-tool"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase" "$_noguipkgname-git" "$_toolpkgname-git")
pkgver='5.0.r20580.gdd227fea5a'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'bzip2' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpulse'
	'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls2' 'minizip-ng' 'pugixml' 'sfml'
	'speexdsp' 'xz' 'zstd' 'cubeb' 'zlib-ng'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
	'libsfml-network.so' 'libsfml-system.so' 'libspng.so' 'libswscale.so'
	'libudev.so' 'libusb-1.0.so' 'libxxhash.so'
)
makedepends=('cmake' 'git' 'miniupnpc' 'ninja' 'python' 'qt6-base' 'qt6-svg')
optdepends=('pulseaudio: PulseAudio backend')
options=('!lto')
source=(
	"$pkgname::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgname-implot::git+https://github.com/epezent/implot.git"
	"$pkgname-mgba::git+https://github.com/mgba-emu/mgba.git"
	"$pkgname-rcheevos::git+https://github.com/RetroAchievements/rcheevos.git"
	"$pkgname-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	'minizip-ng.diff'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '568ca7db64149e9ac9409947689a8390783b891e6cff7b096690771512db3e19f9d8551a8739921d8a9f6ec4a9de747811a2efc8cdd4791d715677772db7fa8e')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Fix minizip-ng name for Arch
	patch --forward -p1 < "$srcdir/minizip-ng.diff"

	# Provide submodules
	declare -A _submodules=(
		[implot]='implot/implot'
		[mgba]='mGBA/mgba'
		[rcheevos]='rcheevos/rcheevos'
		[vma]='VulkanMemoryAllocator'
	)

	for _submod in "${!_submodules[@]}"; do
		_path="Externals/${_submodules[$_submod]}"
		git submodule init "$_path"
		git config "submodule.$_path.url" "$srcdir/$pkgname-$_submod/"
		git -c protocol.file.allow=always submodule update "$_path"
	done
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# Consider symbols in dependencies of directly specified dynamic libraries as available to fix the build
	export LDFLAGS="-Wl,--copy-dt-needed-entries"

	# CMAKE_BUILD_TYPE - the dolphin-emu package in the repos uses 'None' for some reason, so we use it as well
	# USE_SYSTEM_LIBS - we want to use system libs where possible
	# USE_SYSTEM_LIBMGBA - the current version of mgba in the repos is not compatible with Dolphin
	# USE_SYSTEM_ENET - the current version of enet in the repos is not compatible with Dolphin
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR='aur.archlinux.org/packages/dolphin-emu-git' \
		-DENABLE_TESTS=OFF \
		-DENABLE_AUTOUPDATE=OFF \
		-DUSE_SYSTEM_LIBS=ON \
		-DUSE_SYSTEM_LIBMGBA=OFF \
		-DUSE_SYSTEM_ENET=OFF \
		-Wno-dev
	cmake --build 'build/'
}

package_dolphin-emu-git() {
	pkgdesc="$pkgdesc$_pkgdescappend"
	depends+=('hicolor-icon-theme' 'libminiupnpc.so' 'qt6-base' 'qt6-svg')
	provides=("$_mainpkgname")
	conflicts=("$_mainpkgname")

	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/51-usb-device.rules"

	rm -rf "$pkgdir/usr/bin/$_noguipkgname"
	rm -rf "$pkgdir/usr/bin/$_projectname-tool"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"
	rm -rf "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-nogui-git() {
	pkgdesc="$pkgdesc - no GUI$_pkgdescappend"
	depends=("$_mainpkgname")
	optdepends=()
	provides=("$_noguipkgname" "$_mainpkgname-cli")
	conflicts=("$_noguipkgname" "$_mainpkgname-cli")

	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/build/Binaries/$_noguipkgname" "$pkgdir/usr/bin/$_noguipkgname"
	ln -sf "/usr/bin/$_noguipkgname" "$pkgdir/usr/bin/$_mainpkgname-cli"
	install -Dm644 "Data/$_noguipkgname.6" "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-tool-git() {
	pkgdesc="$pkgdesc - CLI-based utility for functions such as managing disc images$_pkgdescappend"
	provides=("$_toolpkgname")
	conflicts=("$_toolpkgname")

	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/build/Binaries/$_projectname-tool" "$pkgdir/usr/bin/$_projectname-tool"
}
