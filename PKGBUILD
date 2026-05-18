# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
pkgname=skills-manager
pkgver=1.20.0
pkgrel=1
pkgdesc="Manage, sync, and organize AI agent skills across coding tools"
arch=('x86_64')
url="https://github.com/xingkongliang/skills-manager"
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'cargo'
  'git'
  'librsvg'
  'nodejs'
  'npm'
  'patchelf'
  'rust'
)
optdepends=(
  'git: Git-backed skill installs and backup'
)
provides=('skills-manager')
conflicts=('skills-manager-bin')
options=('!lto' '!strip')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/xingkongliang/skills-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc48b5bff32e2528e8ad543cda1aff88b74a9e9945e9346fc4bca29af63c6ee5')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
  npm ci
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable

  # Compile frontend + Rust binary; skip deb/rpm/appimage bundling.
  npm run tauri:build -- --no-bundle

  cargo build --release --locked \
    --manifest-path src-tauri/Cargo.toml \
    --bin skills-manager-cli
}

package() {
  cd "$pkgname-$pkgver"
  local _bindir="src-tauri/target/release"

  install -Dm755 "$_bindir/skills-manager" "$pkgdir/usr/bin/skills-manager"
  install -Dm755 "$_bindir/skills-manager-cli" "$pkgdir/usr/bin/skills-manager-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/skills-manager.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Skills Manager
Comment=$pkgdesc
Exec=skills-manager
Icon=skills-manager
StartupWMClass=skills-manager
Categories=Utility;
Terminal=false
EOF

  install -Dm644 src-tauri/icons/32x32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/skills-manager.png"
  install -Dm644 src-tauri/icons/128x128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/skills-manager.png"
  install -Dm644 src-tauri/icons/128x128@2x.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/skills-manager.png"
}
