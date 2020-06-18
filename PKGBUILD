# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jack_mixer
pkgname="${_pkgname}-git"
pkgver=11.r270.94b4b21
pkgrel=1
pkgdesc="A GTK based Jack audio mixer (GTK3 git version)"
arch=('x86_64')
url="https://rdio.space/jackmixer/"
license=('GPL2')
depends=('libjack.so' 'python-gobject' 'hicolor-icon-theme')
makedepends=('git')
provides=("${_pkgname}")
conflictss=("${_pkgname}")
source=("${_pkgname}::git+https://repo.or.cz/jack_mixer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(grep '^AC_INIT' configure.ac | sed -E 's/.*, ([0-9]+)\)$/\1/')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr \
    --sysconfdir=/usr/share \
    --disable-schemas-install
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr install
  # Install documentation
  install -Dm644 AUTHORS README NEWS \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
