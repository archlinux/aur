# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgbase=czkawka
pkgname=(
  czkawka-cli
  czkawka-gui
  krokiet
)
pkgver=10.0.0
pkgrel=0.1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc.'
url='https://github.com/qarmin/czkawka'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
license=('LicenseRef-MIT AND GPL-3.0-only AND CC-BY-4.0')
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
b2sums=('637b2894ebcc54b9d6dfc064d9e131023a4434ccbbbe7d8e8bb1127e4e924f17391def98b06987b39cba166042064a6003aa48d53f0ffce0206210c622e31844')

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

  install -Dm644 "${srcdir}/czkawka/czkawka_cli/LICENSE_MIT" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE_MIT"
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

  install -Dm644 "${srcdir}/czkawka/czkawka_gui/LICENSE_CC_BY_4_ICONS" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_CC_BY_4_ICONS"
  install -Dm644 "${srcdir}/czkawka/czkawka_gui/LICENSE_MIT_APP_CODE" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_MIT_APP_CODE"
  install -Dm644 "${srcdir}/czkawka/czkawka_gui/LICENSE_MIT_WINDOWS_THEME" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_MIT_WINDOWS_THEME"

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
  license=('LicenseRef-MIT AND GPL-3.0-only AND CC-BY-4.0')
  pkgdesc+=" (Desktop App, Slint frontend)"

  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_CC_BY_4_ICONS" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_CC_BY_4_ICONS"
  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_GPL_APP" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_GPL_APP"
  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_MIT_CODE" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_MIT_CODE"

  install -Dm755 "${srcdir}/czkawka/target/release/krokiet" \
        "${pkgdir}/usr/bin/krokiet"
}
