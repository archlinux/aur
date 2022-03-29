# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher-git' 'pop-shell-plugin-system76-power-git')
pkgbase=pop-launcher-git
pkgver=1.2.0.r0.gbacada0
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/launcher"
license=('MPL2')
depends=('fd' 'libqalculate' 'openssl' 'sh')
makedepends=('cargo' 'git' 'just')
options=('!lto')
source=('git+https://github.com/pop-os/launcher.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/launcher"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/launcher"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  sed -i 's|{{bin_path}}|/usr/bin/pop-launcher|g' justfile
}

build() {
  cd "$srcdir/launcher"
  export RUSTUP_TOOLCHAIN=stable
  just
}

package_pop-launcher-git() {
  pkgdesc="Modular IPC-based desktop launcher service"
  optdepends=('pop-shell-plugin-system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/launcher"
  install -Dm755 "target/release/${pkgname%-git}-bin" "$pkgdir/usr/bin/${pkgname%-git}"

  just rootdir="$pkgdir" install_plugins install_scripts

  rm -rf "$pkgdir/usr/lib/${pkgname%-git}/scripts/system76-power"
}

package_pop-shell-plugin-system76-power-git() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('gnome-shell-extension-pop-shell' 'system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}" 'pop-launcher-system76-power')
  replaces=('pop-launcher-system76-power-git')

  cd "$srcdir/launcher"
  install -d "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
}
