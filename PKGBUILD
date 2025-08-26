# Maintainer: Stunts <stunts@pinamartins.com>
# Contributor: a821

pkgname=plink
pkgver=1.07
pkgrel=3
pkgdesc="Whole genome association analysis toolset"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="http://zzz.bwh.harvard.edu/plink/download.shtml"
depends=('r' 'zlib' 'lapack')
source=(http://zzz.bwh.harvard.edu/plink/dist/${pkgname}-${pkgver}-src.zip
        fix-missing-const.patch
        current_gcc.patch)
sha256sums=('4af56348443d0c6a1db64950a071b1fcb49cc74154875a7b43cccb4b6a7f482b'
            '3e37379fbe113a514f986e1c97f4f4f8d783a2b80fc0ccdf48f655b73a77beb0'
            '12c67022bd73d740066716c06da2765b3aaaaa53b3c6f19eea26b0fa2ecd00f2')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  sed -i 's/WITH_LAPACK = /&1/g' Makefile
  sed -i 's/CXXFLAGS = //' Makefile
  sed -i 's/FORCE_DYNAMIC = /&1/' Makefile
  patch -p1 < ../current_gcc.patch
  patch -p1 < ../fix-missing-const.patch
}

build() {
  cd ${pkgname}-${pkgver}-src
  make
}

package() {
    cd ${pkgname}-${pkgver}-src
    install -D -m 755 plink "${pkgdir}/usr/bin/plink"
}
