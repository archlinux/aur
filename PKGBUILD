# Maintainers:
#   Radek Podgorny <radek@podgorny.cz>
#   Thomas Haider <t.haider@deprecate.de>

pkgname=postsrsd-git
pkgver=127.39f68b5
pkgrel=2
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
source=('git+https://github.com/roehling/postsrsd.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/postsrsd"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/postsrsd"
  ###sed -e 's|${SYSCONF_DIR}/systemd/system|/usr/lib/systemd/system|g' -i postinstall.cmake.in
  rm -rf build
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
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -D -m644 "postsrsd.systemd" "$pkgdir/usr/lib/systemd/system/postsrsd.service"
}
