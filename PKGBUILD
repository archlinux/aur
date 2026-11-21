# Maintainer: bakatrouble bakatrouble@gmail.com
pkgname=steve
pkgver=1.5.2
pkgrel=2
_commit=b4459231c5bd66a3edfcf760bf0ae22b4fb84119
pkgdesc='GNU make-compatible system-wide jobserver with token accounting, implemented via CUSE'
arch=('x86_64')
url='https://codeberg.org/gentoo/steve'
license=('GPL-2.0-or-later')
depends=('fuse3' 'libevent')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf')
backup=("etc/conf.d/$pkgname")
install=$pkgname.install
source=("$pkgname-$_commit.tar.gz::https://codeberg.org/gentoo/steve/archive/$_commit.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "90-$pkgname.rules"
        "$pkgname.confd")
sha256sums=('2f47513d7a0110a0708eaee510cccaf1b0f396e808ac6f8ebe1e963a3253ae0e'
            '8a454fa9fe4599515251b2121e73340b024be61b58e776186b8f749baaee58cd'
            'e5bee5085bd25f6d8dbc3edf5ab7a414bddd697fed633dfd56bff8e88363de0d'
            'e0f5314c54075bf9bc32aa5075ee74d24a6dabbad68c525dc12aa04b1ea478af'
            'f81032fcc41924b5865248be37561ed4be695aba48ce80a5505dc1ed2e6d963a')

build() {
  cd "$srcdir/$pkgname"
  arch-meson . "$srcdir/build" -Dtest=false
  meson compile -C "$srcdir/build"
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C "$srcdir/build" --destdir "$pkgdir"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/90-$pkgname.rules" \
    "$pkgdir/usr/lib/udev/rules.d/90-$pkgname.rules"
  install -Dm644 "$srcdir/$pkgname.confd" "$pkgdir/etc/conf.d/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
