# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="libutf8proc"
_so="2"
pkgname="${_basename}${_so}"
pkgver=2.8.0
pkgrel=2
pkgdesc="C library for processing UTF-8 encoded Unicode strings (so-version ${_so})"
arch=('i686' 'x86_64')
url="https://github.com/JuliaStrings/utf8proc"
license=('custom')
depends=('glibc')
provides=("${_basename}.so")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0a60a79fe6f6d54e7d411facbfcc867a6e198608f2cd992490e46f04b1bcecc')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS}" LDFLAG_SHARED="${LDFLAGS} -shared"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make \
    prefix="${pkgdir}/usr" \
    libdir="${pkgdir}/usr/lib/${pkgname}" \
    includedir="${pkgdir}/usr/include/${pkgname}" \
    install

  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "${pkgdir}/usr/lib/${pkgname}"
  for lib in *.so.*; do
    ln -sf "/usr/lib/${pkgname}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
}
