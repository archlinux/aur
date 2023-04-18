# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher-git' 'pop-shell-plugin-system76-power-git')
pkgbase=pop-launcher-git
pkgver=1.2.1.r47.gce2ba21
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/launcher"
license=('MPL2')
depends=('dbus' 'fd' 'libqalculate' 'sh' 'xdg-utils')
makedepends=('cargo' 'git' 'just' 'libegl' 'libxkbcommon')
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
  just vendor

  sed -i 's|{{bin-path}}|/usr/bin/pop-launcher|g' justfile

  # change session-lock script icon to one more common
  # so pop-icon-theme is not required
  sed -i 's/locked/object-locked/g' scripts/session/session-lock.sh
}

build() {
  cd "$srcdir/launcher"
  export RUSTUP_TOOLCHAIN=stable
  just build-vendored
}

check() {
  cd "$srcdir/launcher"
  export RUSTUP_TOOLCHAIN=stable
  just check
}

package_pop-launcher-git() {
  pkgdesc="Modular IPC-based desktop launcher service"
  optdepends=('pop-shell-plugin-system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "$srcdir/launcher"
  install -Dm755 "target/release/${pkgname%-git}-bin" "$pkgdir/usr/bin/${pkgname%-git}"

  just rootdir="$pkgdir" install-plugins install-scripts

  rm -rf "$pkgdir/usr/lib/${pkgname%-git}/scripts/system76-power"
}

package_pop-shell-plugin-system76-power-git() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('gnome-terminal' 'system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}" 'pop-launcher-system76-power')
  replaces=('pop-launcher-system76-power-git')

  cd "$srcdir/launcher"
  install -d "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
}
