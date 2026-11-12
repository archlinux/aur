pkgname=xerabora
pkgver=1.1.0
pkgrel=2
pkgdesc="Desktop RetroAchievements client with live tracking for a real PlayStation 2 through a patched Open PS2 Loader"
arch=('x86_64' 'aarch64')
url="https://github.com/hacan359/xerabora"
license=('MIT')
depends=('curl' 'glibc' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('xdg-utils: open the interface in the default browser'
            'chromium: open the interface in an app window'
            'libpulse: notification sounds through paplay'
            'alsa-utils: notification sounds through aplay'
            'pipewire: notification sounds through pw-play')
source=("git+https://github.com/hacan359/xerabora.git#tag=v$pkgver"
        "git+https://github.com/RetroAchievements/rcheevos.git"
        "xerabora.service"
        "xerabora.desktop")
sha256sums=('ae4e9458cdbf8243bce85107f71125fb7c799d714ff2d4c607bf15bf54b8e817'
            'SKIP'
            '10893d77fcac28ab2e90729d7fd22e652cb24669bed101f67d95ed7a9a492772'
            'de1f8e91560ee89b6ed3e259fbd1119cbab9daccf10c543e2078fbb6637ad673')

prepare() {
  cd "$pkgname"
  git submodule init third_party/rcheevos
  git config submodule.third_party/rcheevos.url "$srcdir/rcheevos"
  git -c protocol.file.allow=always submodule update third_party/rcheevos
}

build() {
  cd "$pkgname/client"
  CFLAGS="$CFLAGS $LDFLAGS" make VERSION="$pkgver" xerabora
}

check() {
  cd "$pkgname/client"
  ./xerabora --help
}

package() {
  cd "$pkgname"
  install -Dm755 client/xerabora "$pkgdir/usr/bin/xerabora"
  install -Dm644 "$srcdir/xerabora.service" "$pkgdir/usr/lib/systemd/user/xerabora.service"
  install -Dm644 "$srcdir/xerabora.desktop" "$pkgdir/usr/share/applications/xerabora.desktop"
  install -Dm644 docs/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/xerabora.png"
  install -Dm644 client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
