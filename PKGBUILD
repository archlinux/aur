pkgname=showel
pkgver=0.1.4
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/showel"
license=('unknown')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'xdotool'
  'librsvg'
)
makedepends=(
  'cargo'
  'pkgconf'
  'rust'
)
conflicts=('showel-git')
options=('!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/showel/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '1b45faf11f80302a31f798e9d556cbcfad8e66a3f4f56d7e1eadc625eab4361b'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"

  cargo build --frozen --release -p app --features desktop
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/target/release/app" "${pkgdir}/usr/bin/showel"
  install -Dm644 "packaging/arch/showel.desktop" "${pkgdir}/usr/share/applications/showel.desktop"
  install -Dm644 "app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/showel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/showel/README.md"
}
