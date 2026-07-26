# Maintainer: coffee <coffee@coffeecat.top>

pkgname=orcasvn
pkgver=0.5.0
pkgrel=1
pkgdesc="Visual SVN Desktop client (Tauri 2)"
arch=('x86_64')
url="https://github.com/wustites/OrcaSVN"
license=('MIT')

depends=(
  'subversion'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'librsvg'
  'openssl'
  'mesa'
)

makedepends=(
  'base-devel'
  'git'
  'nodejs'
  'npm'
  'rust'
  'pkgconf'
  'cargo-tauri'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d7cb8962259d08262eaeaeac27e41fbe5b1a19a995e29032c4a8cd16189095f9')

_srcroot() {
  find "$srcdir" -maxdepth 1 -mindepth 1 -type d -name 'OrcaSVN*' | head -n1
}

prepare() {
  cd "$(_srcroot)"
  npm ci --no-audit --no-fund
}

build() {
  cd "$(_srcroot)"
  cargo tauri build --no-bundle
}

package() {
  cd "$(_srcroot)"

  install -Dm755 "src-tauri/target/release/OrcaSVN" \
    "$pkgdir/usr/lib/$pkgname/OrcaSVN"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/bin/bash
# Workaround: WebKitGTK 4.1 GBM buffer creation failure on some drivers
export WEBKIT_DISABLE_COMPOSITING_MODE=1
exec /usr/lib/orcasvn/OrcaSVN "$@"
WRAPPER

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << 'DESKTOP'
[Desktop Entry]
Type=Application
Name=OrcaSVN
Comment=Visual SVN Desktop
Exec=orcasvn
Icon=orcasvn
Terminal=false
Categories=Development;RevisionControl;
DESKTOP

  [ -f src-tauri/icons/128x128.png ] && \
    install -Dm644 src-tauri/icons/128x128.png \
      "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  [ -f src-tauri/icons/128x128@2x.png ] && \
    install -Dm644 src-tauri/icons/128x128@2x.png \
      "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  [ -f src-tauri/icons/32x32.png ] && \
    install -Dm644 src-tauri/icons/32x32.png \
      "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
}
