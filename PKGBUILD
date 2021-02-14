# Maintainer: Lars Christensen <larsch@belunktum.dk>
# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=owamp
pkgver=4.3.3
pkgrel=3
pkgdesc="A tool for performing one-way or two-way active network measurements"
arch=("x86_64")
url="http://software.internet2.edu/owamp/"
install="owamp.install"
license=('Apache')
depends=("glibc" "libcap")
makedepends=("i2util")
source=("https://github.com/perfsonar/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "owamp.install"
  "owamp.sysusers"
  "owamp.tmpfiles"
  "datadir.patch"
  "pidfile.patch")
backup=("etc/owamp-server/owamp-server.conf"
        "etc/owamp-server/owamp-server.limits"
        "etc/twamp-server/twamp-server.conf"
        "etc/twamp-server/twamp-server.limits")
sha256sums=('18b396749647c849b99013b15b27c0cb0e57ce369556cbb19987dfae4090be6f'
            '708169332bd057747b566f77acf6c3cff7beac59ea0e0aa98901a8060d48f216'
            '47ee8cf49956726db26c2386a6c81adc8d2f00ae68abfb2c7d36522a829bbffa'
            '0df00db45d06f01e2f2938f36b54ee2f2a9c70e4b94ac819695c0bb9922810cb'
            '9ea0c30873a0b631477f82619d4a31e609a40531cfb3894418682a1592d50817'
            '07ba6e00bc7a727a12d2853c0bc43bde152c5b4048cc3d7b6770096067cdcf61')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p2 <"$srcdir/datadir.patch"
  patch -p2 <"$srcdir/pidfile.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --force --install
  rm -rf I2util/
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 $srcdir/owamp.sysusers "$pkgdir/usr/lib/sysusers.d/owamp.conf"
  install -Dm644 $srcdir/owamp.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/owamp.conf"

  install -o root -g root -d "$pkgdir/usr/lib/systemd/system"
  install -o root -g root -m 0644 conf/owampd.service "$pkgdir/usr/lib/systemd/system/owampd.service"
  install -o root -g root -m 0644 conf/twampd.service "$pkgdir/usr/lib/systemd/system/twampd.service"

  install -o root -g root -d "$pkgdir/etc/owamp-server"
  install -o root -g root -m 0644 conf/owampd.conf "$pkgdir/etc/owamp-server/owamp-server.conf"
  install -o root -g root -m 0644 conf/owampd.limits "$pkgdir/etc/owamp-server/owamp-server.limits"
  install -o root -g root -d "$pkgdir/etc/twamp-server"
  install -o root -g root -m 0644 conf/twampd.conf "$pkgdir/etc/twamp-server/twamp-server.conf"
  install -o root -g root -m 0644 conf/twampd.limits "$pkgdir/etc/twamp-server/twamp-server.limits"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/owamp/LICENSE"
}

# vim:set ts=2 sw=2 et:
