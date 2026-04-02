pkgname=illogical-updots
pkgver=2.0.0
pkgrel=1
pkgdesc="GTK based updater for end4 dotfiles - TUI and Quickshell widget"
arch=('x86_64')
url="https://github.com/FoxyIsCoding/illogical-updots"
license=('custom')
depends=(
  'git'
  'adwaita-icon-theme'
  'gdk-pixbuf2'
  'librsvg'
  'quickshell'
)
makedepends=(
  'rust'
  'cargo'
)

source=(
  "git+https://github.com/FoxyIsCoding/illogical-updots.git"
  "illogical-updots.png::https://github.com/FoxyIsCoding/illogical-updots/blob/main/.github/assets/logo.png?raw=true"
)
sha256sums=('SKIP'
            'f7b466432d66170f48c4c1715741b3abd424888ccd72e0ce2c9fb20c75c47854')

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}/illogical-updots-rust"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  install -m755 "illogical-updots-rust/target/release/illogical-updots" "${pkgdir}/usr/bin/illogical-updots"

  install -d "${pkgdir}/usr/share/quickshell/plugins/illogical-updots"
  cp -r quickshell/* "${pkgdir}/usr/share/quickshell/plugins/illogical-updots/"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/illogical-updots.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Illogical Updots
Exec=quickshell /usr/share/quickshell/plugins/illogical-updots/Main.qml
Icon=illogical-updots
Terminal=false
Categories=Utility;
StartupNotify=false
EOF

  ICON_SOURCE="${srcdir}/illogical-updots.png"
  if [[ -f "${ICON_SOURCE}" ]]; then
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "${ICON_SOURCE}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/illogical-updots.png"
  fi

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  if [[ -f LICENSE ]]; then
    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    echo "License file missing" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
