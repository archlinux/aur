# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='2.4'
pkgrel='1'
pkgdesc='GNU Restricted User Shell'
arch=('i686' 'x86_64')
url='http://puszcza.gnu.org.ua/software/rush/'
license=('GPL-3.0-only')
depends=('glibc' 'bash')
makedepends=('patch')
backup=('etc/rush.rc')
#install='rush.install'
_verwatch=("${url}download.html" "${pkgname}-\([0-9\.]\+\)\.tar.xz" 't')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        'rush-1.7-glib-2.16-gets.patch')
# md5 and sha1 are published by gnu
md5sums=('708e5baa4fa72a1aebefd0952b5d889f'
         'dcd87b8bf9738796621030930384f97d')
sha1sums=('f81d63ea7e8d932a452f5e6f2777f4006ebd6eea'
          'adb33d34f04846734ec3457517b46fb7a73efa6f')
sha256sums=('fa95af9d2c7b635581841cc27a1d27af611f60dd962113a93d23a8874aa060f4'
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
