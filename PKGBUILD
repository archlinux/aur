# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='1.9'
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
md5sums=('271abbfdbf18fadd8dacd0b342ff413f'
         'dcd87b8bf9738796621030930384f97d')
sha1sums=('f1fd69ffb1025601f7bb5aaf7c4857e7e4827043'
          'adb33d34f04846734ec3457517b46fb7a73efa6f')
sha256sums=('e42b6b8fbf0ef0c216aff9fecac8752e7cac322b7f149e4932f6b68435a5d598'
            '159dd2fc0fd4feec5d43cf7763a429b9c2da5c50597b157de9e5b376d9ff85a8')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ "$(vercmp ${pkgver} '1.8')" -lt 0 ]; then
    patch -p1 < "${srcdir}/rush-1.7-glib-2.16-gets.patch"
  fi
  sed -i -e 's:^\s*[^#]:#&:g' 'etc/rush.rc'
  ./configure --prefix='/usr' --sysconfdir='/etc' --localstatedir='/var' --sbindir='/usr/bin'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

check() {
  set -u
  cd "${pkgname}-${pkgver}"
  make check
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
