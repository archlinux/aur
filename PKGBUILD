# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=update-notifier-qt
pkgver=26.01.9
pkgrel=1
pkgdesc="Qt-based update notifier tray for Arch Linux"
arch=("x86_64")
url="https://github.com/AdrianTM/update-notifier-qt"
license=("GPL")
depends=("qt6-base" "qt6-svg" "dbus" "polkit" "pacman")
makedepends=("cmake" "ninja" "qt6-tools")
install=update-notifier-qt.install
source=("https://github.com/AdrianTM/update-notifier-qt/archive/refs/tags/26.01.9.tar.gz")
sha256sums=('77c08be62941d8ef0aa45167088561828cd20b37a427cbd18c8a625abfa77509')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DAPP_VERSION="${pkgver}-${pkgrel}"

  ninja
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  DESTDIR="${pkgdir}" ninja install

  # Create symlink to enable tray service globally (package-managed)
  install -dm755 "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants"
  ln -s ../update-notifier-tray.service \
    "${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/update-notifier-tray.service"
}
