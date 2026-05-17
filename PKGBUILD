# Maintainer: Slush97 <slusheliott@gmail.com>
pkgname=vpkmerge-git
_pkgname=vpkmerge
pkgver=0.2.0.r0.gunknown
pkgrel=1
pkgdesc="Combine multiple Valve Pak (.vpk) mods into one (Deadlock modding; GUI + CLI, built from latest git)"
arch=('x86_64')
url="https://github.com/Slush97/vpkmerge"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('git' 'rust' 'pnpm' 'nodejs' 'pkgconf')
provides=('vpkmerge' 'vpkmerge-cli')
conflicts=('vpkmerge' 'vpkmerge-bin' 'vpkmerge-cli' 'vpkmerge-cli-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ) || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}/gui"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Frontend assets land in gui/dist; tauri-bundler is bypassed here, so we
  # build the GUI binary directly and ship a synthesized .desktop file.
  ( cd gui && pnpm vite:build )

  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked -p vpkmerge-cli
  cargo build --release --locked -p vpkmerge-gui
}

check() {
  cd "${srcdir}/${_pkgname}"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --release --locked -p vpkmerge-core -p vpkmerge-cli
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${srcdir}/target/release/vpkmerge-gui" "${pkgdir}/usr/bin/vpkmerge"
  install -Dm755 "${srcdir}/target/release/vpkmerge"     "${pkgdir}/usr/bin/vpkmerge-cli"

  install -Dm644 gui/src-tauri/icons/32x32.png      "${pkgdir}/usr/share/icons/hicolor/32x32/apps/vpkmerge.png"
  install -Dm644 gui/src-tauri/icons/64x64.png      "${pkgdir}/usr/share/icons/hicolor/64x64/apps/vpkmerge.png"
  install -Dm644 gui/src-tauri/icons/128x128.png    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vpkmerge.png"
  install -Dm644 gui/src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/vpkmerge.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/com.slush97.vpkmerge.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=vpkmerge
GenericName=VPK Merger
Comment=Combine multiple Valve Pak (.vpk) mods into one
Exec=vpkmerge
Icon=vpkmerge
Terminal=false
Categories=Utility;Game;
StartupWMClass=vpkmerge
EOF

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
