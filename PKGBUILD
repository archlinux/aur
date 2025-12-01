# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-screenlocker
pkgver=0.5
pkgrel=3
pkgdesc="CutefishOS system screen locker"
arch=('x86_64')
url="https://github.com/cutefishos/screenlocker"
license=('GPL-3.0-or-later')
groups=('cutefish')
depends=('fishui' 'libcutefish')
makedepends=('extra-cmake-modules' 'ninja' 'qt5-tools')
source=("https://github.com/cutefishos/screenlocker/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        fix-build.patch)
sha512sums=('7b5c2064afe74ff036a840cb73ea51a0b203d4abd2756d983bd160b670374813d851a9b0f8fd0028d3dc3340c1947b8edd153ce4c9cd966d480f4e65fb9f8f76'
            '490ff5189a491bcb9e6f3ed04647196f3431746834a7f2d86ac82a14347e5db2acc3d91898997697b836798fe37c0130bb62c3e8f92301647307c63a5e3847b3')

prepare() {
  cd screenlocker-$pkgver

  # Fix build
  patch -p1 -i ../fix-build.patch

  # Disable layer effect when the Qt Quick software backend is used
  sed -i 's/layer\.enabled: true/layer.enabled: GraphicsInfo.api !== GraphicsInfo.Software/' screenlocker/qml/*.qml
}

build() {
  cmake -G Ninja -B build -S screenlocker-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE4_KSCREENSAVER_PAM_SERVICE=system-login  # https://github.com/cutefishos/screenlocker/issues/2
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
