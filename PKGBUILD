# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=sonic2013-git
pkgver=r773.c8f442c
pkgrel=1
pkgdesc='A full decompilation of Sonic 1 & 2 (2013).'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation'
license=('custom:RSDKv3/4 Decompilation Source Code License v1')
makedepends=('git')
depends=(
	'sdl2'
	'libogg'
	'libvorbis'
	'asio'
	'tinyxml2'
)
provides=(sonic2013)
source=(
	"git+${url}.git"
	'git+https://github.com/leethomason/tinyxml2.git'
	'template-launcher'
	'template.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'53ea1912492a15bf54f6dba1859aaf0f9ca0c01615f021faa8a3c67449b1fd55'
	'55df140227c69094fac5ee7dd1b8a8e8beef9abe4072dee00e1688a0b9966353'
)
install=sonic2013.install

pkgver() {
	cd "$srcdir/Sonic-1-2-2013-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/Sonic-1-2-2013-Decompilation"
	git submodule init
	git config submodule.dependencies/all/tinyxml2.url "$srcdir/tinyxml2"
	git submodule update
}

build() {
	cd "$srcdir/Sonic-1-2-2013-Decompilation"
	make ${MAKEFLAGS:-CXXFLAGS=-O2 -j$(nproc)}

	cd "$srcdir"
	for i in 1 2; do
		sed "s/GAME/sonic$i/" template-launcher > sonic$i-launcher
		sed "s/NAME/Sonic $i/;s/EXEC/sonic$i-launcher/" template.desktop > sonic$i.desktop
	done
}

package() {
	for i in 1 2; do
		install -Dm755 sonic$i-launcher "$pkgdir/usr/bin/sonic$i-launcher"
		install -Dm644 sonic$i.desktop "$pkgdir/usr/share/applications/sonic$i.desktop"
	done

	cd "$srcdir/Sonic-1-2-2013-Decompilation/bin"
	install -Dm755 RSDKv4 "$pkgdir/usr/bin/RSDKv4"
	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
