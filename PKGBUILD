# Maintainer: Justus Tartz <aur at jrtberlin dot de>
pkgname=steam-boilr-gui
pkgver=0.9.26
pkgrel=1
_tag="v.${pkgver}"
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
source=("https://github.com/PhilipK/BoilR/archive/refs/tags/${_tag}.tar.gz"
        "boilr.png"
        "boilr.desktop")
sha256sums=("09130fb2d8294d4f9a9c139049d938e906ea10d70dc032d61b265cce9e1b2741"
            "baab109c6311f05ddbf647aa384b42098db9308c27cb50537f99bb341930387f"
            "c8e71371c9dc39db087e79d5a32df1ee0f4dd2cf5d069e38b491c3b9812d8424")

prepare() {
  cd "${srcdir}/BoilR-${_tag}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/BoilR-${_tag}"
  cargo build --frozen --release --features ui
}

check() {
  cd "${srcdir}/BoilR-${_tag}"
  cargo test --frozen --features ui
}

package() {
  install -Dm755 "${srcdir}/BoilR-${_tag}/target/release/boilr" "${pkgdir}/usr/bin/boilr-gui"
  install -Dm644 "${srcdir}/boilr.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/boilr.png" -t "${pkgdir}/usr/share/pixmaps/"
}

