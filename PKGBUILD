# Maintainer: Sulhan <ms at kilabit.info>
pkgname=pgmodeler-git
pkgver=v0.9.2.beta2.r56.gea971caa
pkgrel=1
pkgdesc="PostgreSQL Database Modeler"
arch=('i686' 'x86_64')
url="http://www.pgmodeler.com.br"
license=('GPL3')
install=${pkgname}.install
depends=('qt5-base' 'libxml2' 'postgresql-libs' 'desktop-file-utils')
makedepends=('git' 'patch')
provides=('pgmodeler')
conflicts=('pgmodeler')
source=(
  "${pkgname}::git+https://github.com/pgmodeler/pgmodeler.git#branch=develop"
  "pgmodeler.desktop"
  "pgmodeler-git.install"
)
md5sums=(
  'SKIP'
  'cfc645148c08399b2678d0dd68857706'
  'ea9cce04170c669434a402c966d257f9'
)

_prefix="/usr"

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    # Only uses annotated tags to derive a version number,
    # add --tags to use un-annotated tags as well
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake pgmodeler.pro PREFIX="${pkgdir}${_prefix}" RPATHDIR="${_prefix}/lib/pgmodeler"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
  install -D -m 0644 "${srcdir}/pgmodeler.desktop" "${pkgdir}/usr/share/applications/pgmodeler.desktop"
}

# vim:set ts=2 sw=2 et:
