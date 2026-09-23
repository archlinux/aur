# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whysync
pkgver=0.2.0
pkgrel=1
pkgdesc="Live one-way folder mirror: waits for unplugged disks, holds mass deletions, keeps a trash"
arch=('any')
url="https://github.com/byrdltd/whySYNC"
license=('MIT')
depends=('python' 'rsync' 'python-gobject' 'gtk4' 'libadwaita')
optdepends=('libnotify: desktop notifications')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
install=whysync.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73dc0cd02a83b9795d98eeb7bea7f4397cb61d68e21de4b0b68a5e203e9b1931')

_appid=com.github.byrdltd.whysync

build() {
  cd "whySYNC-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "whySYNC-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -dm755 "$pkgdir/usr/lib/systemd/user" "$pkgdir/usr/share/applications"
  sed 's|%h/.local/bin/whysync|/usr/bin/whysync|' systemd/whysync.service \
    > "$pkgdir/usr/lib/systemd/user/whysync.service"
  sed 's|@BIN@|/usr/bin/whysync|' "data/$_appid.desktop.in" \
    > "$pkgdir/usr/share/applications/$_appid.desktop"
  for n in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-$n.png" "$pkgdir/usr/share/icons/hicolor/${n}x${n}/apps/$_appid.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
