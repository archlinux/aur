# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: antzek9 <antze.k9 at googlemail dot com>

set -u
_pkgbase='littler'
pkgname="${_pkgbase}-git"
pkgver=0.2.3.r10.g9b56ee2
pkgrel=1
pkgdesc='A hash-bang and simple command line pipe front end for GNU R'
arch=('i686' 'x86_64')
#url="http://code.google.com/p/littler"
url='http://dirk.eddelbuettel.com/code/littler.html'
license=('GPL')
#groups=('science')
makedepends=('make' 'r' 'sh')
source=("http://dirk.eddelbuettel.com/code/littler/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a67abbac4c67b4d8c7dc493f21638da9f7f7ca813811cc36c8c8478b75088655')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgbase}"
  makedepends+=('git')
  _vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  _vcsconflicts=("${pkgname%-git}")
  url="https://github.com/eddelbuettel/${_pkgbase}"
  _verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
  source=("${_srcdir}::${url//https:/git:}.git")
  :;sha256sums=('SKIP')
  provides=("${_pkgbase}=${pkgver%%.r*}")
  conflicts=("${_pkgbase}")
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
else
  _srcdir="${pkgname}-${pkgver}"
  _verwatch=("${url%.html}/" "${pkgname}-\(.*\)\.tar\.gz" 'l')
fi

prepare() {
  set -u
  cd "${_srcdir}"
  # The non git release forgot to run bootstrap so we must run bootstrap.
  # bootstrap requires the git info which doesn't come with the release version.
  if [ "${pkgver}" = '0.2.3' ]; then
    sed -i -e 's:^\(\s\+gitrevision\)=.*$:\1="d0313e5":g' \
           -e 's,^\(\s\+gitdate\)=.*$,\1="Sat Mar 14 08:07:19 2015 -0500",g' \
      'bootstrap'
  fi
  if [ ! -s 'configure' ]; then
    sed -i -e 's:^./configure:exit 0\n&:g' 'bootstrap'
    ./bootstrap
  fi
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make # -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  depends=('r' 'sh')
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
