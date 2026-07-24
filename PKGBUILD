# Maintainer: Omur <omrkrz0678@gmail.com>
pkgname=fnqvisual
pkgver=0.1.0
pkgrel=1
pkgdesc="FnQVisual Rust daemon and UI"
arch=('x86_64')
url="https://github.com/OmurEKiraz/FnQVisual-rs"
license=('GPL-3.0-or-later')


depends=(
  'gcc-libs'
  'glibc'
  'fontconfig'
  'gtk4'                  
  'gtk4-layer-shell'      
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libxkbcommon'
  'wayland'
)
makedepends=('cargo')
provides=('fnqvisual')
conflicts=('fnqvisual')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OmurEKiraz/FnQVisual-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "FnQVisual-rs-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "FnQVisual-rs-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-targets
}

package() {
  cd "FnQVisual-rs-${pkgver}"
  

  install -Dm755 "target/release/fnq-visual" "${pkgdir}/usr/bin/fnqvisual"
  
  # Systemd service
  if [ -f "fnq-visual.service" ]; then
    install -Dm644 "fnq-visual.service" "${pkgdir}/usr/lib/systemd/system/fnq-visual.service"
  fi

  # license
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
