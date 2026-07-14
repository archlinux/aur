# Maintainer: tangeorange <tangeorange@example.com>
pkgname=cc-pocket-bin
pkgver=1.104.1
_build=186
pkgrel=1
pkgdesc="Mobile client for Claude Code and Codex — Linux desktop app"
arch=('x86_64')
url="https://github.com/K9i-0/ccpocket"
license=('MIT')
depends=('gtk3' 'libsecret')
makedepends=('patchelf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/K9i-0/ccpocket/releases/download/linux%2Fv$pkgver%2B$_build/CC-Pocket-linux-x64-v$pkgver.tar.gz"
        "cc-pocket.desktop"
        "cc-pocket.png"
        "LICENSE::https://raw.githubusercontent.com/K9i-0/ccpocket/main/LICENSE")
sha256sums=('f5c6b26033e088899b7a5e3eb9c8b07d40e813b28a6653f8c30a3ab7b8dab82e'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  install -d "$pkgdir/opt/cc-pocket"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/480x480/apps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  cp -r "$srcdir/CC-Pocket-linux-x64/"* "$pkgdir/opt/cc-pocket/"

  # Fix RUNPATH for bundled .so files
  for lib in "$pkgdir/opt/cc-pocket/lib/"*.so; do
    patchelf --set-rpath '$ORIGIN' "$lib" 2>/dev/null || true
  done

  ln -sf "/opt/cc-pocket/ccpocket" "$pkgdir/usr/bin/ccpocket"
  install -Dm644 "$srcdir/cc-pocket.desktop" "$pkgdir/usr/share/applications/cc-pocket.desktop"
  install -Dm644 "$srcdir/cc-pocket.png" "$pkgdir/usr/share/icons/hicolor/480x480/apps/cc-pocket.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
