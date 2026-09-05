pkgname=thunderbolt
pkgver=0.1.129
pkgrel=1
pkgdesc='Privacy-respecting AI chat client. AI You Control: Choose your models. Own your data. Eliminate vendor lock-in.'
arch=('x86_64' 'aarch64')
url='https://github.com/thunderbird/thunderbolt'
license=('MPL-2.0')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
)
makedepends=(
  'bun>=1.2'
  'cargo'
  'cmake'
  'librsvg'
)
optdepends=(
  'xdg-utils'
)
conflicts=(
  'thunderbolt-bin'
  'thunderbolt-git'
)
options=(
  '!lto'
  '!strip'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '09811be13682cb77f742a55ed8f34711fe8f3ff7204b3ca7fcfc2eac38b57246'
)

build() {
  cd "$pkgname-$pkgver"

  export RUSTFLAGS=''
  export CARGO_INCREMENTAL=0
  export RUSTC_WRAPPER=''
  export NO_STRIP=true
  export VITE_THUNDERBOLT_CLOUD_URL="https://api.thunderbolt.io/v1"
  export BUN_INSTALL_CACHE_DIR="$srcdir/bun-cache"
  export CARGO_HOME="$srcdir/cargo-home"

  rm -rf src-tauri/target

  bun install --frozen-lockfile
  bun tauri build --no-bundle
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 \
    "src-tauri/target/release/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  install -Dm644 \
    'LICENSE' \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 \
    'public/favicon.svg' \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

  install -Dm644 \
    'public/favicon-32x32.png' \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"

  install -d "$pkgdir/usr/share/applications"

  cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Thunderbolt
GenericName=AI Assistant
Comment=AI You Control: Choose your models. Own your data. Eliminate vendor lock-in.
Exec=thunderbolt
Icon=thunderbolt
Terminal=false
Categories=Network;Chat;
StartupNotify=true
StartupWMClass=thunderbolt
EOF
}
