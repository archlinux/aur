pkgname=postsrsd
pkgver=2.0.2
pkgrel=1
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc')
makedepends=('cmake' 'help2man')
backup=("etc/$pkgname/$pkgname.conf" "etc/$pkgname/$pkgname.secret" "etc/$pkgname/$pkgname")    #last entry is legacy from version 1
url="https://github.com/roehling/$pkgname"
install=$pkgname.install
license=(GPL2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roehling/$pkgname/archive/${pkgver}.tar.gz"
        "${pkgname}.install" "sysusers.d-$pkgname.conf" "tmpfiles.d-$pkgname.conf")
md5sums=('47c93ba758aee373675fa228c5febeda'
         '4b12fbf341433767850a571128199bad'
         'cee1be46359eb9b6a44d1fac3cbc718b'
         'bb1644c030c69054a9d083a6f1245d50')

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make test
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGENERATE_SRS_SECRET=OFF -DCONFIG_DIR=/etc/$pkgname -DINIT_FLAVOR=systemd
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/var/spool/postfix/srs"
  chown postsrsd:root "$pkgdir/var/spool/postfix/srs"

  # dont use sbin anymore
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  # install configs
  install -Dm644 "$srcdir/sysusers.d-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/tmpfiles.d-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/$pkgname.conf" "$pkgdir/etc/$pkgname/$pkgname.conf"

  # patch config
  sed -i "s#/etc/$pkgname.conf#/etc/$pkgname/$pkgname.conf#g" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  sed -i "s#sbin#bin#g" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  sed -i "s#/etc/$pkgname.secret#/etc/$pkgname/$pkgname.secret#g" "$pkgdir/etc/$pkgname/$pkgname.conf"
}
