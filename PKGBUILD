# Maintainer: broroeror <54515333+broroeror@users.noreply.github.com>
pkgname=pdsync
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial Proton Drive sync client with a tray app (third-party, not supported by Proton)"
arch=('any')
url="https://github.com/broroeror/pdsync"
license=('GPL-3.0-or-later')
depends=('nodejs>=22' 'python' 'pyside6' 'qt6-svg' 'libsecret' 'glib2' 'systemd')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd8f0f611518ebb3600e4e7ac0ad105a660ceeeadfaa464502e0a8190f8b46fa')

build() {
  cd "$pkgname-$pkgver"
  npm ci --ignore-scripts --no-audit --no-fund --cache "$srcdir/npm-cache"
  node build.mjs
}

check() {
  cd "$pkgname-$pkgver"
  npm test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 dist/pdsync.mjs "$pkgdir/usr/lib/pdsync/pdsync.mjs"
  install -Dm644 dist/pdsync.mjs.LEGAL.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.txt"
  install -Dm644 dist/THIRD-PARTY-LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find gui/pdsync_gui -type f \( -name '*.py' -o -name '*.qml' -o -name '*.svg' \) -exec \
    install -Dm644 '{}' "$pkgdir/usr/lib/pdsync/{}" \;
  install -Dm644 gui/pdsync_gui/icons/pdsync.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/pdsync.svg"

  install -Dm755 packaging/pdsync "$pkgdir/usr/bin/pdsync"
  install -Dm755 packaging/pdsync-gui "$pkgdir/usr/bin/pdsync-gui"
  install -Dm644 packaging/pdsync-gui.desktop "$pkgdir/usr/share/applications/pdsync-gui.desktop"
  install -Dm644 packaging/pdsync-mirror.service "$pkgdir/usr/lib/systemd/user/pdsync-mirror.service"
  install -Dm644 packaging/pdsync-mirror.timer "$pkgdir/usr/lib/systemd/user/pdsync-mirror.timer"
}
