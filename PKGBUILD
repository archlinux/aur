# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Niklas Baumstark <niklas.baumstark at gmail>
# Contributor: Renato Zannon <renato.riccieri at gmail>
# Contributor: Michael P <ptchinster@archlinux.us>
# Contributor: Achraf cherti <achrafcherti <at> gmail /dot/ com>

set -u
pkgname='redir'
pkgver='3.2'
pkgrel='1'
pkgdesc='Redirect TCP connections'
arch=('i686' 'x86_64')
#url='http://sammy.net/~sammy/hacks/'
url='https://github.com/troglobit/redir'
license=('GPL')
# tcp_wrappers is hard to set up and seems to not work right. running tcpdchk produces errors
depends=('glibc')
#depends+=('tcp_wrappers')
_verwatch=("${url}/releases.atom" "\s\+<title>${pkgname} v\([0-9.]\+\)</title>.*" 'f') # RSS
#source=("http://sammy.net/~sammy/hacks/${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/troglobit/redir/archive/v${pkgver}.tar.gz")
sha256sums=('968eef042ca0fa7a7d6aa0d70da5a5df45d411f239beb8b2a6e9fdaf1da497b1')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  [ -s 'configure' ] || sh 'autogen.sh'
  [ -s 'Makefile' ] || ./configure -prefix='/usr'
  #make clean
  local _deps="${depends[@]}"
  if [ "${_deps/tcp_wrappers/}" != "${_deps}" ]; then
    make WRAP_CFLAGS=" -DUSE_TCP_WRAPPERS" WRAP_LIBS=" -lwrap"
  else
    make
  fi
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
  set +u
}
set +u
