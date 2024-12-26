# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
#pkgname+='-git'
pkgver='0.4.9.b462'
pkgrel=1
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll'
license=('LGPL-2.1-only')
depends=('glibc' 'openssl')
#_verwatch=("${url}/downloads/" "nopoll-\(.*\)\.tar\.gz" 'l')
_giturl='https://github.com/ASPLes/nopoll'
_verwatch=("${_giturl}/releases.atom" '\s\+<link rel="alternate" type="text/html" href=".*/'"${_giturl##*/}"'/releases/tag/v\?\([^"]\+\)"/>.*' 'f') # RSS
_srcdir="${pkgname}-${pkgver}"
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
md5sums=('d7de814fe41c1bd1c75d08c98ad6d071')
sha256sums=('80bfa3e0228e88e290dd23eb94d9bb1f4d726fb117c11cfb048cbdd1d71d379a')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  makedepends+=('git')
  provides=("${pkgname%-*}=${pkgver%.r*}")
  conflicts=("${pkgname%-*}")
  _srcdir='nopollgit'
  source[0]="${_srcdir}::git://github.com/ASPLes/nopoll.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  pkgver() {
    #cat "${_srcdir}/VERSION"
    cd "${_srcdir}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  }
else
  true # && pkgver="${pkgver%.b*}"
fi

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    ./autogen.sh --prefix='/usr'
  elif [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --enable-maintainer-mode
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}/" install
  set +u
}
set +u
