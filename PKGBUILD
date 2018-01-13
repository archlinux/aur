# Maintainer: kpcyrd <git@rxv.cc>

pkgname=tr1pd
pkgver=0.2.0
pkgrel=1
pkgdesc="tamper resistant audit log"
url="https://github.com/kpcyrd/tr1pd"
depends=('gcc-libs' 'libsodium')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('AGPL3')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('99bb90514ff0ca20bf2b69d14453c525bcfe0ac460217569339a41fc605fb125849d67c7aee90eaaa4c334f6470edfdaf6b4e005bacb1ecdd9e1bcdfd5d25a1b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tr1pd target/release/tr1pctl -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"

  install -Dm644 "docs/tr1pd.service" "$pkgdir/usr/lib/systemd/system/tr1pd.service"
  install -Dm644 "docs/tr1pd-sysuser.conf" "$pkgdir/usr/lib/sysusers.d/tr1pd.conf"
  install -Dm644 "docs/tr1pd-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tr1pd.conf"

  install -d "$pkgdir/etc/bash_completion.d"
  "$pkgdir/usr/bin/tr1pd" bash-completion > "$pkgdir/etc/bash_completion.d/tr1pd"
  "$pkgdir/usr/bin/tr1pctl" bash-completion > "$pkgdir/etc/bash_completion.d/tr1pctl"
}

# vim:set ts=2 sw=2 et:
