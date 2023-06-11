# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgbase=czkawka
pkgname=(
  czkawka-cli
  czkawka-gui
)
pkgver=6.0.0
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
makedepends=(
  cargo
  git
  gtk4
  libheif
  rust
)
checkdepends=(xorg-server-xvfb)
_commit=7cb355a35902e79a1413296bd60bb8eabfd395da # tags/6.0.0^0
# curl -sS https://github.com/web-flow.gpg | gpg --import -
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing) <noreply@github.com>
source=("git+https://github.com/qarmin/czkawka.git#commit=${_commit}?signed")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd ${pkgbase}
  cargo build --bin czkawka_cli --release --features heif
  cargo build --bin czkawka_gui --release --features heif
}

check() {
  cd ${pkgbase}
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
  depends=(
    gtk4
    libheif
  )
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
