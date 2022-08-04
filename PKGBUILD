# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>
_projectname='dolphin'
_mainpkgname="$_projectname-emu"
_noguipkgname="$_projectname-emu-nogui"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase" "$_noguipkgname-git")
pkgver='5.0.r17132.g5508c52a95'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpulse'
	'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt6-base' 'sfml'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
	'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=(
	"$pkgname::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgname-mgba::git+https://github.com/mgba-emu/mgba.git"
	"$pkgname-spirvcross::git+https://github.com/KhronosGroup/SPIRV-Cross.git"
	"$pkgname-zlibng::git+https://github.com/zlib-ng/zlib-ng.git"
	"$pkgname-libspng::git+https://github.com/randy408/libspng.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Provide mgba submodule
	_mgbapath='Externals/mGBA/mgba'
	git submodule init "$_mgbapath"
	git config "submodule.$_mgbapath.url" "$srcdir/$pkgname-mgba/"
	git submodule update "$_mgbapath"

	# Provide SPIRV-Cross submodule
	_spirvcrosspath='Externals/spirv_cross/SPIRV-Cross'
	git submodule init "$_spirvcrosspath"
	git config "submodule.$_spirvcrosspath.url" "$srcdir/$pkgname-spirvcross/"
	git submodule update "$_spirvcrosspath"

	# Provide zlib-ng submodule
	_zlibngpath='Externals/zlib-ng/zlib-ng'
	git submodule init "$_zlibngpath"
	git config "submodule.$_zlibngpath.url" "$srcdir/$pkgname-zlibng/"
	git submodule update "$_zlibngpath"

	# Provide libspng submodule
	_libspngpath='Externals/libspng/libspng'
	git submodule init "$_libspngpath"
	git config "submodule.$_libspngpath.url" "$srcdir/$pkgname-libspng/"
	git submodule update "$_libspngpath"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export CXXFLAGS+=" -fpermissive"
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR=archlinux.org \
		-DUSE_SHARED_ENET=ON
	cmake --build 'build/'
}

package_dolphin-emu-git() {
	pkgdesc="$pkgdesc$_pkgdescappend"
	provides=("$_mainpkgname")
	conflicts=("$_mainpkgname")

	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/51-usb-device.rules"

	rm -rf "$pkgdir/usr/bin/$_noguipkgname"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"
	rm -rf "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-nogui-git() {
	pkgdesc="$pkgdesc - no GUI$_pkgdescappend"
	depends=("$pkgbase")
	optdepends=()
	provides=("$_noguipkgname" "$_mainpkgname-cli")
	conflicts=("$_noguipkgname" "$_mainpkgname-cli")

	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/build/Binaries/$_noguipkgname" "$pkgdir/usr/bin/$_noguipkgname"
	ln -sf "/usr/bin/$_noguipkgname" "$pkgdir/usr/bin/$_mainpkgname-cli"
	install -Dm644 "Data/$_noguipkgname.6" "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}
