# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='2.2'
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
md5sums=('8acf915dd6354fd2ff2294faf368adc4'
         'dcd87b8bf9738796621030930384f97d')
sha1sums=('86ae9d9d2a47c56de687af642e488cd895e977f7'
          'adb33d34f04846734ec3457517b46fb7a73efa6f')
sha256sums=('b1fb69dcd2b082cc5bca804307baeec4ed6da77f747df0066c7d1ad2c353797f'
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
