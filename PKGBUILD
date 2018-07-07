# Maintainer: kpcyrd <git@rxv.cc>

pkgname=snail
pkgver=0.3.0
pkgrel=1
pkgdesc="Parasitic network manager"
url="https://github.com/kpcyrd/snail"
depends=('zeromq' 'libseccomp' 'dbus' 'dhcpcd')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
backup=('etc/snail/snail.conf')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('260de2f07eba3f4ddc7989ebec4329fff88b2e6fe20ba14564951b0cbc138f9bda146b48d7e9f1e96a8a6ab2137da988cbe2da61b4a4df6ccc7b0c803725038b')

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
  install -Dm644 scripts/* -t "$pkgdir/usr/lib/snaild/scripts"

  install -d "$pkgdir/etc/snail/scripts"
  install -Dm644 contrib/snail.conf -t "$pkgdir/etc/snail"
  install -Dm644 contrib/snail@.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 contrib/snail-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/snail.conf"

  install -d "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/snailctl" bash-completion > "$pkgdir/usr/share/bash-completion/completions/snailctl"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 docs/snail.7 \
                 -t "$pkgdir/usr/share/man/man7"
  install -Dm644 docs/snaild.8 \
                 docs/snailctl.8 \
                 -t "$pkgdir/usr/share/man/man8"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
