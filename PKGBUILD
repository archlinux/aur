# Maintainer: sphekes <sphekes@qq.com>

pkgname=plasma-notification-mirror
pkgver=0.2.0
pkgrel=2
pkgdesc='Mirror KDE Plasma notification popups to additional monitors on Wayland'
arch=('x86_64')
url='https://github.com/MysteriousAeon/plasma-notification-mirror'
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'layer-shell-qt>=6.6' 'systemd-libs')
makedepends=('cmake' 'ninja' 'pkgconf')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  '0001-pin-layer-shell-screen.patch'
)
sha256sums=(
  'cccf650fa4fc6bff2f4d733de99de2e7cf95468f086eb26d791f26e3c3bef5f8'
  '80100b99cf1ac33cbfe87459ce19a01f422632a9306ec44965b17895fb99632a'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-pin-layer-shell-screen.patch"

  sed -i \
    's|^ExecStart=.*|ExecStart=/usr/bin/plasma-notification-mirror|' \
    systemd/plasma-notification-mirror.service

  sed -i \
    's|${CMAKE_INSTALL_DATADIR}/systemd/user|${CMAKE_INSTALL_LIBDIR}/systemd/user|' \
    CMakeLists.txt
}

build() {
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$pkgname-$pkgver/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
