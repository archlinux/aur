pkgname=hp-charge-limit-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="Battery charge limiter for HP laptops via ACPI WMI"
url="https://github.com/kralonur/hp-charge-limit-rs"
arch=('x86_64')
license=('MIT OR Apache-2.0')
depends=('acpi_call' 'gcc-libs' 'glibc')
makedepends=('cargo')
backup=('etc/hp-charge-limit-rs.conf')
options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a71bf28e2a58872110d7827c1ef62ec05fe69532ead8ef35c4d96f30b3a992c3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

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
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/hp-charge-limit-rs "$pkgdir/usr/bin/hp-charge-limit-rs"
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
