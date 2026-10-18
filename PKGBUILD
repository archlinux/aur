# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: antzek9 <antze.k9 at googlemail dot com>

set -u
_pkgname='littler'
pkgname="${_pkgname}"
#pkgname+='-git'
pkgver='0.3.23'
pkgrel=1
pkgdesc='a hash-bang and simple command line pipe front end for GNU R'
arch=('i686' 'x86_64')
#url="http://code.google.com/p/littler"
url='https://dirk.eddelbuettel.com/code/littler.html'
#url="https://github.com/eddelbuettel/littler"
license=('GPL-2.0-or-later')
#groups=('science')
depends=('glibc')
makedepends=('make' 'r')
_giturl="https://github.com/eddelbuettel/${_pkgname}"
source=("https://cran.r-project.org/src/contrib/littler_${pkgver}.tar.gz")
#source=("${_pkgname}-${pkgver}.tar.gz::${_giturl}/archive/${pkgver}.tar.gz")
#source=("http://dirk.eddelbuettel.com/code/littler/${pkgname}_${pkgver}.tar.gz")
#source=("http://http.debian.net/debian/pool/main/l/littler/littler_0.2.3.orig.tar.gz")
md5sums=('2b59a79ed011e040a5018bc07ba53041')
sha256sums=('c7d47e41589123d559e54d11999902bb86c5799e12777586638b99b54526110c')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  _srcdir="${_pkgname}"
  makedepends+=('git')
  #_vcsprovides=("${pkgname%-git}=${pkgver%%.r*}")
  #_vcsconflicts=("${pkgname%-git}")
  source=("${_srcdir}::git+${_giturl}.git")
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
pkgver() {
  local -; set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
else
  _srcdir="${pkgname}-${pkgver}"
  _srcdir="${pkgname}"
  _verwatch=("${_giturl}/releases.atom" "\s\+<title>littler \([^<]\+\)</title>" 'f') # RSS
fi

prepare() {
  local -; set -u
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
}

build() {
  local -; set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    sed -i -e 's:^./configure:exit 0\n&:g' 'bootstrap'
    ./bootstrap
  fi
  if [ ! -s 'src/Makevars' ]; then
    ./configure --prefix='/usr'
    sed -e 's:/usr/lib64/:/usr/lib/:g' -i 'src/Makevars'
  fi
  make -j1 -C 'src' -f 'Makevars'
}

package() {
  local -; set -u
  depends+=('r')
  cd "${_srcdir}"
  #make DESTDIR="${pkgdir}" install
  install -Dpm755 'inst/bin/r' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'inst/man-page/r.1' -t "${pkgdir}/usr/share/man/man1/"
}
set +u

# vim:set ts=2 sw=2 et:
