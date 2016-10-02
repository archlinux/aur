# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: B3nny <benny@b3nny.net>

set -u
pkgname='rush'
pkgver='1.8'
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
md5sums=('50d8bb3c0a502f2c1f5b374046ff78de'
         'dcd87b8bf9738796621030930384f97d')
sha1sums=('e882f68d9004af608b7e5c430c367645aa3e3b75'
          'adb33d34f04846734ec3457517b46fb7a73efa6f')
sha256sums=('dd3b7bfb33570890086218aa049900a9b4d5a9e8d4878a1328e2aa88bb5793ee'
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
  make -s -j "${_nproc}"
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
