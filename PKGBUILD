_upstream='https://github.com/Just-Utkarsh/charviews'

pkgname=charviews
pkgver=0.1.5
pkgrel=1
pkgdesc='TUI dashboard and terminal ASCII webcam viewer'
arch=('x86_64' 'aarch64')
url="${_upstream}"
license=('MIT')

depends=('gcc-libs' 'ffmpeg' 'libjpeg-turbo')
makedepends=('cargo')
optdepends=('v4l-utils: list V4L devices with v4l2-ctl')

source=("${pkgname}-${pkgver}.tar.gz::${_upstream}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a9fac799b0bba33f3025d523125942a90ee424273fe73819dddcc1c0e17bd3c8')

build() {
  cd "charviews-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable

  # 👇 FORCE linker to include libjpeg
  export RUSTFLAGS="-C link-arg=-ljpeg"

  cargo build --release --all-features
}
package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/charviews "${pkgdir}/usr/bin/charviews"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
