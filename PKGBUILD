pkgname=systemd-kcm
pkgver=1.2.1
pkgrel=5
pkgdesc="Systemd control module for KDE"
arch=(x86_64)
url='https://github.com/rthomsen/kcmsystemd'
license=(GPL)
depends=(kio5)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz"
        qt5_use_modules.patch)
sha256sums=('51960f4d3b4a1ceae28737c172c35aec8c1f4e534327fbc6dda76f1c17341389'
            '2829fbc268c0cac5ecf8da05cf15d8548d5d5d40bd5982851b35f143d42c8b7a')

prepare() {
  mkdir -p build

# fix kdesu path (FS#44396)
  sed -e 's|/lib/libexec/kdesu|/lib/kf5/kdesu|' -i $pkgname-$pkgver/src/kcmsystemd.cpp

  # patch qt5_use_modules error
  cd $pkgname-$pkgver
  patch -p1 -i ../qt5_use_modules.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_INSTALL_LIBDIR=lib \
   -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  # fix for kde5
  rm "${pkgdir}/usr/share/kservices5/settings-system-administration.desktop"
}
