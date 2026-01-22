pkgname=myrient
pkgver=1.1.4
pkgrel=1
pkgdesc="Bulk downloader and extractor for ROM archive directories"
arch=('x86_64')
url="https://github.com/cruzisonfire/myrient"
license=('GPL3')
depends=('qt6-base' 'aria2' 'wget' 'unzip' 'p7zip')
optdepends=('unrar: RAR archive extraction support')
makedepends=('git' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4a71df7f54042901223b1c7758119e9503a02f44d35e022d2206c37251813ee')

build() {
  cd "$pkgname-$pkgver"
  qmake6 myrient.pro
  make
}

package() {
  cd "$pkgname-$pkgver"

  # Install GUI binary
  install -Dm755 myrient-qt "$pkgdir/usr/bin/myrient-gui"

  # Install CLI wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/myrient" << 'EOF'
#!/bin/bash
exec "$(dirname "$(readlink -f "$0")")/myrient-gui" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/myrient"

  # Install desktop file and icon from source
  install -Dm644 myrient.desktop "$pkgdir/usr/share/applications/myrient.desktop"
  install -Dm644 myrient.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/myrient.png"
}
