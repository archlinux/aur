# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=cppcms
pkgver=1.2.1
pkgrel=2
pkgdesc="CppCMS is the web development framework written in C++, that is aimed on development of high performance web application."
arch=('i486' 'i686' 'pentium4' 'x86_64')
url="http://cppcms.sourceforge.net/"
license=('LGPL')
depends=('pcre' 'zlib')
makedepends=('cmake' 'python2')
optdepends=(
  'sqlite: Sqlite3 session storage.'
  'db: Berkeley DB session storage.'
  'cppdb: CppDB session storage.'
  'openssl'
  'gnutls'
)
conflicts=('cppcms' 'libcppcms' 'libbooster')
provides=('cppcms' 'libcppcms' 'libbooster')
source=("cppcms-$pkgver.tar.bz2::http://sourceforge.net/projects/cppcms/files/cppcms/$pkgver/cppcms-$pkgver.tar.bz2/download")
sha256sums=('10fec7710409c949a229b9019ea065e25ff5687103037551b6f05716bf6cac52')

build() {
  cd "$srcdir/cppcms-$pkgver"
  find . -type f -print0 | xargs -0 sed -ri 's;/usr/bin/(|env )python$;&2;g'
  sed -ri 's;(PYTHON NAMES python2) python;\1;g' CMakeLists.txt

  rm -rf "$srcdir/cppcms-build"
  mkdir -p "$srcdir/cppcms-build"
  cd "$srcdir/cppcms-build"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/cppcms-$pkgver"
  make
}

package() {
  cd "$srcdir/cppcms-build"
  make DESTDIR="$pkgdir" install
}
