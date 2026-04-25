pkgname=shovel
pkgver=0.2.2.6
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/Shovel"
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
conflicts=('shovel-git')
options=('!debug' '!lto')
_sourcedir="Shovel-0.2.2.6"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/Shovel/archive/refs/tags/v0.2.2.6.tar.gz"
)
sha256sums=(
  'f67bf9f8b1941cb422c89916eaded1d7c7aef1adc477b0608b4884fd2c5a94cd'
)

prepare() {
  cd "${srcdir}/${_sourcedir}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_sourcedir}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"

  cargo build --frozen --release -p app --features desktop
}

package() {
  cd "${srcdir}/${_sourcedir}"

  install -Dm755 "${srcdir}/target/release/app" "${pkgdir}/usr/bin/shovel"
  install -Dm644 "app/assets/app.css" "${pkgdir}/usr/lib/shovel/assets/app.css"
  install -Dm644 "packaging/arch/shovel.desktop" "${pkgdir}/usr/share/applications/shovel.desktop"
  install -Dm644 "app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/shovel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/shovel/README.md"
}
