# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-repo-stats
pkgver=0.4.0
pkgrel=2
pkgdesc="Show usage statistics of repositories in pacman.conf"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-repo-stats"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('316b0a2f2987c4fb8b4fc10a8e445953b20fdbbe950079c45aac2b34840cb332a8e74bcbc9bb927e7724907394cc376e98d8b7f9f5ff514393736edf033d11c1')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-repo-stats" "$pkgdir/usr/bin/pacman-repo-stats"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
