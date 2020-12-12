# derived from postsrsd-git PKGBUILD maintained by
#   Radek Podgorny <radek@podgorny.cz>
#   Thomas Haider <t.haider@deprecate.de>
# maintainer: fordprefect <fordprefect@dukun.de>
# contributor: bertptrs

pkgname=postsrsd
pkgver=1.10
pkgrel=1
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
makedepends=('cmake' 'help2man')
backup=('etc/postsrsd/postsrsd')
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=(GPL2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roehling/postsrsd/archive/${pkgver}.tar.gz"
        "postsrsd.conf")
md5sums=('34ba7d074c9c3b365d520bfda4e9d88e'
         'dd002a74bd323a7ea315da4ef2df79dc')

check() {
  cd "$srcdir/postsrsd-$pkgver/build"
  make test
}

build() {
  cd "$srcdir/postsrsd-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGENERATE_SRS_SECRET=OFF -DCONFIG_DIR=/etc/postsrsd
  make all
}

package() {
  cd "$srcdir/postsrsd-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 "$srcdir/postsrsd.conf" "$pkgdir/usr/lib/sysusers.d/postsrsd.conf"

  #rm -rf $pkgdir/usr/lib
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
  sed -e 's/^\(RUN_AS=\)nobody/#\1postsrsd/;s/\(\/etc\/postsrsd\)\(\.secret\)/\1\/postsrsd\2/' \
      -e 's/^\(# is \).*$/\1localhost\.localdomain/'< postsrsd.default > "$pkgdir/etc/postsrsd/postsrsd"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/postsrsd.service" "$pkgdir/usr/lib/systemd/system/"
}
