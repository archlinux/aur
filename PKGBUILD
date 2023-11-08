# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=journald-broker
pkgver=0.7.0
pkgrel=2
pkgdesc="A log-based event dispatcher daemon for systemd's journal"
arch=('x86_64')
url="https://github.com/bpetlert/journald-broker"
license=('GPL-3.0-or-later')
depends=('systemd-libs')
makedepends=(cargo)
options=(!lto)
backup=(
  "etc/journald-broker.d/00-global-settings.conf"
  "etc/journald-broker.d/00-template.conf"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('359269447dcb3a5c10a45b3bad710b16388b8185b2ce41878bc60ec1b965a69405bcfefe390e52744635293effa0275382b7be4f84d0cb29a24f25aadee74143')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/journald-broker" "${pkgdir}/usr/bin/journald-broker"

  install -Dm644 "journald-broker.service" "${pkgdir}/usr/lib/systemd/system/journald-broker.service"

  install -dm755 "${pkgdir}/etc/journald-broker.d/"
  install -Dm644 "00-global-settings.conf" "${pkgdir}/etc/journald-broker.d/00-global-settings.conf"
  install -Dm644 "00-template.conf" "${pkgdir}/etc/journald-broker.d/00-template.conf"

  install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
