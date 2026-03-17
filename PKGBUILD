# Maintainer: Arcioth
pkgname=openify-git
pkgver=2.0.0.r0.g7cee2f7
pkgrel=1
pkgdesc="A modern, lightweight, privacy-first music player powered by Tauri."
arch=('x86_64')
url="https://github.com/Arcioth/openify"
license=('ISC')
depends=('webkit2gtk-4.1' 'gtk3')
optdepends=('yt-dlp: YouTube Music streaming support')
makedepends=('git' 'nodejs>=18' 'npm' 'cargo' 'pkgconf')
provides=('openify')
conflicts=('openify')
source=("git+https://github.com/Arcioth/openify.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/openify"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "2.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/openify"
  npm install
  npm run tauri build -- --bundles deb
}

package() {
  cd "$srcdir/openify"

  # Install the binary
  install -Dm755 "src-tauri/target/release/openify" "$pkgdir/usr/bin/openify"

  # Install desktop entry
  install -Dm644 "packaging/openify.desktop" "$pkgdir/usr/share/applications/openify.desktop"

  # Install icons
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/openify.png"
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/openify.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/openify.png"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
