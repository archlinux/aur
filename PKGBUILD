# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('pop-launcher-git' 'pop-shell-plugin-system76-power-git')
pkgbase=pop-launcher-git
pkgver=1.2.1.r66.g6a1b8b9
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/launcher"
license=('MPL-2.0')
depends=(
  'dbus'
  'fd'
  'libqalculate'
  'libegl'
  'libxkbcommon'
  'pop-icon-theme-git'
  'sh'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
options=('!lto')
source=('git+https://github.com/pop-os/launcher.git')
sha256sums=('SKIP')

pkgver() {
  cd launcher
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd launcher
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd launcher
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release --frozen
}

check() {
  cd launcher
  export RUSTUP_TOOLCHAIN=stable
  just check
}

package_pop-launcher-git() {
  pkgdesc="Modular IPC-based desktop launcher service"
  optdepends=('pop-shell-plugin-system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd launcher
  install -Dm755 "target/release/${pkgname%-git}-bin" "$pkgdir/usr/bin/${pkgname%-git}"

  just rootdir="$pkgdir" install-plugins install-scripts

  rm -rf "$pkgdir/usr/lib/${pkgname%-git}/scripts/system76-power"
}

package_pop-shell-plugin-system76-power-git() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('gnome-terminal' 'pop-launcher-git' 'system76-power')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}" 'pop-launcher-system76-power')

  cd launcher
  install -d "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
}
