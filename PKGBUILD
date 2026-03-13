# Maintainer: Sapphic Angels <chloe@sapphic.moe>
pkgname=caldav-tasks
pkgver=0.7.1
pkgrel=1
pkgdesc="A cross-platform CalDAV task management app"
arch=('x86_64' 'aarch64')
url="https://github.com/SapphoSys/caldav-tasks"
license=('Zlib')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup'
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
  "git+https://github.com/SapphoSys/caldav-tasks.git#tag=app-v${pkgver}"
  "caldav-tasks.desktop"
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

  # Remove lockfile if incompatible with system pnpm version
  # (The upstream lockfile may be from a newer pnpm version)
  if [ -f pnpm-lock.yaml ]; then
    rm -f pnpm-lock.yaml
  fi

  pnpm install

  # Regenerate Cargo.lock to properly resolve git dependencies
  # This is crucial when using git patches in Cargo.toml
  cd src-tauri
  cargo update
  cd ..
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
    install -Dm644 "${srcdir}/caldav-tasks.desktop" \
      "${pkgdir}/usr/share/applications/caldav-tasks.desktop"

    # Install icons
    for size in 32 128; do
      install -Dm644 "src-tauri/icons/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/caldav-tasks.png"
    done

    # Install the main icon
    install -Dm644 "src-tauri/icons/icon.png" \
      "${pkgdir}/usr/share/pixmaps/caldav-tasks.png"
  fi

  # Install license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
