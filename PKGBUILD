# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: antzek9 <antze.k9 at googlemail dot com>

set -u
_pkgname='littler'
pkgname="${_pkgname}"
pkgver='0.3.12'
pkgrel='1'
pkgdesc='a hash-bang and simple command line pipe front end for GNU R'
arch=('i686' 'x86_64')
#url="http://code.google.com/p/littler"
url='http://dirk.eddelbuettel.com/code/littler.html'
#url="https://github.com/eddelbuettel/${_pkgname}"
license=('GPL')
#groups=('science')
makedepends=('make' 'r' 'sh')
_giturl="https://github.com/eddelbuettel/${_pkgname}"
source=("${_pkgname}-${pkgver}.tar.gz::${_giturl}/archive/${pkgver}.tar.gz")
#source=("http://dirk.eddelbuettel.com/code/littler/${pkgname}_${pkgver}.tar.gz")
#source=("http://http.debian.net/debian/pool/main/l/littler/littler_0.2.3.orig.tar.gz")
md5sums=('2698b70b1464462263bfc45fa0f6c128')
sha256sums=('8bd5be56eb62e9408fc4abb431c1a45c38835f150f98bc5ee03d9d902cdc9879')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgname}"
  makedepends+=('git')
  _vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  _vcsconflicts=("${pkgname%-git}")
  url="https://github.com/eddelbuettel/${_pkgname}"
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
  _verwatch=("${_giturl}/releases.atom" "\s\+<title>littler \([^<]\+\)</title>" 'f') # RSS
fi

prepare() {
  set -u
  cd "${_srcdir}"
  # The non git release forgot to run bootstrap so we must run bootstrap.
  # bootstrap requires the git info which doesn't come with the release version.
  if [ "${pkgver}" = '0.2.3' ] && [ ! -s 'gitversion.h' ]; then
    sed -e 's:^\(\s\+gitrevision\)=.*$:\1="d0313e5":g' \
        -e 's,^\(\s\+gitdate\)=.*$,\1="Sat Mar 14 08:07:19 2015 -0500",g' \
      -i 'bootstrap'
  fi
  if [ "${pkgver}" = '0.3.3' ]; then
    sed -e 's:0\.3\.2:0.3.3:g' -i 'configure.ac' 'configure'
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    sed -i -e 's:^./configure:exit 0\n&:g' 'bootstrap'
    ./bootstrap
  fi
  if [ ! -s 'confi.log' ]; then
    ./configure --prefix='/usr'
  fi
  make -j1 -C 'src' -f 'Makevars'
  set +u
}

package() {
  set -u
  depends=('r' 'sh')
  cd "${_srcdir}"
  #make DESTDIR="${pkgdir}" install
  install -Dpm755 'inst/bin/r' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'inst/man-page/r.1' -t "${pkgdir}/usr/share/man/man1/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
