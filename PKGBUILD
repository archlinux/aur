# derived from postsrsd-git PKGBUILD maintained by
#   Radek Podgorny <radek@podgorny.cz>
#   Thomas Haider <t.haider@deprecate.de>
# maintainer: fordprefect <fordprefect@dukun.de>

pkgname=postsrsd
pkgver=1.4
pkgrel=2
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('cmake' 'help2man')
backup=('etc/postsrsd/postsrsd')
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=(GPL2)
source=('https://github.com/roehling/postsrsd/archive/1.4.tar.gz')
md5sums=('cb6e13a06d6bbd7d383efb9bbf0867ce')

build() {
  cd "$srcdir/postsrsd-$pkgver"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGENERATE_SRS_SECRET=OFF -DCONFIG_DIR=/etc/postsrsd
  make all
}

package() {
  cd "$srcdir/postsrsd-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  #rm -rf $pkgdir/usr/lib
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
  sed -e 's/^\(RUN_AS=\)nobody/#\1postsrsd/;s/\(\/etc\/postsrsd\)\(\.secret\)/\1\/postsrsd\2/' \
      -e 's/^\(# is \).*$/\1localhost\.localdomain/'< postsrsd.default > "$pkgdir/etc/postsrsd/postsrsd"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/postsrsd.service" "$pkgdir/usr/lib/systemd/system/"
}
