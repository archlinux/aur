# Maintainer: xeruf <27jf at pm dot me>

_pkgname='instalee'
pkgname="${_pkgname}-git"
pkgver=r70.8322f5b
pkgrel=1
pkgdesc='Unixy universal package installation management'
arch=('any')
url="https://github.com/xeruf/${_pkgname}"
license=(GPL)
depends=()
provides=("${_pkgname}")
conflicts=()
optdepends=()
source=("git+${url}")
sha512sums=('SKIP')

package() {
  set -x
  cd "${srcdir}/${_pkgname}/"
  local usrdir="${pkgdir}/usr"
  local bin="${usrdir}/bin"
  install -D --target-directory "${usrdir}/share/doc/${_pkgname}/" *.md
  install -D --target-directory "${usrdir}/share/man/man1/" "${_pkgname}.1"
  install -D --target-directory "$bin" "${_pkgname}"
  sed -i "s/r%s[^\"]*\"/version ${pkgver}\"/" "$bin/${_pkgname}"
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
