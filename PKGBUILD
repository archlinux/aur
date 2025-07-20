# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('pop-launcher-git' 'pop-shell-plugin-system76-power-git')
pkgbase=pop-launcher-git
pkgver=1.2.4.r14.g8d9da92
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
  'clang'
  'git'
  'just'
  'lld'
)
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

  # Use thin LTO objects
  sed -i 's/lto = "fat"/lto = "thin"/g' Cargo.toml
}

build() {
  cd launcher
  export RUSTUP_TOOLCHAIN=stable
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  CC=clang just build-release --frozen
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
  just rootdir="$pkgdir" install

  rm -rf "$pkgdir/usr/lib/${pkgname%-git}/scripts/system76-power"
}

package_pop-shell-plugin-system76-power-git() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=(
    'gnome-terminal'
    'pop-launcher-git'
    'system76-power'
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}" 'pop-launcher-system76-power')

  cd launcher
  install -d "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/${pkgbase%-git}/scripts"
}
