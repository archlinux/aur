pkgname=legionaura
pkgver=2.0.0
pkgrel=1
pkgdesc="RGB keyboard lighting controller for Lenovo LOQ, Legion, and IdeaPad Gaming laptops (CLI + Qt GUI)"
arch=('x86_64')
url="https://github.com/nivedck/LegionAura"
license=('MIT')
depends=('libusb' 'qt6-base')
makedepends=('cmake' 'gcc')
source=("https://github.com/nivedck/LegionAura/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4b62b46fa9a76f3d99bd5a3b2cab3e85cbd5b70634041a711faec6ec8b5050c')
provides=('legion' 'legion-rgb' 'lenovo-legion' 'Lenovo' 'loq' 'lenovo-loq')
conflicts=('legion' 'legion-rgb')

build() {
  cd "LegionAura-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  cd "LegionAura-$pkgver/build"

  # Install CLI
  install -Dm755 cli/legionaura "$pkgdir/usr/bin/legionaura"

  # Install GUI
  install -Dm755 gui/legionaura-gui "$pkgdir/usr/bin/legionaura-gui"

  # Install runtime data (required for auto-detect in packaged installs)
  install -Dm644 ../devices/devices.json \
    "$pkgdir/usr/share/legionaura/devices.json"

  # Auto-apply last settings on graphical login (XDG autostart)
  install -Dm644 ../legionaura-autostart.desktop \
    "$pkgdir/usr/share/xdg/autostart/legionaura-autostart.desktop"

  # Install udev rules
  install -Dm644 ../udev/10-legionaura.rules \
    "$pkgdir/usr/lib/udev/rules.d/10-legionaura.rules"

  # Install desktop entry
  install -Dm644 ../legionaura.desktop \
    "$pkgdir/usr/share/applications/legionaura.desktop"

  # Install icon
  install -Dm644 ../icons/legionaura.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/legionaura.png"

  # Install license
  install -Dm644 ../LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
