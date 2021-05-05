# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.5.1.r7096.g30042e8091
pkgrel=3
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('gtk3' 'libsamplerate' 'libslirp' 'sdl2')
makedepends=('git' 'glu' 'meson' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/mborgerson/xemu.git'
	'git+https://gitlab.com/qemu-project/keycodemapdb.git'
	'git+https://github.com/ocornut/imgui.git'
	'git+https://github.com/epezent/implot.git'
	'git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
	'git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
	'git+https://github.com/Cyan4973/xxHash.git')
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^xemu-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	local paths=(ui/keycodemapdb
		ui/imgui
		ui/implot
		tests/fp/berkeley-softfloat-3
		tests/fp/berkeley-testfloat-3
		hw/xbox/nv2a/xxHash)
	git submodule init "${paths[@]}"
	for name in "${paths[@]}"; do
		git config "submodule.$name.url" "../${name##*/}"
	done
	git submodule update
}

build() {
	cd $_pkgname
	./build.sh --with-git-submodules=ignore --enable-slirp=system
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/share/$_pkgname/data data/*
	install -Dm755 build/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	for size in 24 32 48 256 512; do
		install -Dm644 ui/icons/xemu_${size}x${size}.png "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
}
