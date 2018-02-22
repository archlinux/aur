# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='pico'
pkgver='2.00'
pkgrel='2'
pkgdesc='the real pico text editor from the Alpine Messaging System'
arch=('i686' 'x86_64')
url='http://www.washington.edu/alpine/'
license=('apache')
depends=('ncurses')
makedepends=('gcc')
source=("http://ftp.swin.edu.au/alpine/alpine-${pkgver}.tar.bz2")
sha256sums=('c85db8405af90375ba2440c85b7952d80996154e9916b83acca558dc82e0a2a6')

prepare() {
  set -u
  cd "${srcdir}/alpine-${pkgver}"
  # Disabling pam gets the Alpine make farther but then it crashes on a TCP error
  sed -i -e 's:pam_start:pomme_start:g' 'configure'
  ./configure --prefix='/usr' --without-ldap --without-ssl --without-krb5 --target 'slx'
  set +u
}

build() {
  set -u
  cd "${srcdir}/alpine-${pkgver}"
  make -s c-client
  make -s c-client.d
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}" -C 'pith'
  nice make -s -j "${_nproc}" -C 'pico'
  # making Alpine crashes on pam errors
  set +u
}

package() {
  set -u
  cd "${srcdir}/alpine-${pkgver}"
  make DESTDIR="${pkgdir}" install -C 'pico'
  rm -f "${pkgdir}/usr/bin"/{pilot,alpine,rpdump,rpload}
  install -Dpm644 'doc/pico.1' -t "${pkgdir}/usr/share/man/man1/"
  set +u
}
set +u
