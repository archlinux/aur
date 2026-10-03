# Maintainer: Miguel Regueiro <miguelpr4242@gmail.com>

pkgname=enzo
pkgver=1.2.0
pkgrel=1
pkgdesc='Terminal video player with a graphical interface'
arch=('x86_64')
url='https://github.com/MiguelRegueiro/enzo'
license=('MIT')
depends=(
  'ffmpeg'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'libpulse'
)
makedepends=('cargo' 'pkgconf')
conflicts=('enzo-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.crate::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('fb90b4cd72a9f32b0fd70de52638477f82e3c06e42aeae08735cdcfb273427b8')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "packaging/linux/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  local size
  for size in 48 128 256 512; do
    install -Dm644 \
      "packaging/linux/icons/hicolor/${size}x${size}/apps/${pkgname}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
}
