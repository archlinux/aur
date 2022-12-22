# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>
_projectname='dolphin'
_mainpkgname="$_projectname-emu"
_noguipkgname="$_projectname-emu-nogui"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase" "$_noguipkgname-git")
pkgver='5.0.r18076.gd853da3b0b'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'cubeb' 'enet' 'hidapi' 'libevdev' 'libgl' 'libmgba'
	'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'minizip-ng' 'pugixml'
	'qt6-base' 'sfml' 'zlib'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
	'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=(
	"$pkgname::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgname-spirvcross::git+https://github.com/KhronosGroup/SPIRV-Cross.git"
	"$pkgname-zlibng::git+https://github.com/zlib-ng/zlib-ng.git"
	"$pkgname-libspng::git+https://github.com/randy408/libspng.git"
	"$pkgname-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"$pkgname-$pkgver-$pkgrel-system-libmgba.diff::https://github.com/$_mainpkgname/$_projectname/commit/afde3a0e0d2bc49a5d890d16611432aa6eb76428.diff" # https://github.com/dolphin-emu/dolphin/pull/11362
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1fe1501ccacb158464bd17efaae5263f0bc8639edb40a29227969d803e1c99860373df40fe0da7828f4bd2fecff4801695f7d303a49bdfbb8087fbca3b1b468d')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Apply patch to use system libmgba
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-system-libmgba.diff"

	# Provide SPIRV-Cross submodule
	_spirvcrosspath='Externals/spirv_cross/SPIRV-Cross'
	git submodule init "$_spirvcrosspath"
	git config "submodule.$_spirvcrosspath.url" "$srcdir/$pkgname-spirvcross/"
	git -c protocol.file.allow=always submodule update "$_spirvcrosspath"

	# Provide zlib-ng submodule
	_zlibngpath='Externals/zlib-ng/zlib-ng'
	git submodule init "$_zlibngpath"
	git config "submodule.$_zlibngpath.url" "$srcdir/$pkgname-zlibng/"
	git -c protocol.file.allow=always submodule update "$_zlibngpath"

	# Provide libspng submodule
	_libspngpath='Externals/libspng/libspng'
	git submodule init "$_libspngpath"
	git config "submodule.$_libspngpath.url" "$srcdir/$pkgname-libspng/"
	git -c protocol.file.allow=always submodule update "$_libspngpath"

	# Provide vma submodule
	_vmapath='Externals/VulkanMemoryAllocator'
	git submodule init "$_vmapath"
	git config "submodule.$_vmapath.url" "$srcdir/$pkgname-vma/"
	git -c protocol.file.allow=always submodule update "$_vmapath"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR=archlinux.org \
		-DUSE_SHARED_ENET=ON \
		-Wno-dev
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
