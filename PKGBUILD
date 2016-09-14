# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>

pkgname=('enchant-hspell')

_pkgname=enchant
pkgver=1.6.1
pkgrel=1

pkgdesc="An enchant provider plugin which adds support for Hspell backend"
url="https://github.com/AbiWord/enchant"

arch=('any')
license=('LGPL')

depends=("enchant-pure" "hspell")
options=('!libtool')

source=("https://github.com/AbiWord/${_pkgname}/archive/${_pkgname}-${pkgver//./-}.tar.gz"
        "warnings-fix.patch")
sha512sums=('971462f8228a1033536a461ddcd9d4c124df5e9b791bd0e996173f56909345639e37cec0950ee3d9f320d985249df4b492eda70e659386c160a240c7b8572e06'
            'a504286ae22ccbc0b3da009c14c8c85506f8b013305808f1dd664f12a346db354d290e9873a54518e3b56687fef75a474e5b385eed4c81f4227bc25d1fc92e7c')

prepare() {
  mv "${srcdir}/${_pkgname}-${_pkgname}-${pkgver//./-}/" "${srcdir}/${_pkgname}-${pkgver}"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../warnings-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-static=no --disable-ispell --disable-myspell --disable-aspell --disable-voikko --disable-uspell --disable-zemberek --enable-hspell
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -s -m 755 src/hspell/.libs/libenchant_hspell.so "${pkgdir}/usr/lib/enchant/libenchant_hspell.so"
}

