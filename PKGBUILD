# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drill-search
pkgver=190
pkgrel=1
epoch=1
_tag=46007387143-1
pkgdesc="Very fast file searcher without indexing"
arch=('x86_64')
url="https://drill.software"
license=('GPL-2.0-only')
depends=(
  'gtk3'
  'libxkbcommon'
)
makedepends=('cargo')
provides=('drill')
conflicts=("$pkgname-cli" "$pkgname-gtk")
source=("Drill-rust-release-${_tag}.tar.gz::https://github.com/yatima1460/Drill/archive/refs/tags/rust-release-${_tag}.tar.gz"
        'drill.desktop')
sha256sums=('ca60f0bf153ff50f12d336729fe976948c07b6070990a88adc11bf1aef367846'
            '4b60e933f70b8114ef01abe00f893e9dc3ed7ec390f7bb1fb3dfac65b212ebf6')

prepare() {
  cd "Drill-rust-release-${_tag}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "Drill-rust-release-${_tag}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_LTO=true
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cargo build --frozen --release
}

package() {
  cd "Drill-rust-release-${_tag}"
  install -Dm755 target/release/drill -t "$pkgdir/usr/bin/"
  install -Dm644 src/assets/drill.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/drill.desktop" -t "$pkgdir/usr/share/applications/"
}
