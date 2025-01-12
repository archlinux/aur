# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>
# Contributor: Andrew Phelps <andrewphelpsj@gmail.com>
# Contributor: Michał Kopeć <michal.kopec@3mdeb.com>
_projectname='dolphin'
_mainpkgname="$_projectname-emu"
_noguipkgname="$_projectname-emu-nogui"
_toolpkgname="$_projectname-emu-tool"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase" "$_noguipkgname-git" "$_toolpkgname-git")
pkgver='2412.r130.g93fc5c02ac'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL-2.0-or-later')
depends=(
	# Based on the repo package
	'bluez-libs' 'bzip2' 'enet' 'gcc-libs' 'glibc' 'hidapi' 'libavcodec.so'
	'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so' 'libgl'
	'libsfml-network.so' 'libsfml-system.so' 'libspng.so' 'libswscale.so'
	'libusb-1.0.so' 'libx11' 'libxi' 'libxrandr' 'lz4' 'lzo' 'mbedtls2' 'pugixml'
	'sdl2' 'sfml' 'speexdsp' 'xxhash' 'xz' 'zstd'
	# Additional dependencies to replace vendored deps
	'cubeb' 'minizip-ng'
)
makedepends=(
	'alsa-lib' 'cmake' 'git' 'libevdev' 'libminiupnpc.so' 'libpulse'
	'libudev.so' 'ninja' 'python' 'qt6-base' 'qt6-svg'
)
checkdepends=('gtest')
optdepends=('pulseaudio: PulseAudio backend')
options=('!lto')
source=(
	"$pkgbase::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgbase-implot::git+https://github.com/epezent/implot.git"
	"$pkgbase-mgba::git+https://github.com/mgba-emu/mgba.git"
	"$pkgbase-rcheevos::git+https://github.com/RetroAchievements/rcheevos.git"
	"$pkgbase-tinygltf::git+https://github.com/syoyo/tinygltf.git"
	"$pkgbase-vh::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"$pkgbase-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"$pkgbase-zlibng::git+https://github.com/zlib-ng/zlib-ng.git"
	"$pkgbase-fix-line-endings.diff::https://github.com/$_mainpkgname/$_projectname/commit/f28e134c88ecbd30eed89606bca3c348047a3009.diff"
	'fix-minizip-ng-compat-headers.diff'
	'minizip-ng.diff'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '43b59f3546973c840b26ee5fc13fd40542e433ab5fad36134dafa365e2cac0f20c43fb2fb47831a34a5596d8f88fe3adaac02f5963e987d7884c964013fe3059'
        '132f890b6d9f5375cc19a78a9efffbfb612b8e04a238d417ed82af827796748b659cca45cc2fe0c78aa8c409a91719f9eca70e7932dd61769f0f5e069b4899a9'
        '504a23ab4cce2be8f114263ebfcbcd468fd183187443c2e0d994d4e090fe037d5c2b3fddd2095ddb1ae12009eaa83e08b7d2fecb67f8b40d8b9862c91d0bbc59')

_sourcedirectory="$pkgbase"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Fix CRLF line endings (see https://github.com/dolphin-emu/dolphin/pull/13274)
	patch --forward -p1 < "$srcdir/$pkgbase-fix-line-endings.diff"

	# Use correct renamed minizip-ng compat header files (based on https://github.com/dolphin-emu/dolphin/pull/13273)
	patch --forward -p1 < "$srcdir/fix-minizip-ng-compat-headers.diff"

	# Fix minizip-ng check for Arch (see https://github.com/dolphin-emu/dolphin/pull/12910#issuecomment-2249001387)
	patch --forward -p1 < "$srcdir/minizip-ng.diff"

	# Provide submodules
	declare -A _submodules=(
		[implot]='implot/implot'
		[mgba]='mGBA/mgba'
		[rcheevos]='rcheevos/rcheevos'
		[tinygltf]='tinygltf/tinygltf'
		[vh]='Vulkan-Headers'
		[vma]='VulkanMemoryAllocator'
		[zlibng]='zlib-ng/zlib-ng'
	)

	for _submod in "${!_submodules[@]}"; do
		_path="Externals/${_submodules[$_submod]}"
		git submodule init "$_path"
		git config "submodule.$_path.url" "$srcdir/$pkgbase-$_submod/"
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
	export LDFLAGS="$LDFLAGS -Wl,--copy-dt-needed-entries"

	# CMAKE_BUILD_TYPE - the dolphin-emu package in the repos uses 'None' for some reason, so we use it as well
	# CMAKE_SKIP_RPATH - do not add run time path information (the package in the repos does it, presumably because of reproducible builds)
	# USE_SYSTEM_LIBS - we want to use system libs where possible
	# USE_SYSTEM_LIBMGBA - the current version of mgba in the repos is not compatible with Dolphin
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR='aur.archlinux.org/packages/dolphin-emu-git' \
		-DENABLE_AUTOUPDATE=OFF \
		-DUSE_SYSTEM_LIBS=ON \
		-DUSE_SYSTEM_LIBMGBA=OFF \
		-Wno-dev
	cmake --build 'build/'
}

check() {
	# Get git version to compare
	cd "$srcdir/$_sourcedirectory/"
	_checkversion="$(git describe | cut --delimiter='-' --fields=1-2)"

	# Run tests
	cd "$srcdir/$_sourcedirectory/build/"
	ninja unittests

	# Verify that the basic functionality works
	_checkoutput="$(QT_QPA_PLATFORM='offscreen' "$srcdir/$_sourcedirectory/build/Binaries/$_noguipkgname" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q -E "^${_projectname^}( \[.+\])? ${_checkversion}(-dirty)?(-ICC)?$"
}

package_dolphin-emu-git() {
	pkgdesc="$pkgdesc$_pkgdescappend"
	depends+=(
		'alsa-lib' 'hicolor-icon-theme' 'libevdev' 'libminiupnpc.so' 'libpulse'
		'libudev.so' 'qt6-base' 'qt6-svg'
	)
	provides=("$_mainpkgname")
	conflicts=("$_mainpkgname")

	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/51-usb-device.rules"

	rm -rf "$pkgdir/usr/bin/$_noguipkgname"
	rm -rf "$pkgdir/usr/bin/$_projectname-tool"
	rm -rf "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-nogui-git() {
	pkgdesc="$pkgdesc - no GUI$_pkgdescappend"
	depends+=("$_mainpkgname")
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
