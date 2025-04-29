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
pkgver='2503a.r344.g23a5ea3504'
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
	'libudev.so' 'ninja' 'python' 'qt6-base' 'qt6-svg' 'vulkan-headers'
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
	'minizip-ng.diff'
	'cmake-discord-rpc.diff'
	'cmake-mgba.diff'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'e90d1cd324d8c317afecaedfc3cc1074c9284d5416299c06dede2bbe61e034065c47eb89badc9bb52092472d384641fa3bcac5a7e70e743a65fcbf75569501fe'
        '7db29101fc7496355776eee0701ddb971147aea096828f73dc02501d8981a8f1105f16e206a24f3ab94d169dc7ea0443c37b664c25ba064533b7cdcc644bd6f4'
        'd9e6ba73de8e1c49a7ebf9efe6caffcffbe1a545dfb61caebe2b830d8f496aaa221269c25a3f849ba02228dfb866b362c8c74f7e897e66a9362469dea679721d')

_sourcedirectory="$pkgbase"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

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

	# Patch cmake_minimum_required below 3.5.0
	patch --forward -p1 < "$srcdir/cmake-discord-rpc.diff"

	cd "$srcdir/$_sourcedirectory/Externals/mGBA/mgba/"
	patch --forward -p1 < "$srcdir/cmake-mgba.diff"
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
	depends+=(
		'alsa-lib' 'libevdev' 'libpulse' 'libudev.so' 'qt6-base'
	)
	provides=("$_toolpkgname")
	conflicts=("$_toolpkgname")

	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$srcdir/$_sourcedirectory/build/Binaries/$_projectname-tool" "$pkgdir/usr/bin/$_projectname-tool"
}
