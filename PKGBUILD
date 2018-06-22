# Maintainer: kpcyrd <git@rxv.cc>

pkgname=snail
pkgver=0.1.0
pkgrel=1
pkgdesc="Parasitic network manager"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail.conf')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "snail.conf")
sha512sums=('e3cb2c3efc448bd2e4a3f83f76923bc7d09ace6de28c97b0408ca17e72c423be4928594a73bf76e139a6d19b0a4b89db059d600a8e768957ccb1a669686d7db4'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/snaild \
                 target/release/snailctl \
                 -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/snail.conf" -t "$pkgdir/etc"
  install -Dm644 scripts/* -t "$pkgdir/usr/lib/snaild/scripts"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/snail.7 \
                 -t "$pkgdir/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "$pkgdir/usr/share/man/man8"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
