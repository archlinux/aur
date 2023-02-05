# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=opentimelineio0.14
pkgver=0.14.1
pkgrel=1
pkgdesc='Open Source API and interchange format for editorial timeline information'
url='http://opentimeline.io/'
license=(Apache)
arch=(x86_64)
provides=(opentimelineio)
conflicts=(opentimelineio)
depends=(python-aaf2)
makedepends=(cmake python-pip python-setuptools pybind11 git)
source=(https://github.com/PixarAnimationStudios/OpenTimelineIO/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        git+https://github.com/Tencent/rapidjson#commit=66eb606
        opentimelineio-c++17.patch)
sha256sums=('04c0a5c2f0639a0a1e9745d40cdb9e86f966c85f19880e8ca614699175a93554'
            'SKIP'
            '36650ae9ab93af5ea9006e3e074a5f33106378dc353ec18345615c1c5f5c0fdc')

prepare() {
  mv rapidjson OpenTimelineIO-$pkgver/src/deps
  sed -e '/deps/d' -i OpenTimelineIO-$pkgver/CMakeLists.txt # Unbundle pybind11
  sed -e '1 i\find_package(pybind11)' -i OpenTimelineIO-$pkgver/src/py-opentimelineio/opentime-bindings/CMakeLists.txt \
                                      -i OpenTimelineIO-$pkgver/src/py-opentimelineio/opentimelineio-bindings/CMakeLists.txt

  patch -d OpenTimelineIO-$pkgver -p1 < opentimelineio-c++17.patch # Use native C++17 types
}

build() {
  cmake -B build -S OpenTimelineIO-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  cd OpenTimelineIO-$pkgver
  python setup.py build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd OpenTimelineIO-$pkgver
  DESTDIR="$pkgdir" python setup.py install --root="$pkgdir" --optimize=1
  rm -fr "$pkgdir"/build
}
