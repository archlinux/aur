# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=ddb_medialib
pkgname=deadbeef-plugin-medialib-git
pkgver=r100.g8111116
pkgrel=1
pkgdesc="DeaDBeeF media library plugin"
arch=('i686' 'x86_64')
url="https://github.com/sgomin/ddb_medialib"
license=('custom')
depends=('deadbeef-git' 'gtkmm3' 'boost')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/sgomin/${_pkgname}"
        "${_pkgname}-makefile.patch"
        "${_pkgname}-iostream.patch")
sha256sums=('SKIP'
            '979ec8cf3836a906dc70836fe2141438501a1ac450735dd2b5c3166a25c594d4'
            '665b1f8c2571f8ad8b556856300ccdae8ce44cd256e43e2c73525ce54591ba61')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  # Arch compile FLAGS
  patch -p1 -i ../${_pkgname}-makefile.patch

  # Fix missing iostream includes
  patch -p1 -i ../${_pkgname}-iostream.patch
}

build() {
  cd "${_pkgname}"
  make COPT="${CFLAGS}" CXXOPT="${CXXFLAGS}"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
