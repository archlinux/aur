# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-runtime-plasma4extras
pkgver=17.08.3
pkgrel=1
pkgdesc="KDE Plasma 4 extras package from kdebase-runtime"
arch=('x86_64')
url='https://www.kde.org/'
license=('GPL' 'LGPL')
makedepends=('cmake' 'automoc4')
depends=('kactivities4')
source=("https://download.kde.org/stable/applications/$pkgver/src/kde-runtime-$pkgver.tar.xz"
	build-plasma4extras-only.patch)
sha256sums=('682c18afb11cda41288c4508831cb59797417b9d81ea916e0e99722ebe9bce96'
            'd6bce940accaf7f41fba994574f7e9b2c2ba6a5f94d4b42a52949a905330a658')

prepare() {
  mkdir -p build

  cd kde-runtime-$pkgver

  # Only build the plasma 4 extras, not the rest of kdebase-runtime
  patch -p1 -i ../build-plasma4extras-only.patch
}

build() {
  cd build
  cmake ../kde-runtime-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # Remove /usr/bin/kde4 script which is already provided by
  # kdebase-runtime
  rm -r "$pkgdir"/usr/bin
}
