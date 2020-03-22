# $Id$
# Maintainer: Julio Campagnolo <juliocampagnolo@gmail.com>

pkgname=('armorpaint-git')
_pkgname='armorpaint'
pkgver=1209
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="ArmorPaint is a software for 3D PBR texture painting"
url="https://armorpaint.org/"
license=('ZLIB')
depends=('mesa' 'alsa-lib' 'libxinerama' 'gcc-libs')
makedepends=('git' 'nodejs' 'clang' 'make' 'gcc')
source=("git+https://github.com/armory3d/armorpaint"
        "armorpaint.sh"
        "armorpaint.desktop"
        "armorpaint.png")
md5sums=(SKIP
         "728cc52bfa9e7b16390459e7a80fad16"
         "dd5d97aadd39966ff7d9dda68b5ae29a"
         "67cf4a0cb08c66c4a68c677885e8ac99")

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
    cd ${srcdir}/${_pkgname}
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/${_pkgname}"
    node Kromx/make -g opengl
    cd Kromx
    node Kinc/make -g opengl --compiler clang --compile
    cd Deployment
    strip Krom
}

package() {
	cd "$srcdir"/"$_pkgname"
	mkdir -p ${pkgdir}/usr/{bin,share,lib}
	mkdir -p ${pkgdir}/usr/lib/armorpaint
	install -Dm755 ${srcdir}/armorpaint.sh ${pkgdir}/usr/bin/armorpaint
	install -Dm644 LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm755 "Kromx/Deployment/Krom" ${pkgdir}/usr/lib/armorpaint/
	install -Dm644 ${srcdir}/armorpaint.desktop ${pkgdir}/usr/share/applications/armorpaint.desktop
	mkdir -p ${pkgdir}/usr/share/armorpaint
	cp -r build/krom ${pkgdir}/usr/share/armorpaint/krom
	install -Dm644 ${srcdir}/armorpaint.png ${pkgdir}/usr/share/icons/armorpaint.png
}
