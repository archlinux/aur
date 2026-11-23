# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hotpath
pkgver=0.33.0
pkgrel=1
_srcdir="hotpath-${pkgver}"
pkgdesc="A Rust profiler for CPU, memory, async, SQL, I/O, and lock contention with a live TUI dashboard"
arch=('x86_64' 'aarch64')
url="https://github.com/hotpath-rs/hotpath"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3247785bcb8ced4c54e0f2b061799adafdcbc92546e05be3b858cf364cb9ae5')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p hotpath --features tui --bins
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/hotpath" -t "${pkgdir}/usr/bin"
  install -Dm755 "target/release/hotpath-samply" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
