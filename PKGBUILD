# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=resvg-git
pkgver=0.48.1.r4.g021d44b7
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/linebender/resvg"
license=(MPL-2.0)
depends=(
    glibc
    libgcc
    libstdc++
    )
optdepends=(
    'qt5-base: For the Qt backend and for viewsvg'
	'cairo: For the cairo backend'
    )
makedepends=(
    cargo
    cargo-c
    qt5-base
    qt5-tools
    cairo
    pango
    git
    cmake
    extra-cmake-modules
    )
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
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
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

  cargo cbuild --frozen --release -p resvg-capi
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

  cargo cinstall --frozen --release -p resvg-capi --destdir="${pkgdir}" --prefix=/usr


  install -Dm644 -t "$pkgdir/usr/include/resvg" crates/c-api/*.h
  install -d "$pkgdir/usr/share/doc/resvg"
  cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}
