# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=kairo
pkgver=0.3.3
pkgrel=3
pkgdesc="CLI and Desktop application for smart URL routing"
arch=("i686" "x86_64" "armv6h" "armv7h")
url="https://github.com/aelesbao/kairo"
license=("Apache-2.0")
options=()

depends=("glibc" "gcc-libs")
makedepends=("rust" "wayland-protocols")

source_x86_64=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums_x86_64=('ac16bb9e9af5e5f85149d4539431b836c2767a6cfd81ba2f267a8996d756666d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --workspace --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/kairo target/release/kairo-desktop -t "${pkgdir}/usr/bin/"
  install -Dm644 kairo/desktop/* -t "${pkgdir}/usr/share/applications/"
  install -Dm644 kairo/icons/${pkgname}.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 kairo/icons/${pkgname}-128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
  install -Dm644 kairo/icons/${pkgname}-256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 kairo/icons/${pkgname}.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
