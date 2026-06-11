# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>

pkgname=remidock
pkgver=0.3.2
pkgrel=1
pkgdesc='Custom Qt/QML dock for KDE Plasma Wayland'
arch=('x86_64')
url='https://github.com/yousefvand/RemiDock'
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-imageformats'
  'layer-shell-qt'
  'libpulse'
)
makedepends=(
  'cmake'
  'ninja'
  'gcc'
  'extra-cmake-modules'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yousefvand/RemiDock/archive/refs/tags/v0.3.2.tar.gz")
sha256sums=('bc644f8af3f0e0736e9df86ecd85d44c37e0612d898c6ee255ac0b07ee21cf86')

build() {
  cmake -S "RemiDock-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "RemiDock-${pkgver}/icon.png" "$pkgdir/usr/share/pixmaps/remidock.png"

  if [[ -f "$pkgdir/usr/share/applications/org.remisa.RemiDock.desktop" ]]; then
    sed -i 's/^Icon=.*/Icon=remidock/' "$pkgdir/usr/share/applications/org.remisa.RemiDock.desktop"
  fi

  # Install a global XDG autostart entry so RemiDock starts automatically
  # for users on their next Plasma/KDE login after installing from AUR.
  if [[ -f "RemiDock-${pkgver}/data/org.remisa.RemiDock.desktop" ]]; then
    install -Dm644 "RemiDock-${pkgver}/data/org.remisa.RemiDock.desktop" "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop"
    sed -i 's/^Icon=.*/Icon=remidock/' "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop"
    grep -q '^X-GNOME-Autostart-enabled=' "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop" ||       printf 'X-GNOME-Autostart-enabled=true\n' >> "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop"
    grep -q '^X-KDE-autostart-after=' "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop" ||       printf 'X-KDE-autostart-after=panel\n' >> "$pkgdir/etc/xdg/autostart/org.remisa.RemiDock.desktop"
  fi
}
