# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=OpenTimelineIO
pkgname=${_pkgname,,}-git
pkgver=last_pure_python.r346.g6cd4161a
pkgrel=1
pkgdesc='Open Source API and interchange format for editorial timeline information'
url='http://opentimeline.io/'
license=(Apache)
arch=(x86_64)
depends=(python-aaf2 python-setuptools)
makedepends=(cmake imath python-pip pybind11 git)
optdepends=('pyside2: Required to run otioview')
source=($_pkgname::git+https://github.com/AcademySoftwareFoundation/$_pkgname
        any::git+https://github.com/thelink2012/any
        optional-lite::git+https://github.com/martinmoene/optional-lite
        rapidjson::git+https://github.com/Tencent/rapidjson
        opentimelineio-c++17.patch)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '36650ae9ab93af5ea9006e3e074a5f33106378dc353ec18345615c1c5f5c0fdc')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  for dependency in Imath pybind11; do
    git rm src/deps/$dependency
  done
  for dependency in any optional-lite rapidjson; do
    git config submodule.src/deps/$dependency.url $srcdir/$dependency
  done
  git submodule update

  # Unbundle pybind11
  sed -e '/set(DEPS_SUBMODULES/ s/pybind11 //' -i src/deps/CMakeLists.txt # Unbundle pybind11
  sed -e '/if(OTIO_PYTHON_INSTALL)/,+3d' -i src/deps/CMakeLists.txt
  sed -e '1 i\find_package(pybind11)' -i src/py-opentimelineio/opentime-bindings/CMakeLists.txt \
                                      -i src/py-opentimelineio/opentimelineio-bindings/CMakeLists.txt

  # Unbundle Imath
  sed -e "/DOTIO_INSTALL_PYTHON_MODULES/ i\            '-DOTIO_FIND_IMATH:BOOL=ON'," -i setup.py

  #  Use native C++17 types
  patch -d "$srcdir"/OpenTimelineIO -p2 < "$srcdir"/opentimelineio-c++17.patch
}

build() {
  cmake -B build -S OpenTimelineIO \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOTIO_FIND_IMATH=ON
  cmake --build build

  cd OpenTimelineIO
  python setup.py build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd OpenTimelineIO
  DESTDIR="$pkgdir" python setup.py install --root="$pkgdir" --optimize=1
  rm -fr "$pkgdir"/build
}
