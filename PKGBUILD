# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hevi"
pkgname="${_pkgname}-git"
pkgver=1.0.0.r7.g24d9585
pkgrel=1
pkgdesc="A modern hex viewer"
arch=('any')
url="https://arnau478.github.io/${_pkgname}"
_url="https://github.com/Arnau478/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('git' 'zig')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  zig build
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  zig build test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "zig-out/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "doc"
  install -Dm644 "${_pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${_pkgname}"
  install -Dm644 "${_pkgname}.5.man" "${pkgdir}/usr/share/man/man5/${_pkgname}"
}
