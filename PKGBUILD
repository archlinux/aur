# Maintainer: That One Seong <thatoneseong@protonmail.com>

pkgname=sonicmania-git
pkgver=r1163.8278952d
pkgrel=2
pkgdesc='A full decompilation of Sonic Mania.'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-Mania-Decompilation'
license=('custom:RSDKv5(U) DECOMPILATION SOURCE CODE LICENSE v2.1')
makedepends=('git')
depends=(
	'sdl2'
	'libogg'
	'libvorbis'
	'asio'
	'tinyxml2'
	'glfw'
	'glew'
)
source=(
	"git+${url}.git"
	'shadersMod.ini'
	'sonicmania-launcher'
	'sonicmania.desktop'
)
sha256sums=(
	'SKIP'
	'ab10afed573e1f718b7731b0fb71589cd70a622e99b1cf90b6eec1cc54c75cba'
	'391d407e421a610541056eaa3ce681f47eb55c2d06de38ca4f134a573ff370b9'
	'175e883d36669d2613c3f848c255db343f345c4c8fe69074d4564310561db5ee'
)
install=sonicmania.install

pkgver() {
	cd "$srcdir/Sonic-Mania-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/Sonic-Mania-Decompilation"
	git submodule update --init --recursive
	cmake -B build -DRETRO_DISABLE_PLUS=on -DWITH_RSDK=on -DGAME_STATIC=on
	cmake --build build --config release
}

build() {
	cd "$srcdir/Sonic-Mania-Decompilation/build"
	make ${MAKEFLAGS:-CXXFLAGS=-O2 -j$(nproc)}

	cd "$srcdir"
}

package() {
	install -Dm755 sonicmania-launcher "$pkgdir/usr/bin/sonicmania-launcher"
	install -Dm644 sonicmania.desktop "$pkgdir/usr/share/applications/sonicmania.desktop"
	mkdir -p mods/GLShaders/Data
	cp -R "$srcdir"/Sonic-Mania-Decompilation/dependencies/RSDKv5/RSDKv5/Shaders mods/GLShaders/Data
	install -D shadersMod.ini mods/GLShaders/mod.ini
	mkdir -p "$pkgdir"/usr/share/$pkgname
	cp -R mods "$pkgdir"/usr/share/$pkgname

	cd "$srcdir/Sonic-Mania-Decompilation/build/dependencies/RSDKv5"
	install -Dm755 RSDKv5U "$pkgdir/usr/bin/sonicmania"
	install -Dm644 ../../../dependencies/RSDKv5/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
