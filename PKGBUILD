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
pkgver='5.0.r21785.gf49659fbfc'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL-2.0-or-later')
depends=(
	'alsa-lib' 'bluez-libs' 'bzip2' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpulse'
	'libx11' 'libxi' 'libxrandr' 'lz4' 'lzo' 'mbedtls2' 'minizip-ng' 'pugixml'
	'sdl2' 'sfml' 'speexdsp' 'xz' 'zstd' 'cubeb' 'zlib-ng'
	'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so' 'libfmt.so'
	'libminiupnpc.so' 'libsfml-network.so' 'libsfml-system.so' 'libspng.so'
	'libswscale.so' 'libudev.so' 'libusb-1.0.so' 'libxxhash.so'
)
makedepends=('cmake' 'git' 'ninja' 'python' 'qt6-base' 'qt6-svg')
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
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

_sourcedirectory="$pkgbase"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	if [ -d 'build/' ]; then rm -rf 'build/'; fi
	mkdir 'build/'

	# Provide submodules
	declare -A _submodules=(
		[implot]='implot/implot'
		[mgba]='mGBA/mgba'
		[rcheevos]='rcheevos/rcheevos'
		[tinygltf]='tinygltf/tinygltf'
		[vh]='Vulkan-Headers'
		[vma]='VulkanMemoryAllocator'
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
	export LDFLAGS="-Wl,--copy-dt-needed-entries"

	# CMAKE_BUILD_TYPE - the dolphin-emu package in the repos uses 'None' for some reason, so we use it as well
	# USE_SYSTEM_LIBS - we want to use system libs where possible
	# USE_SYSTEM_LIBMGBA - the current version of mgba in the repos is not compatible with Dolphin
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
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
	_checkversion="${_projectname^}.*$(git describe --long --tags | sed -E 's/^([0-9.]+-[0-9]+)-g.+$/\1/')"

	# Run tests
	cd "$srcdir/$_sourcedirectory/build/"
	ninja unittests

	# Verify that the basic functionality works
	QT_QPA_PLATFORM='offscreen' "$srcdir/$_sourcedirectory/build/Binaries/$_noguipkgname" --version | tee '/dev/stderr' | grep -q "^$_checkversion$"
}

package_dolphin-emu-git() {
	pkgdesc="$pkgdesc$_pkgdescappend"
	depends+=('hicolor-icon-theme' 'qt6-base' 'qt6-svg')
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
