

pkgname=resvg-git
pkgver=0.45.0.r2.g9c4431d1
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/linebender/resvg"
license=(MPL-2.0)
depends=(gdk-pixbuf2)
optdepends=(
	'qt5-base: For the Qt backend'
	'cairo: For the cairo backend'
)
makedepends=(cargo qt5-base qt5-tools cairo pango git cmake extra-cmake-modules)
conflicts=(resvg)
provides=(resvg)
source=("git+https://github.com/linebender/resvg.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "resvg"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "resvg"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "resvg"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --workspace --frozen --release

  (
    cd tools/viewsvg
    qmake PREFIX="$pkgdir/usr"
    make
  )

  cargo doc --release --no-deps -p resvg-capi
}

check() {
  cd "resvg"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "resvg"
  install -Dm755 -t "$pkgdir/usr/bin/" target/release/{resvg,usvg} tools/viewsvg/viewsvg
  install -Dm755 -t "$pkgdir/usr/lib/" target/release/libresvg.so
  install -Dm644 -t "$pkgdir/usr/include/" crates/c-api/*.h
  install -d "$pkgdir/usr/share/doc/resvg"
  cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
