# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=soniccd-git
pkgver=r676.7a23c39
pkgrel=1
pkgdesc='A full decompilation of Sonic CD 2011, based on the PC remake with
improvements & tweaks from the mobile remakes.'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation'
license=('custom:RSDKv3/4 Decompilation Source Code License v1')
makedepends=('git' 'pkg-config')
depends=('cmake' 'glew' 'sdl2' 'libogg' 'libtheora' 'libvorbis')
provides=(soniccd)
source=(
	"git+${url}.git"
	'git+https://github.com/leethomason/tinyxml2.git'
	'soniccd-launcher'
	'soniccd.desktop'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'b70b6526c137859385234a19d1935e089c3c6a71639f42f7d579135579e8243b'
	'5ef3e25f5391707fdc461a8c25817ddde38a1d34d125dc5b3c43f706b889ed8a'
)
install=soniccd.install

_safe_cd() {
	if ! cd "$1"; then
		>&2 echo "Directory '$1' not found"
		exit 1
	fi
}

pkgver() {
	_safe_cd "$srcdir/Sonic-CD-11-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	_safe_cd "$srcdir/Sonic-CD-11-Decompilation"
	git submodule init
	git config submodule.libs/dependencies/all/tinyxml2.url "$srcdir/tinyxml2"
	git -c protocol.file.allow=always submodule update
}

build() {
	_safe_cd "$srcdir/Sonic-CD-11-Decompilation"
	cmake -B build
	cmake --build build --config release
}

package() {
	install -Dm755 soniccd-launcher "$pkgdir/usr/bin/soniccd-launcher"
	install -Dm644 soniccd.desktop "$pkgdir/usr/share/applications/soniccd.desktop"
	_safe_cd "$srcdir/Sonic-CD-11-Decompilation"
	install -Dm755 ./build/RSDKv3 "$pkgdir/usr/bin/RSDKv3"
	install -Dm644 ./LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
