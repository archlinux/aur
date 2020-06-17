# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Julien <paci79@free.fr>

set -u
pkgname='paris-traceroute'
pkgver='0.93'
pkgrel='1'
pkgdesc='Paris traceroute is a new version of the well-known network diagnosis and measurement tool'
arch=('i686' 'x86_64')
url='http://www.paris-traceroute.net'
_giturl='https://github.com/libparistraceroute/libparistraceroute'
license=('GPL')
depends=('glibc')
#_srcdir='paris-traceroute-current'
_srcdir="libparistraceroute-${pkgver}"
source=(
  #"http://www.paris-traceroute.net/downloads/paris-traceroute-${pkgver}-dev.tar.gz"
  "${_srcdir}.tar.gz::${_giturl}//archive/v${pkgver}.tar.gz"
  '0000-whois.c-BUFFER_SIZE-overflow.patch'
)
md5sums=('ac7c0583ed97c55481ef126a56d4eb87'
         '89edd8047c18b4ee88d7853400baf059')
sha512sums=('505de465454c349adea936637a097bb3f812f010665825badfc97751e9219325d04d8af78ac6d107e66ff6ef02a8cda1559b8073906d36a745115cd54104a8b4'
            '7c36c814f8b8c219ddc7be6bf22210e5565b0e6b504256de41ba14a084cf9a380bf9d70f440badb48429a3d4843f7b9e75fab44aa3984d0e16a19bfa32e97df9')

prepare() {
  set -u
  cd "${_srcdir}"

  patch -Nup1 -i "${srcdir}/0000-whois.c-BUFFER_SIZE-overflow.patch"
  rm -f 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  if [ ! -s 'configure' ]; then
    ./autogen.sh
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr'
  fi
  make
  set +u
}

package() {
  set +u
  cd "${_srcdir}"

  make prefix="${pkgdir}/usr" install
  mv "${pkgdir}/usr/bin/"{ping,pinglt}
  chmod +s "${pkgdir}/usr/bin"/*
  #install -Dpm644 "man/${pkgname}.8" -t "${pkgdir}/usr/share/man/man8/"
  #install -Dpm644 'doc/tupleroute.dia' -t "${pkgdir}/usr/share/${pkgname}/"
  set -u
}
set +u
