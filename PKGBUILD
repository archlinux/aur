pkgname=showel
pkgver=0.2.1.0
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/showel"
license=('unknown')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'xdotool'
)
makedepends=(
  'pkgconf'
  'rust'
)
conflicts=('showel-git')
options=('!debug' '!lto')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/showel/archive/refs/tags/v0.2.1.0.tar.gz"
)
sha256sums=(
  '61c19e824467cbfa85d5da64fa911d8c3693c71b19ff743cdd10f9dbb0a88b7c'
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
  install -Dm644 "app/assets/app.css" "${pkgdir}/usr/lib/showel/assets/app.css"
  install -Dm644 "packaging/arch/showel.desktop" "${pkgdir}/usr/share/applications/showel.desktop"
  install -Dm644 "app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/showel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/showel/README.md"
}
