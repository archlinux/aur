# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u
pkgname='conserver'
pkgver='8.2.2'
pkgrel='1'
pkgdesc='An application that allows multiple users to watch a serial console at the same time.'
arch=('i686' 'x86_64')
url='https://www.conserver.com'
license=('BSD')
depends=('sh')
#_verwatch=("${url}/CHANGES" 'version \([^ ]\+\) .*' 'f')
_giturl='https://github.com/conserver/conserver'
_verwatch=("${_giturl}/releases.atom" '\s\+<link rel="alternate" type="text/html" href=".*/'"${_giturl##*/}"'/releases/tag/v\?\([^"]\+\)"/>.*' 'f') # RSS
_srcdir="${_giturl##*/}-${pkgver}"
source=("${_srcdir}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz")
sha256sums=('c5cc773634f0a4730f6d8d749ea1b9174f21bdefecac9dc1ae987e8de03f704f')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 test
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 bindir="${pkgdir}/usr/bin" \
    mandir="${pkgdir}/usr/share/man" \
    sbindir="${pkgdir}/usr/bin/" \
    libdir="${pkgdir}/usr/lib" \
    datadir="${pkgdir}/usr/share/${pkgname}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
