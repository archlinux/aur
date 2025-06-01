# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=4.1.0.r11.ge949fe8
pkgrel=1
pkgdesc="A block stacking puzzle game for the Game Boy Advance (Linux port)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://apotris.com/"
license=('AGPL-3.0-only')
depends=('bash' 'glibc' 'sdl2')
makedepends=(
	'git'
	'libogg'
	'libopenmpt'
	'meson'
	'opus'
	'python'
	'sdl2_mixer'
	'xxd'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://gitea.com/akouzoukos/apotris.git"
	"$_pkgname-soloud::git+https://gitea.com/Apotris/SoLoud.git"
	"$_pkgname-tilengine::git+https://gitea.com/Apotris/Tilengine.git"
	"$_pkgname.sh"
	"$_pkgname-install.patch"
	"$_pkgname-use-system-libs.patch"
	"soloud-use-system-libs.patch"
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6a5b652537461135895820391beb20bb2e64e312f08ddbd9ea8d313047118693556df26e89019e81b26c6650388597eebbc8ae4cf824739aadb41121d728ed80'
	'cea1f00d7b0326dfc33d7fb38c881a613d776e7e493ec9ea65c1a64b3d66d512124451ce379a629e4d7462ff5abfcc7102f0761e9c7de5c64b506fa22e33575f'
	'8cf623a7624043e41b63b27bd796538f8e9a37a45d60a7223881baa405ca4a18c2b45d3f4ffd9c9e4e17efb3f505f3314d3e87b34ff4fc5cbe531a3f52371cce'
	'287d56bc52fa3de3dcf9d89a5d104f520c2cc8a0cda4ac3021dee8b0cd0ef38235290cda2f3a84da75d2623e228df2d3a1b4fa6a50565fca5200b1386680e26d'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.subprojects/SoLoud.url ../$_pkgname-soloud
	git config submodule.tilengine.url ../$_pkgname-tilengine
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../$_pkgname-use-system-libs.patch
	patch -Np1 < ../$_pkgname-install.patch
	sed -i 's/data_/apotris_&/' tools/callBin2S.py
	cd subprojects/SoLoud
	patch -Np1 < ../../../soloud-use-system-libs.patch
}

build() {
	arch-meson -D b_lto=false build-linux $_pkgname
	meson compile -C build-linux
}

package() {
	depends+=('libopenmpt.so')
	# shellcheck disable=SC2154
	meson install -C build-linux --destdir "$pkgdir"
	install -Dm755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
}
