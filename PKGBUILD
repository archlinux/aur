# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='2.3'
pkgrel='1'
pkgdesc='GNU Restricted User Shell'
arch=('i686' 'x86_64')
url='http://puszcza.gnu.org.ua/software/rush/'
license=('GPL3')
makedepends=('patch')
backup=('etc/rush.rc')
#install='rush.install'
_verwatch=("${url}download.html" "${pkgname}-\([0-9\.]\+\)\.tar.xz" 't')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        'rush-1.7-glib-2.16-gets.patch')
# md5 and sha1 are published by gnu
md5sums=('a1b0efc99714c5d6385c98b2d7d1b01f'
         'dcd87b8bf9738796621030930384f97d')
sha1sums=('6ccce567b260688b23881cdd05c4365f8f3638f6'
          'adb33d34f04846734ec3457517b46fb7a73efa6f')
sha256sums=('8cae258247cd2623e856ea5e2c62cd7f09e9e3e043e6fc63bbd1abec3d3fdd93'
            '159dd2fc0fd4feec5d43cf7763a429b9c2da5c50597b157de9e5b376d9ff85a8')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ "$(vercmp ${pkgver} '1.8')" -lt 0 ]; then
    patch -p1 < "${srcdir}/rush-1.7-glib-2.16-gets.patch"
  fi
  sed -e 's:^\s*[^#]:#&:g' -i 'etc/rush.rc'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --sbindir='/usr/bin'
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -j1 check
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
