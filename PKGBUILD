# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-repo-stats
pkgver=0.5.1
pkgrel=1
pkgdesc="Show usage statistics of repositories in pacman.conf"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-repo-stats"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('ddcce4438b0931b834f7e747b9e7014f96e620369802e917776640eaae7c8f31ae412330582f573bf71999f89bc75f7ca94d0eeaf171032f9e570ce72a50156a')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-repo-stats" "$pkgdir/usr/bin/pacman-repo-stats"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
}
