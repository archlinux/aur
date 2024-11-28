# Maintainer: Renner03 <Renner03@protonmail.com>

pkgname=swaysome-git
_pkgname=swaysome
pkgver=2.1.2.r0.gbc80f6a
pkgrel=1
pkgdesc='AwesomeWM-like workspaces for sway'
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url='https://gitlab.com/hyask/swaysome'
license=('MIT')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
md5sums=('SKIP')


prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_pkgname}"
  cargo test --frozen --all-features
}

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_pkgname}"
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname}/target/release/${_pkgname}"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/${_pkgname}/" "${_pkgname}/LICENSE"
}
