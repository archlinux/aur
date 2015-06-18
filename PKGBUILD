# Maintainer: Thomas Haider <t.haider@deprecate.de>

pkgname=postsrsd-git
pkgver=85.90718d7
pkgrel=1
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
provides=(postsrsd)
conflicts=(postsrsd)
arch=(i686 x86_64)
depends=('glibc')
makedepends=('cmake' 'help2man')
backup=('etc/postsrsd/postsrsd.conf')
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=(GPL2)
source=('git+https://github.com/roehling/postsrsd.git' 'postsrsd.service')
sha1sums=('SKIP'
          'b30e40b2f012ce45a8b04ede1f1f025facbb44f9')

pkgver() {
  cd "$srcdir/postsrsd"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/postsrsd"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGENERATE_SRS_SECRET=OFF 
  make all
}

package() {
  cd "$srcdir/postsrsd/build"
  make DESTDIR="$pkgdir/" install
  
  rm -rf $pkgdir/usr/lib
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
  sed -e 's/^\(RUN_AS=\)nobody/#\1postsrsd/;s/\(\/etc\/postsrsd\)\(\.secret\)/\1\/postsrsd\2/' \
	  -e 's/^\(# is \).*$/\1localhost\.localdomain/'< postsrsd.default > postsrsd.conf
  install -D -m644 "postsrsd.conf" "$pkgdir/etc/postsrsd/postsrsd.conf"
  install -D -m644 "$srcdir/postsrsd.service" "$pkgdir/usr/lib/systemd/system/postsrsd.service"
}
