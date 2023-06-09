# Maintainer: Antonio Rojas <arojas@archlinux.org>

basepkgname=bluez-qt
pkgname=${basepkgname}6
pkgver=5.103.0
pkgrel=1
pkgdesc='Qt wrapper for Bluez 5 DBus API'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(GPL2)
depends=(qt6-base bluez)
makedepends=(extra-cmake-modules doxygen qt6-tools qt6-doc qt6-declarative)
optdepends=('qt6-declarative: QML bindings')
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$basepkgname-$pkgver.tar.xz{,.sig})
sha256sums=('ff431505377a5e3598de4beab414133b32f4812de476bb5fd82e1aa22c1bd8f0'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $basepkgname-$pkgver \
    -DUDEV_RULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_PREFIX=/opt/KF5-qt6/
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  mv $pkgdir/usr/lib/udev/rules.d/61-kde-bluetooth-rfkill.rules $pkgdir/usr/lib/udev/rules.d/61-kde-bluetooth-rfkill-6.rules
}
