# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gloamy
pkgver=0.1.9
pkgrel=1
pkgdesc="Secure on-device personal agents"
arch=('x86_64' 'aarch64')
url="https://github.com/ibz-04/gloamy"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ee960becee671e622c71b609a1fd27024c8b4688085e1a6e439e11d134fff2f')

prepare() {
  cd "gloamy-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "gloamy-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p gloamy
}

package() {
  cd "gloamy-${pkgver}"
  install -Dm755 "target/release/gloamy" "${pkgdir}/usr/bin/gloamy"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
