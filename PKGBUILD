# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="cu"
_pkgname="nedko-${_name}"
pkgname="${_pkgname}-git"
pkgver=r17.1405d36
pkgrel=1
pkgdesc="Port of openbsd cu(1) to Linux"
arch=('x86_64')
url="https://github.com/nedko/${_name}"
license=('MIT')
depends=('glibc' 'libbsd' 'libevent')
makedepends=('git')
provides=("${_pkgname}" "${_name}")
conflicts=("${_pkgname}" "${_name}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} -o "${_name}" *.c -D_GNU_SOURCE $(pkg-config --cflags --libs libbsd-overlay libevent)
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${_name}"   "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README"     "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -vDm644 "${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
}
