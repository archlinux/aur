pkgname=ttop
pkgver=1.5.6
pkgrel=1
pkgdesc="System monitoring tool with historical data service, triggers and top-like TUI"
url="https://github.com/inv2004/ttop"
license=("MIT")
arch=('x86_64')
depends=("glibc")
makedepends=("git" "nim")
source=("git+$url.git#tag=v$pkgver"
        ".INSTALL")
sha256sums=('SKIP'
            'SKIP')
install=".INSTALL"
backup=("etc/ttop.toml")

prepare() {
# Shortcut
  echo -e "[Desktop Entry]
Name=ttop
Exec=ttop
Icon=ttop
Terminal=true
Type=Application
Comment=System monitoring tool with historical data service, triggers and top-like TUI" > ttop.desktop
}

build() {
  export NIMBLE_DIR="$srcdir/NIMBLE_CACHE"
  cd ttop
  nimble -y -d:release build
  nim r src/ttop/onoff.nim
}

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system" "$pkgdir/etc" "$pkgdir/var/log/ttop"
  install -Dm644 ttop.desktop -t "$pkgdir/usr/share/applications"
  cd ttop
  install -Dm644 .github/images/screen.png "$pkgdir/usr/share/pixmaps/ttop.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/ttop"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/ttop"
  install -Dm644 usr/lib/systemd/system/* "$pkgdir/usr/lib/systemd/system"
  install -Dm644 etc/* "$pkgdir/etc"
  install -Dm755 ttop -t "$pkgdir/usr/bin"
}
