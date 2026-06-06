# Maintainer: Robin Marchart <robin.marchart at gmail dot com>
pkgname='jellyhaj-git'
pkgver=v0.2.0.r1.gd519137
pkgrel=1
pkgdesc="Terminal client for Jellyfin reimplementing parts of the web ui"
arch=('x86_64' 'aarch64')
url="https://github.com/owo-uwu-nyaa/jellyhaj"
license=('MIT')
depends=('mpv' 'sqlite' 'dbus')
makedepends=('cargo' 'clang' 'git')
provides=('jellyhaj')
conflicts=('jellyhaj')
options=(!lto)
source=('git+https://github.com/owo-uwu-nyaa/jellyhaj.git')
sha256sums=('SKIP')

prepare() {
  cd "jellyhaj" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

pkgver() {
  cd "jellyhaj" || exit
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "jellyhaj" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -F mpris
}

check() {
  cd "jellyhaj" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -F mpris --workspace
}

package() {
  cd "jellyhaj" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/jellyhaj"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "jellyhaj.desktop"
  install -Dm644 License.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
