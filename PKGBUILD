# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trollstov
pkgver=0.1.0
pkgrel=1
_srcdir="troll-trollstov-v${pkgver}"
pkgdesc="A music player for the terminal where your files and their metadata are all you need"
arch=('x86_64' 'aarch64')
url="https://github.com/hikikones/troll"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
_tag="trollstov-v${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('7cc558f7edfe5d13bbe0ea489e03440b6fb57c22059c0796a830b906ea5189c0')

prepare() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_srcdir}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${_srcdir}"
  install -Dm755 "target/release/trollstov" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
