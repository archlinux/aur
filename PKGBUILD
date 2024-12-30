# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

_Name="Cello"
_name="${_Name,,}"
pkgname="lib${_name}"
_commit_rel="da28eefbc95d8bd5628e5f1c4cc12bc1b13fef4f" # 2.1.0
_commit="61ee5c3d9bca98fd68af575e9704f5f02533ae26" # r25
pkgver="2.1.0+r25+g${_commit::7}"
pkgrel=2
pkgdesc="Higher level programming library in C"
arch=('x86_64')
url="https://libcello.org"
_url="https://github.com/orangeduck/${_Name}"
license=('BSD-2-Clause')
depends=('glibc')
provides=("lib${_Name}.so")
_pkgsrc="${_Name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('89c928bf356b9dcb563ed9f287771be1279a4b5a2c5c266c0a6bc575ce1ec037')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} -I./include -fPIC" LFLAGS="${LDFLAGS}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make CFLAGS="${CFLAGS} -I./include -fPIC" LFLAGS="${LDFLAGS}" check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # make install PREFIX="${pkgdir}/usr"

  find "include" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "lib${_Name}.so" "${pkgdir}/usr/lib/lib${_Name}.so.${pkgver%%+*}"
  install -vDm644 "lib${_Name}.a"  "${pkgdir}/usr/lib/lib${_Name}.a"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "${pkgdir}/usr/lib"
  ln -vs "lib${_Name}.so.${pkgver%%+*}" "lib${_Name}.so.${pkgver%%.*}"
  ln -vs "lib${_Name}.so.${pkgver%%+*}" "lib${_Name}.so"
}
