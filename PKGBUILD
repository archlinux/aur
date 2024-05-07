# Maintainer: Hannes Körber <hannes@hkoerber.de>
pkgname='screencfg-git'
pkgver=0.1.r0.g1e8bf1d
pkgrel=1
pkgdesc='Automatically configure your screen setup'
arch=('x86_64')
url='https://github.com/hakoerber/screencfg'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=('screencfg')
conflicts=('screencfg')
source=("${pkgname}::git+https://github.com/hakoerber/screencfg#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname/-git}"
}
