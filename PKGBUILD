# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>

pkgbase=czkawka
pkgname=(
  czkawka-cli
  czkawka-gui
  krokiet
)
pkgver=11.0.1
pkgrel=0.2
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
  dav1d
  glibc
  libgcc
  libheif
)
makedepends=(
  cargo
  git
  hicolor-icon-theme
  rust

  # GUI (GTK4)
  gdk-pixbuf2
  glib2
  gtk4
)
checkdepends=(xorg-server-xvfb)
optdepends=(
  "ffmpeg: Compare video files"
)
source=("git+https://github.com/qarmin/czkawka.git#tag=$pkgver")
b2sums=('384aa06363a6f3edc7bee57daca4cebd5dc582498933f66f5a65625f346aad372c6a7ac685270f959d0684d052ce78d173b9d015f0606dd17ffc507d8ba9e7d9')

build() {
  cd ${pkgbase}

  # Keep rust/cargo build-dependency management inside the build directory
  export CARGO_HOME="${srcdir}/cargo"

  cargo build \
    --bin czkawka_cli \
    --bin czkawka_gui \
    --bin krokiet \
    --features "heif,libavif" \
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
    gdk-pixbuf2
    glib2
    gtk4
    hicolor-icon-theme
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

  install -Dm644 "${srcdir}/czkawka/data/com.github.qarmin.czkawka.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/com.github.qarmin.czkawka.metainfo.xml"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka.Devel.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.Devel.svg"

  install -Dm644 "${srcdir}/czkawka/data/icons/com.github.qarmin.czkawka-symbolic.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.github.qarmin.czkawka-symbolic.svg"
}

package_krokiet() {
  depends+=(
    hicolor-icon-theme
  )
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

  install -Dm644 "${srcdir}/czkawka/data/io.github.qarmin.krokiet.desktop" \
        "${pkgdir}/usr/share/applications/io.github.qarmin.krokiet.desktop"

  install -Dm644 "${srcdir}/czkawka/data/io.github.qarmin.krokiet.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.qarmin.krokiet.metainfo.xml"

  install -Dm644 "${srcdir}/czkawka/data/icons/io.github.qarmin.krokiet.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.qarmin.krokiet.svg"
}
