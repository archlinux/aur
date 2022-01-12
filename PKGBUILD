# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher-git' 'pop-shell-plugin-system76-power-git')
pkgbase=pop-launcher-git
pkgver=1.1.0.r7.g74d1bdf
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/launcher"
license=('MPL2')
depends=('fd' 'gtk3' 'libqalculate')
makedepends=('cargo' 'git')
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
}

build() {
  cd "$srcdir/launcher"
  export RUSTUP_TOOLCHAIN=stable
  make
}

package_pop-launcher-git() {
  pkgdesc="Modular IPC-based desktop launcher service"
  optdepends=('pop-shell-plugin-system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/launcher"
  sed -i "s|${pkgbase%-git}-bin \$(BIN)|${pkgbase%-git}-bin $pkgdir/usr/bin/${pkgbase%-git}|g" Makefile

  make BIN="/usr/bin/${pkgbase%-git}" DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/lib/${pkgbase%-git}/scripts/system76-power"
}

package_pop-shell-plugin-system76-power-git() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('gnome-shell-extension-pop-shell' 'system76-power')
  conflicts=("${pkgname%-git}" 'pop-launcher-system76-power')
  replaces=('pop-launcher-system76-power-git')

  cd "$srcdir/launcher"
  install -d "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
}
