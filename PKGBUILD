# Maintainer: Aetf <aetf at unlimited-code dot works>
pkgname=linux-3-finger-drag-git
_pkgname=linux-3-finger-drag
pkgver=1.7.0.r12.gae22def
pkgrel=1
pkgdesc="Three-finger drag gestures for touchpads, as found on macOS"
arch=('x86_64' 'aarch64')
url="https://github.com/lmr97/linux-3-finger-drag"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/3fd-config.json")
install="$pkgname.install"
source=("$_pkgname::git+$url.git"
        '80-linux-3-finger-drag.rules'
        'three-finger-drag.service'
        'uinput.conf')
b2sums=('SKIP'
        '988418e1f14c59ae56ebfddd9c2830fe1afd38b03fc649852516465a713bd6a76d647516260d63b2815d8619c5e7b53930bd7afcea944635eb7026d424d3471d'
        'f9d454942f083a589fb7f588159f86ec6debb16f3135cf6e573e9b5d6b4fb90a1dba571c25193f5527664d3a48732056ebb18c829548354db605060f50721225'
        '6447424a864f4c54320eabc7948c34601f51084ad3d3889ab7cf13a50bff79d79284d9cc25413d2bbb868cca3394dc80dffcdd4cf006c519099a96dcf2196045')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable

  # The integration suite drives real uinput devices and is #[ignore]d
  # upstream, so this runs the pure gesture-machine tests only.
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"

  install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"

  # A system unit, not upstream's user unit -- see the file for why.
  install -Dm0644 "$srcdir/three-finger-drag.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm0644 3fd-config.json -t "$pkgdir/etc/$_pkgname"

  # Not upstream's 60-uinput.rules: that one grants the logged-in user access,
  # which this packaging deliberately does not rely on. See the file for why.
  install -Dm0644 "$srcdir/80-$_pkgname.rules" -t "$pkgdir/usr/lib/udev/rules.d"

  # Guarantees the module is up, so the rule also lands on the real device node.
  install -Dm0644 "$srcdir/uinput.conf" "$pkgdir/usr/lib/modules-load.d/$_pkgname.conf"

  install -Dm0644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
