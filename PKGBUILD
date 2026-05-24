# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: maki <maki@hotmilk.space>

pkgname=czkawka-git
pkgver=11.0.1.r13.g612c93a6
pkgrel=1
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
  jq

  # GUI (GTK4)
  cairo
  gdk-pixbuf2
  glib2
  gtk4
  hicolor-icon-theme
  pango
)
checkdepends=(xorg-server-xvfb)

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

provides=(
  czkawka=$pkgver
  czkawka-cli=$pkgver
  czkawka-gui=$pkgver
  krokiet=$pkgver
)
conflicts=(
  czkawka-cli
  czkawka-cli-bin
  czkawka-gui
  czkawka-gui-bin
  krokiet
  krokiet-bin
)

pkgver() {
  cd $pkgname/ || exit 1
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname || exit 1
  cargo fetch --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd $pkgname/ || exit 1

  cargo build \
    --bin czkawka_cli \
    --bin czkawka_gui \
    --bin krokiet \
    --features heif \
    --release --verbose
}

check() {
  cd $pkgname/ || exit 1

  cargo test --bin czkawka_cli --release
  dbus-run-session xvfb-run -s '-nolisten local' \
    cargo test --bin czkawka_gui --release
}

package() {
  pushd "${srcdir}/${pkgname}" || exit 1
  CARGO_TARGET_DIR="$(cargo metadata --format-version 1 --no-deps --offline | jq -r '.target_directory')"
  popd

  # cli

  install -Dm644 "${srcdir}/${pkgname}/czkawka_cli/LICENSE_MIT" \
        "${pkgdir}/usr/share/licenses/czkawka-cli/LICENSE_MIT"
  install -Dm755 "${CARGO_TARGET_DIR}/release/czkawka_cli" \
        "${pkgdir}/usr/bin/czkawka_cli"

  # gui

  install -Dm644 "${srcdir}/${pkgname}/czkawka_gui/LICENSE_CC_BY_4_ICONS" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_CC_BY_4_ICONS"
  install -Dm644 "${srcdir}/${pkgname}/czkawka_gui/LICENSE_MIT_APP_CODE" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_MIT_APP_CODE"
  install -Dm644 "${srcdir}/${pkgname}/czkawka_gui/LICENSE_MIT_WINDOWS_THEME" \
        "${pkgdir}/usr/share/licenses/czkawka-gui/LICENSE_MIT_WINDOWS_THEME"

  install -Dm755 "${CARGO_TARGET_DIR}/release/czkawka_gui" \
        "${pkgdir}/usr/bin/czkawka_gui"

  install -Dm644 "${srcdir}/${pkgname}/data/com.github.qarmin.czkawka.desktop" \
        "${pkgdir}/usr/share/applications/com.github.qarmin.czkawka.desktop"

  install -Dm644 "${srcdir}/${pkgname}/data/icons/com.github.qarmin.czkawka.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.svg"

  install -Dm644 "${srcdir}/${pkgname}/data/icons/com.github.qarmin.czkawka.Devel.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.qarmin.czkawka.Devel.svg"

  install -Dm644 "${srcdir}/${pkgname}/data/icons/com.github.qarmin.czkawka-symbolic.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/com.github.qarmin.czkawka-symbolic.svg"

  install -Dm644 "${srcdir}/${pkgname}/data/com.github.qarmin.czkawka.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/com.github.qarmin.czkawka.metainfo.xml"

  # krokiet

  install -Dm644 "${srcdir}/${pkgname}/krokiet/LICENSE_CC_BY_4_ICONS" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_CC_BY_4_ICONS"
  install -Dm644 "${srcdir}/${pkgname}/krokiet/LICENSE_GPL_APP" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_GPL_APP"
  install -Dm644 "${srcdir}/${pkgname}/krokiet/LICENSE_MIT_CODE" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_MIT_CODE"

  install -Dm755 "${CARGO_TARGET_DIR}/release/krokiet" \
        "${pkgdir}/usr/bin/krokiet"
}
