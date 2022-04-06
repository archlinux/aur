# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.25
pkgrel=2
pkgdesc="Synchronize games from other platforms into your Steam library"
arch=(x86_64)
license=('MIT')
url="https://github.com/PhilipK/BoilR"
makedepends=(cargo)
depends=(libx11
  libxext
  libxft
  libxinerama
  libxcursor
  libxrender
  libxfixes
  pango
  libpng
  mesa
  glu)
provides=('boilr-gui')
source=("https://github.com/PhilipK/BoilR/archive/refs/tags/v${pkgver}.tar.gz"
	"boilr.png"
	"boilr.desktop")
sha256sums=("12272bc85ea1438d0cc32a024edc852c5b1a459e5f8b8b3f1f0c9165e592a1eb"
            "baab109c6311f05ddbf647aa384b42098db9308c27cb50537f99bb341930387f"
            "c8e71371c9dc39db087e79d5a32df1ee0f4dd2cf5d069e38b491c3b9812d8424")

prepare() {
  cd "${srcdir}/BoilR-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/BoilR-${pkgver}"
  cargo build --frozen --release --features ui
}

check() {
  cd "${srcdir}/BoilR-${pkgver}"
  cargo test --frozen --features ui
}

package() {
  install -Dm755 "${srcdir}/BoilR-${pkgver}/target/release/boilr" "${pkgdir}/usr/bin/boilr-gui"
  install -Dm644 "${srcdir}/boilr.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/boilr.png" -t "${pkgdir}/usr/share/pixmaps/"
}

