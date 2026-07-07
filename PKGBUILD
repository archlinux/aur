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
pkgver='2606.r121.g774200dcf4'
pkgrel='1'
pkgdesc='A Gamecube / Wii emulator'
_pkgdescappend=' - git version'
arch=('x86_64' 'aarch64')
url="https://$_mainpkgname.org"
license=('GPL-2.0-or-later')
depends=(
	# Based on the repo package
	'bluez-libs' 'bzip2' 'curl' 'enet' 'ffmpeg' 'fmt' 'glibc' 'glslang'
	'hidapi' 'libgcc' 'libgl' 'libspng' 'libstdc++' 'libusb' 'libx11' 'libxi'
	'libxrandr' 'lz4' 'lzo' 'pugixml' 'sdl3' 'sfml' 'speexdsp' 'systemd-libs'
	'xxhash' 'xz' 'zlib' 'zlib-ng' 'zstd'
	# Additional dependencies to replace vendored deps
	'cubeb' 'libiconv' 'llvm' 'minizip-ng'
)
makedepends=(
	'alsa-lib' 'cmake' 'git' 'libevdev' 'libpulse' 'miniupnpc' 'ninja' 'python'
	'qt6-base' 'qt6-svg' 'vulkan-headers'
)
checkdepends=('gtest')
optdepends=('pulseaudio: PulseAudio backend')
options=('!lto')
source=(
	"$pkgbase::git+https://github.com/$_mainpkgname/$_projectname"
	"$pkgbase-cppipc::git+https://github.com/mutouyun/cpp-ipc.git"
	"$pkgbase-cppoptparse::git+https://github.com/weisslj/cpp-optparse.git"
	"$pkgbase-imgui::git+https://github.com/ocornut/imgui.git"
	"$pkgbase-implot::git+https://github.com/epezent/implot.git"
	"$pkgbase-mgba::git+https://github.com/mgba-emu/mgba.git"
	"$pkgbase-rcheevos::git+https://github.com/RetroAchievements/rcheevos.git"
	"$pkgbase-tinygltf::git+https://github.com/syoyo/tinygltf.git"
	"$pkgbase-vh::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"$pkgbase-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
	"$pkgbase-watcher::git+https://github.com/e-dant/watcher.git"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
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
		[cppipc]='cpp-ipc/cpp-ipc'
		[cppoptparse]='cpp-optparse/cpp-optparse'
		[imgui]='imgui/imgui'
		[implot]='implot/implot'
		[mgba]='mGBA/mgba'
		[rcheevos]='rcheevos/rcheevos'
		[tinygltf]='tinygltf/tinygltf'
		[vh]='Vulkan-Headers'
		[vma]='VulkanMemoryAllocator'
		[watcher]='watcher/watcher'
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

	# CMAKE_BUILD_TYPE - the dolphin-emu package in the repos uses 'None' for some reason, so we use it as well
	# CMAKE_SKIP_RPATH - do not add run time path information (the package in the repos does it, presumably because of reproducible builds)
	# USE_SYSTEM_LIBS - we want to use system libs where possible
	# USE_SYSTEM_LIBMGBA - the current version of mgba in the repos is not compatible with Dolphin
	# USE_SYSTEM_MBEDTLS - the current version of mbedtls in the repos is not compatible with Dolphin
	cmake -S '.' -B 'build/' -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISTRIBUTOR='aur.archlinux.org/packages/dolphin-emu-git' \
		-DENABLE_AUTOUPDATE=OFF \
		-DUSE_SYSTEM_LIBS=ON \
		-DUSE_SYSTEM_LIBMGBA=OFF \
		-DUSE_SYSTEM_MBEDTLS=OFF \
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
		'alsa-lib' 'hicolor-icon-theme' 'libevdev' 'libpulse' 'miniupnpc'
		'qt6-base' 'qt6-svg'
	)
	provides=("$_mainpkgname")
	conflicts=("$_mainpkgname")

	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
	install -Dm644 'Data/51-usb-device.rules' "$pkgdir/usr/lib/udev/rules.d/51-usb-device.rules"
	install -Dm644 'build/Flatpak/org.DolphinEmu.dolphin-emu.metainfo.xml' "$pkgdir/usr/share/metainfo/org.DolphinEmu.dolphin-emu.metainfo.xml"

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
	install -Dm755 "build/Binaries/$_noguipkgname" "$pkgdir/usr/bin/$_noguipkgname"
	ln -sf "/usr/bin/$_noguipkgname" "$pkgdir/usr/bin/$_mainpkgname-cli"
	install -Dm644 "Data/$_noguipkgname.6" "$pkgdir/usr/share/man/man6/$_noguipkgname.6"
}

package_dolphin-emu-tool-git() {
	pkgdesc="$pkgdesc - CLI-based utility for functions such as managing disc images$_pkgdescappend"
	depends+=(
		'alsa-lib' 'libevdev' 'libpulse' 'qt6-base'
	)
	provides=("$_toolpkgname")
	conflicts=("$_toolpkgname")

	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "build/Binaries/$_projectname-tool" "$pkgdir/usr/bin/$_projectname-tool"
}
