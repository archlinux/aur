pkgname=hp-charge-limit-rs-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Battery charge limiter for HP laptops via ACPI WMI"
url="https://github.com/kralonur/hp-charge-limit-rs"
arch=('x86_64' 'aarch64')
license=('MIT OR Apache-2.0')
depends=('acpi_call')
provides=("hp-charge-limit-rs=$pkgver")
conflicts=('hp-charge-limit-rs')
backup=('etc/hp-charge-limit-rs.conf')
options=('!debug' '!strip')

source_x86_64=("$url/releases/download/v$pkgver/hp-charge-limit-rs-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('a13be5208bde2811545466e07c0a83f3e6d30254201978add67f94d8f51e0a9d')
sha256sums_aarch64=('799fa1ef0a62dc48f84d300a551da226349a8d71d624e5d433bddc785ad00819')
source_aarch64=("$url/releases/download/v$pkgver/hp-charge-limit-rs-v$pkgver-aarch64-unknown-linux-musl.tar.gz")

_install_completions() {
  local _cmd="$1"

  "$pkgdir/usr/bin/$_cmd" completions bash > "$srcdir/$_cmd.bash"
  "$pkgdir/usr/bin/$_cmd" completions zsh > "$srcdir/$_cmd.zsh"
  "$pkgdir/usr/bin/$_cmd" completions fish > "$srcdir/$_cmd.fish"
  "$pkgdir/usr/bin/$_cmd" completions elvish > "$srcdir/$_cmd.elvish"
  "$pkgdir/usr/bin/$_cmd" completions powershell > "$srcdir/$_cmd.ps1"

  install -Dm644 "$srcdir/$_cmd.bash" "$pkgdir/usr/share/bash-completion/completions/$_cmd"
  install -Dm644 "$srcdir/$_cmd.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_cmd"
  install -Dm644 "$srcdir/$_cmd.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_cmd.fish"
  install -Dm644 "$srcdir/$_cmd.elvish" "$pkgdir/usr/share/elvish/lib/$_cmd.elv"
  install -Dm644 "$srcdir/$_cmd.ps1" "$pkgdir/usr/share/powershell/Completions/$_cmd.ps1"
}

package() {
  cd "$srcdir/hp-charge-limit-rs-v$pkgver-$CARCH-unknown-linux-musl"
  install -Dm755 hp-charge-limit-rs "$pkgdir/usr/bin/hp-charge-limit-rs"
  install -Dm644 packaging/hp-charge-limit-rs.service \
    "$pkgdir/usr/lib/systemd/system/hp-charge-limit-rs.service"
  install -Dm644 packaging/hp-charge-limit-rs.conf "$pkgdir/etc/hp-charge-limit-rs.conf"
  install -Dm644 packaging/io.github.kralonur.HpChargeLimit.conf \
    "$pkgdir/usr/share/dbus-1/system.d/io.github.kralonur.HpChargeLimit.conf"
  install -Dm644 packaging/io.github.kralonur.HpChargeLimit.Notify.desktop \
    "$pkgdir/etc/xdg/autostart/io.github.kralonur.HpChargeLimit.Notify.desktop"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  _install_completions hp-charge-limit-rs
}
