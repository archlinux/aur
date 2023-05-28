# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>
_projectname='dolphin'
_mainpkgname="$_projectname-emu"
_noguipkgname="$_projectname-emu-nogui"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase" "$_noguipkgname-git")
pkgver='5.0.r19452.g4dc4b28db4'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL2')
depends=(
	'alsa-lib' 'bluez-libs' 'cubeb' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpulse'
	'libspng' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls2' 'minizip-ng'
	'pugixml' 'qt6-base' 'sfml' 'zlib'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
	'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so'
)
makedepends=('cmake' 'git' 'ninja' 'python')
optdepends=('pulseaudio: PulseAudio backend')
source=(
	"$pkgname::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgname-implot::git+https://github.com/epezent/implot.git"
	"$pkgname-mgba::git+https://github.com/mgba-emu/mgba.git"
	"$pkgname-rcheevos::git+https://github.com/RetroAchievements/rcheevos.git"
	"$pkgname-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"$pkgname-zlibng::git+https://github.com/zlib-ng/zlib-ng.git"
	"$pkgname-mbedtls2.diff::https://github.com/$_mainpkgname/$_projectname/pull/11847.diff"
	'minizip-ng.diff'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '062513965a9a037d3e755c4fe071a0454d3f71738d7659698ce7287019cb986e30dbdc29a43910117d284fa058426c937896e896c3007961a7daeb2a2422a9aa'
            'b469597fe9b4e9be6ae9ab0330fe5e3d6b944a73505775ff75f9895ae4843768f3815d4b5b8e227d6d2e87c3f4882d6d7262f9df85be0aaddf46730a7afa16dd')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Fix mbedtls dependency to use mbedtls2
	patch --forward -p1 < "$srcdir/$pkgname-mbedtls2.diff"

	# Fix minizip-ng name for Arch
	patch --forward -p1 < "$srcdir/minizip-ng.diff"

	# Provide submodules
	declare -A _submodules=(
		[implot]='implot/implot'
		[mgba]='mGBA/mgba' # The current version of mgba in the repos is not compatible with Dolphin
		[rcheevos]='rcheevos/rcheevos'
		[vma]='VulkanMemoryAllocator'
		[zlibng]='zlib-ng/zlib-ng'
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
	# The dolphin-emu package in the repos MAKE_BUILD_TYPE=None for some reason, so we use it as well
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR=archlinux.org \
		-DENABLE_TESTS=OFF \
		-DENABLE_AUTOUPDATE=OFF \
		-DUSE_SHARED_ENET=ON \
		-DCMAKE_DISABLE_FIND_PACKAGE_LIBMGBA=True \
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
