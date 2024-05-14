# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=apotris
pkgname=$_pkgname-git
pkgver=4.0.1.r31.gc696f0d
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
	'SoLoud::git+https://gitea.com/Apotris/SoLoud.git'
	'Tilengine::git+https://gitea.com/Apotris/Tilengine.git'
	"$_pkgname.sh"
	"$_pkgname-install.patch"
	"$_pkgname-use-system-libs.patch"
	'soloud-use-system-libs.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'6a5b652537461135895820391beb20bb2e64e312f08ddbd9ea8d313047118693556df26e89019e81b26c6650388597eebbc8ae4cf824739aadb41121d728ed80'
	'9c5ae4c3ed156cddf6d5caca13d2c8f5afb30e9923e606fe6f2a1dbb654686187ed82cf0155518a726077d49722263e8373fbcea62ac0c978f1e15b888784414'
	'45ac59964e9426f887ae151986da55aa1a3ff35359c7b09db6418bbb422ea34b03900d95cd77ce8973dfc486c8246cd05bb44c45975534f46da695539a3210b0'
	'287d56bc52fa3de3dcf9d89a5d104f520c2cc8a0cda4ac3021dee8b0cd0ef38235290cda2f3a84da75d2623e228df2d3a1b4fa6a50565fca5200b1386680e26d'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.subprojects/SoLoud.url ../SoLoud
	git config submodule.tilengine.url ../Tilengine
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
