# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-repo-stats
pkgver=0.3.0
pkgrel=1
pkgdesc="Show usage statistics of repositories in pacman.conf"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-repo-stats"
license=('GPL-3.0-or-later')
depends=(pacman)
makedepends=(cargo)
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7f30bc4cab3082a1ccfb858f50ce5f4ff243da5c3fccec99ec4a301b609a2879')

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
