# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

set -u
_pkgname='libgxps'
pkgname='libgxps-git'
pkgver=0.2.4.r0.ga4ef10a
pkgrel=1
pkgdesc='An XPS Documents library'
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/${_pkgname}/"
license=('GPL')
depends=('cairo' 'libarchive' 'libtiff')
makedepends=('git' 'gnome-common' 'gtk-doc' 'gobject-introspection')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
_verwatch=("${url}" "/browse/${_pkgname}/snapshot/${_pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
source=("git://git.gnome.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
  set +u
}

prepare() {
  set -u
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix='/usr'
  ./configure --prefix='/usr' --disable-test
  set +u
}

build() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install # This generates some /usr/lib errors
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  ! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u
