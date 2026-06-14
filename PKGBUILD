# Maintainer: Sapphic Angels <chloe@sapphic.moe>
pkgname=chiri
pkgver=0.9.2
pkgrel=1
pkgdesc="A cross-platform CalDAV task management app. Currently in very early alpha!"
arch=('x86_64' 'aarch64')
url="https://github.com/chiriapp/chiri"
license=('Zlib')
replaces=('caldav-tasks')
conflicts=('caldav-tasks')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libsoup3'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'cargo'
  'nodejs'
  'pnpm'
  'pkg-config'
  'openssl'
  'sqlite'
  'libappindicator-gtk3'
  'librsvg'
)
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(
  "git+https://github.com/chiriapp/chiri.git#tag=app-v${pkgver}"
  "chiri.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${pkgname}"

  # Check build environment
  echo "==> Checking build environment..."
  rustc --version
  cargo --version
  sqlite3 --version

  # Disable updater artifact creation (we don't have signing keys)
  sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json

  # Install pnpm dependencies
  export PNPM_HOME="${srcdir}/.pnpm"
  export PATH="$PNPM_HOME:$PATH"

  # Keep the upstream lockfile for deterministic plugin versions.
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${pkgname}"

  export PNPM_HOME="${srcdir}/.pnpm"
  export PATH="$PNPM_HOME:$PATH"

  # Use fat LTO to let sqlx and ring compile with Arch's forced LTO
  CFLAGS+=" -ffat-lto-objects"
  pnpm tauri build --bundles deb
}

package() {
  cd "${srcdir}/${pkgname}"

  # Extract the built .deb package (Tauri's recommended approach)
  # Find the .deb file in the bundle directory
  local debfile=$(find src-tauri/target/release/bundle/deb -name "*.deb" -type f | head -n1)

  if [ -n "$debfile" ]; then
    # Extract data from .deb
    bsdtar -xf "$debfile" -C "${srcdir}" data.tar.gz
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  else
    # Fallback: manual installation
    install -Dm755 "src-tauri/target/release/${pkgname}" \
      "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/chiri.desktop" \
      "${pkgdir}/usr/share/applications/chiri.desktop"

    # Install icons
    for size in 32 128; do
      install -Dm644 "src-tauri/icons/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chiri.png"
    done

    # Install the main icon
    install -Dm644 "src-tauri/icons/icon.png" \
      "${pkgdir}/usr/share/pixmaps/chiri.png"
  fi

  # Install license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Create AUR installation marker to disable in-app updates
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  touch "${pkgdir}/usr/share/${pkgname}/.aur-install"
}
