# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.7.103.r0.g93ab116e91
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('dtc' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'sdl2' 'zlib')
makedepends=(
	'cmake'
	'cpp-httplib'
	'git'
	'glib2'
	'glu'
	'gtk3'
	'keyutils'
	'libepoxy'
	'libpcap'
	'libsamplerate'
	'libslirp'
	'meson'
	'nlohmann-json'
	'openssl'
	'pixman'
	'python-yaml'
	'tomlplusplus>=3.1'
	'xxhash>=0.8'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=(
	"$_pkgname::git+https://github.com/mborgerson/xemu.git"
	'berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
	'berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
	'genconfig::git+https://github.com/mborgerson/genconfig.git'
	'imgui::git+https://github.com/ocornut/imgui.git'
	'implot::git+https://github.com/epezent/implot.git'
	'keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
	'nv2a_vsh_cpu::git+https://github.com/abaire/nv2a_vsh_cpu.git'
	'use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'66713ea21508daea5940a1dc0d761ecf449d31a825f2e24090d296ea4c127df80f961d13fe8d179bdad265441bad7174344c53db4202a23b910e9e0ca6c04e21'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.genconfig.url ../genconfig
	git config submodule.hw/xbox/nv2a/thirdparty/nv2a_vsh_cpu.url ../nv2a_vsh_cpu
	git config submodule.tests/fp/berkeley-softfloat-3.url ../berkeley-softfloat-3
	git config submodule.tests/fp/berkeley-testfloat-3.url ../berkeley-testfloat-3
	git config submodule.ui/keycodemapdb.url ../keycodemapdb
	git config submodule.ui/thirdparty/imgui.url ../imgui
	git config submodule.ui/thirdparty/implot.url ../implot
	git -c protocol.file.allow=always submodule update
	mkdir -p ../build
	patch -Np1 < ../use-system-libs.patch
	python scripts/gen-license.py > XEMU_LICENSE
}

build() {
	cd build
	../$_pkgname/configure \
		--audio-drv-list="sdl" \
		--disable-debug-info \
		--extra-cflags="-DXBOX=1" \
		--ninja="$NINJA" \
		--target-list="i386-softmmu" \
		--with-git-submodules=ignore
	make qemu-system-i386
}

package() {
	depends+=(
		'libepoxy.so'
		'libgdk-3.so'
		'libglib-2.0.so'
		'libgobject-2.0.so'
		'libgtk-3.so'
		'libhttplib.so'
		'libkeyutils.so'
		'libpcap.so'
		'libpixman-1.so'
		'libsamplerate.so'
		'libslirp.so'
		'libtomlplusplus.so'
	)
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 ../build/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	for _size in 16 24 32 48 64 128 256 512; do
		install -Dm644 ui/icons/xemu_${_size}x${_size}.png "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
	install -Dm644 XEMU_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
