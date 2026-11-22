# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rsfrac
pkgver=1.1.2
pkgrel=1
_srcdir="rsfrac-${pkgver}"
pkgdesc="Terminal based fractal explorer, including Mandelbrot, Burning Ship"
arch=('x86_64' 'aarch64')
url="https://github.com/SkwalExe/rsfrac"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f43fc114b348c94b96ea7bc0b3bdc21ce8e0e4583d0ed142718d79e787a15248')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  export CFLAGS+=" -std=gnu17"
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  export CFLAGS+=" -std=gnu17"
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/rsfrac" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
