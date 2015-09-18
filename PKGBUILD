# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: antzek9 <antze.k9 at googlemail dot com>

set -u
_pkgname='littler'
pkgname="${_pkgname}"
pkgver=0.2.3
pkgrel=1
pkgdesc='A hash-bang and simple command line pipe front end for GNU R'
arch=('i686' 'x86_64')
#url="http://code.google.com/p/littler"
url='http://dirk.eddelbuettel.com/code/littler.html'
license=('GPL')
#groups=('science')
makedepends=('make' 'r' 'sh')
#_giturl="https://github.com/eddelbuettel/${_pkgname}"
#source=("${_pkgname}-${pkgver}.tar.gz::${_giturl}/archive/${pkgver}.tar.gz")
source=("http://dirk.eddelbuettel.com/code/littler/${pkgname}-${pkgver}.tar.gz")
#source=("http://http.debian.net/debian/pool/main/l/littler/littler_0.2.3.orig.tar.gz")
sha256sums=('98cd741c68a5c8f65b06c96d2f56d3b44979b3990335e7869b002c005ef80ba7')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgname}"
  makedepends+=('git')
  _vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  _vcsconflicts=("${pkgname%-git}")
  url="https://github.com/eddelbuettel/${_pkgname}"
  _verwatch=("${url}/releases" "${url#*github.com}/archive/\(.*\)\.tar\.gz" 'l')
  source=("${_srcdir}::${url//https:/git:}.git")
  :;sha256sums=('SKIP')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
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
  if [ "${pkgver}" = '0.2.3' ] && [ ! -s 'gitversion.h' ]; then
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
