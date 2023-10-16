# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgbase=czkawka
pkgname=(
  czkawka-cli
  czkawka-gui
)
pkgver=6.1.0
pkgrel=0.1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc.'
url='https://github.com/qarmin/czkawka'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
license=('MIT')
depends=(
  bzip2
  cairo
  gdk-pixbuf2
  gtk4
  hicolor-icon-theme
  libheif
  pango
)
makedepends=(
  cargo
  git
  rust
)
checkdepends=(xorg-server-xvfb)
_commit=44400e08af3c8f030493b8ec6fa965c7d42e560e # tags/6.1.0^0
source=("git+https://github.com/qarmin/czkawka.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd ${pkgbase}

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"

  cargo build --bin czkawka_cli --release --features heif
  cargo build --bin czkawka_gui --release --features heif
}

check() {
  cd ${pkgbase}

  export CARGO_HOME="${srcdir}/cargo"
  cargo test --bin czkawka_cli --release
  dbus-run-session xvfb-run -s '-nolisten local' \
    cargo test --bin czkawka_gui --release
}

package_czkawka-cli() {
  depends=(
    bzip2
    libheif
  )
  pkgdesc+=" (CLI)"

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE"
  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_cli" \
        "${pkgdir}/usr/bin/czkawka_cli"
}

package_czkawka-gui() {
  pkgdesc+=" (Desktop App)"

  install -Dm644 "${srcdir}/czkawka/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE"

  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_gui" \
        "${pkgdir}/usr/bin/czkawka_gui"

  install -Dm644 "${srcdir}/czkawka/data/com.github.qarmin.czkawka.desktop" \
        "${pkgdir}/usr/share/applications/com.github.qarmin.czkawka.desktop"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.Devel.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.Devel.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka-symbolic.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.github.qarmin.czkawka-symbolic.svg"

  install -Dm644 "${srcdir}/czkawka/data/com.github.qarmin.czkawka.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/com.github.qarmin.czkawka.metainfo.xml"
}
