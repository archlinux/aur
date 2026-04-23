pkgname=xbelite2-dkms
pkgver=0.9.4
pkgrel=1
pkgdesc='Xbox Elite Series 2 controller driver and configurator for Linux'
arch=('x86_64')
url='https://github.com/lemonxah/xbelite2'
license=('GPL-2.0-only')
options=('!lto' '!debug')
depends=('qt6-base' 'qt6-declarative' 'dkms')
makedepends=('rust' 'cargo')
backup=('etc/udev/rules.d/99-xbelite2.rules' 'etc/modprobe.d/xbelite2-blacklist.conf')
install=xbelite2.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa6a9ddef2dfcd12aa28ef1c8fe1cfdae5b0f7a54dbe155ecc37e5ce52cbd471')

build() {
  cd "$srcdir/xbelite2-$pkgver"
  cargo build --release --workspace
}

package() {
  cd "$srcdir/xbelite2-$pkgver"

  install -Dm755 target/release/xbe2-rw        "$pkgdir/usr/bin/xbe2-rw"
  install -Dm755 target/release/xbe2-bt        "$pkgdir/usr/bin/xbe2-bt"
  install -Dm755 target/release/xbelite2-gui   "$pkgdir/usr/bin/xbelite2-gui"

  install -Dm644 99-xbelite2.rules                     "$pkgdir/etc/udev/rules.d/99-xbelite2.rules"
  install -Dm644 pkg/modprobe.d/xbelite2-blacklist.conf "$pkgdir/etc/modprobe.d/xbelite2-blacklist.conf"

  # DKMS kernel module source
  local _dkmsdir="$pkgdir/usr/src/$pkgname-$pkgver"
  install -Dm644 kmod/dkms.conf         "$_dkmsdir/dkms.conf"
  install -Dm644 kmod/Kbuild            "$_dkmsdir/Kbuild"
  install -Dm644 kmod/Makefile          "$_dkmsdir/Makefile"
  install -Dm644 kmod/xbelite2_c.c      "$_dkmsdir/xbelite2_c.c"
  install -Dm644 kmod/xbelite2_logic.c  "$_dkmsdir/xbelite2_logic.c"

  install -Dm644 README.md       "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/elite2.png "$pkgdir/usr/share/doc/$pkgname/elite2.png"

  # Desktop entry for the GUI
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/xbelite2-gui.desktop" <<EOF
[Desktop Entry]
Name=Xbox Elite 2 Configurator
Comment=Configure Xbox Elite Series 2 controller profiles
Exec=xbelite2-gui
Icon=input-gaming
Terminal=false
Type=Application
Categories=Settings;HardwareSettings;
EOF
}
