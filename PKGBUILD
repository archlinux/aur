# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.5.4.r21.gf03015e20e
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('sdl2')
makedepends=('git' 'glib2' 'glu' 'gtk3' 'libepoxy' 'libpcap' 'libsamplerate' 'libslirp' 'meson' 'ninja' 'openssl' 'pixman' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=(
	'git+https://github.com/Cyan4973/xxHash.git'
	'git+https://github.com/epezent/implot.git'
	'git+https://github.com/mborgerson/xemu.git'
	'git+https://github.com/ocornut/imgui.git'
	'git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
	'git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
	'git+https://gitlab.com/qemu-project/keycodemapdb.git'
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^xemu-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	./scripts/gen-license.py > XEMU_LICENSE
	git submodule init hw/xbox/nv2a/xxHash tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3 ui/imgui ui/implot ui/keycodemapdb
	git config submodule.hw/xbox/nv2a/xxHash.url ../xxHash
	git config submodule.tests/fp/berkeley-softfloat-3.url ../berkeley-softfloat-3
	git config submodule.tests/fp/berkeley-testfloat-3.url ../berkeley-testfloat-3
	git config submodule.ui/imgui.url ../imgui
	git config submodule.ui/implot.url ../implot
	git config submodule.ui/keycodemapdb.url ../keycodemapdb
	git submodule update
}

build() {
	cd $_pkgname
	./configure \
		--audio-drv-list="sdl" \
		--enable-slirp=system \
		--extra-cflags="-DXBOX=1" \
		--target-list=i386-softmmu \
		--with-git-submodules=ignore
	make qemu-system-i386
}

package() {
	depends+=('libgdk-3.so' 'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so' 'libpcap.so' 'libpixman-1.so' 'libsamplerate.so' 'libslirp.so')
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 build/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	for size in 24 32 48 256 512; do
		install -Dm644 ui/icons/xemu_${size}x${size}.png "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
	install -Dm644 XEMU_LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE.txt
}
