# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgname=vala-panel
pkgname=${_pkgname}-git
_cmakename=cmake-vala
_dbusmenuname=vala-dbusmenu
pkgver=0.2.3
pkgrel=3
pkgdesc="Gtk3 panel for compositing window managers"
url="https://github.com/rilian-la-te/vala-panel"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gtk3' 'libwnck3' 'libpeas')
makedepends=('cmake' 'vala')
provides=('vala-panel=0.2.3')
install=vala-panel.install
optdepends=('vala-panel-appmenu-valapanel: Global Menu')
source=("git://github.com/rilian-la-te/${_pkgname}.git"
        "git://github.com/rilian-la-te/${_cmakename}.git"
        "git://github.com/rilian-la-te/${_dbusmenuname}.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_cmakename}"
  cp -r . "${srcdir}/${_pkgname}/cmake"
  cd "${srcdir}/${_dbusmenuname}"
  cp -r . "${srcdir}/${_pkgname}/lib/dbusmenu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_WNCK=ON
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}


