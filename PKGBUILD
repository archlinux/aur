# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=icu
pkgname=icu73
pkgver=73.2
pkgrel=4
pkgdesc='International Components for Unicode library (version 73)'
arch=('x86_64')
url="https://icu.unicode.org/"
license=('custom:icu')
conflicts=('icu73-bin')
depends=('gcc-libs' 'sh')
makedepends=('python' 'clang' 'make' 'patch')
provides=(libicu{data,i18n,io,test,tu,uc}.so)
source=("ICU-22512.patch"
        "https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('4323b585827cc2a5ad8fea39e036c5537b4a20bf67959fba185a56f72fb54c54fab89a78602801ed7586a4d7cb9c10f32e72dc386440a99d87105309345d7904'
            '76dd782db6205833f289d7eb68b60860dddfa3f614f0ba03fe7ec13117077f82109f0dc1becabcdf4c8a9c628b94478ab0a46134bdb06f4302be55f74027ce62')

prepare()
{
  cd "${_pkgname}"

  # backport a test fix
  patch -Np2 < "../ICU-22512.patch"
}

build()
{
  cd "${_pkgname}/source"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

check()
{
  cd "${_pkgname}/source"
  make check
}

package()
{
  cd "${_pkgname}/source"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # install license
  install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
