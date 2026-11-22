# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hotpath
pkgver=0.32.1
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
sha256sums=('685889dcfaab8e14dfbd0ed3165a2237e84fac8bd41def065c78f01ffe2cb1f6')

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
