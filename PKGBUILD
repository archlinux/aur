pkgname=kasa_exporter
pkgver=0.4.0
pkgrel=1
pkgdesc='Prometheus exporter for TP-Link Kasa smart home products'
arch=('x86_64' 'aarch64')
url='https://github.com/bobrik/kasa_exporter'
license=('MIT')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db8f5a8e1e1f8df660ea4424c2514defc82cb489169feacdd4c1430e034ec655')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 target/release/kasa_exporter \
    "${pkgdir}/usr/bin/kasa_exporter"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
