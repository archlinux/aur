# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

pkgname=icu73
pkgver=73.2
pkgrel=7
pkgdesc='International Components for Unicode library (version 73)'
arch=(x86_64)
url="https://icu.unicode.org"
license=('LicenseRef-Unicode-3.0'
         'BSD-2-Clause'
         'BSD-3-Clause'
         'NAIST-2003')
depends=('gcc-libs' 'glibc' 'sh')
conflicts=('icu73-bin')
makedepends=('python')
provides=(libicu{data,i18n,io,test,tu,uc}.so=73-64)
source=(ICU-22512.patch
        https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz)
sha512sums=('4323b585827cc2a5ad8fea39e036c5537b4a20bf67959fba185a56f72fb54c54fab89a78602801ed7586a4d7cb9c10f32e72dc386440a99d87105309345d7904'
            '76dd782db6205833f289d7eb68b60860dddfa3f614f0ba03fe7ec13117077f82109f0dc1becabcdf4c8a9c628b94478ab0a46134bdb06f4302be55f74027ce62')

prepare() {
  cd icu/source

  # backport a test fix
  patch -Np3 < "../../ICU-22512.patch"
}

build() {
  cd icu/source
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

## buffer overflow in test-suite: ssearch::offsetTest
## and unittest.makeSuite() has been removed from Python 3.13
#check() {
#  cd icu/source
#  make check
#}

package() {
  cd icu/source
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/include/unicode{,-73}
  rm -rf "${pkgdir}"/usr/{bin,share,lib/{icu,pkgconfig,*.so}}

  # Install license
  install -Dm644 "${srcdir}"/icu/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
