# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

_gitname='pulseview'
pkgname="${_gitname}-git"
pkgver=pulseview.0.2.0.r513.g7c6cbdd
pkgrel=1
pkgdesc="A Qt based logic analyzer GUI for sigrok. (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git' 'qt5-base' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}"
        'pulseview.desktop')
md5sums=('SKIP'
         'f816b4aff1ddf5683d5df94e69576ec7')
install="${_gitname}.install"

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 ../pulseview.desktop "${pkgdir}/usr/share/applications/pulseview.desktop"
}

# vim:set et sw=2 sts=2 tw=80: