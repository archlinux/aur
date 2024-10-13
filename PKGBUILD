# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgbase=czkawka
pkgname=(
  czkawka-cli
  czkawka-gui
  krokiet
)
pkgver=8.0.0
pkgrel=0.1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc.'
url='https://github.com/qarmin/czkawka'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
license=('LicenseRef-MIT')
depends=(
  bzip2
  gcc-libs
  glibc
  libheif
)
makedepends=(
  cargo
  git
  rust

  # GUI (GTK4)
  cairo
  gdk-pixbuf2
  glib2
  gtk4
  hicolor-icon-theme
  pango
)
checkdepends=(xorg-server-xvfb)
source=("git+https://github.com/qarmin/czkawka.git#tag=$pkgver")
b2sums=('5512d4bfd2201bd7c64ae5d1f57faa2334da1110879fbf55b60d53ea5740623d2998ccaa4aae58b343062671024196e99fa0a299014de606ed4a9728af45214f')

build() {
  cd ${pkgbase}

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"

  cargo build \
    --bin czkawka_cli \
    --bin czkawka_gui \
    --bin krokiet \
    --features heif \
    --release --verbose
}

check() {
  cd ${pkgbase}

  export CARGO_HOME="${srcdir}/cargo"
  cargo test --bin czkawka_cli --release
  dbus-run-session xvfb-run -s '-nolisten local' \
    cargo test --bin czkawka_gui --release
}

package_czkawka-cli() {
  license=('LicenseRef-MIT')
  pkgdesc+=" (CLI)"

  install -Dm644 "${srcdir}/czkawka/czkawka_cli/LICENSE" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE"
  install -Dm755 "${srcdir}/czkawka/target/release/czkawka_cli" \
        "${pkgdir}/usr/bin/czkawka_cli"
}

package_czkawka-gui() {
  depends+=(
    cairo
    gdk-pixbuf2
    glib2
    gtk4
    hicolor-icon-theme
    pango
  )
  license=('LicenseRef-MIT AND CC-BY-4.0')
  pkgdesc+=" (Desktop App)"

  install -Dm644 "${srcdir}/czkawka/czkawka_gui/LICENSE" \
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

package_krokiet() {
  license=('LicenseRef-MIT AND GPL-3.0-only')
  pkgdesc+=" (Desktop App, Slint frontend)"

  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE"

  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_MIT_CODE" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE.MIT"

  install -Dm755 "${srcdir}/czkawka/target/release/krokiet" \
        "${pkgdir}/usr/bin/krokiet"
}
