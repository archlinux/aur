pkgname=slaysp2manager-git
_pkgname=slaysp2manager
pkgver=0.9.0.r0.g09db51a
pkgrel=1
pkgdesc='Desktop mod manager for Slay the Spire 2'
arch=('x86_64')
url='https://github.com/konuhd/slaySP2Manager-for-arch'
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'ayatana-ido'
  'libayatana-appindicator'
  'librsvg'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'git'
  'npm'
  'nodejs'
  'pkgconf'
  'glib2-devel'
  'gcc'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/konuhd/slaySP2Manager-for-arch.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd 'slaySP2Manager-for-arch'

  local tag commits hash
  tag=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')
  commits=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)
  printf '%s.r%s.g%s' "${tag:-0.0.0}" "${commits}" "${hash}"
}

prepare() {
  cd 'slaySP2Manager-for-arch'

  cargo fetch --locked --manifest-path src-tauri/Cargo.toml
  npm ci
}

build() {
  cd 'slaySP2Manager-for-arch'

  npm run build
  env -u RUSTFLAGS -u CARGO_ENCODED_RUSTFLAGS -u CFLAGS -u CXXFLAGS -u LDFLAGS npm run tauri:build -- --no-bundle
}

package() {
  cd 'slaySP2Manager-for-arch'

  install -Dm755 src-tauri/target/release/slaysp2manager "${pkgdir}/usr/bin/slaysp2manager"
  install -Dm644 src-tauri/icons/icon-256.png "${pkgdir}/usr/share/pixmaps/slaysp2manager.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/slaysp2manager.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=SlaySP2Manager
Comment=Desktop mod manager for Slay the Spire 2
Exec=slaysp2manager
Icon=slaysp2manager
Terminal=false
Categories=Game;Utility;
StartupNotify=true
EOF
}
