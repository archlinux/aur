# Maintainer: KNOSSOS team <knossosteam ät gmail.com>

pkgname='pythonqt-knossos-git'
pkgver=3.2+151.g5bd6f18
pkgrel=1
arch=(x86_64)
pkgdesc='PythonQt fork with additional features for plugin support in KNOSSOS'
license=(LGPL)
url='https://github.com/knossos-project/PythonQt'
makedepends=(cmake git mesa ninja)
checkdepends=(xorg-server-xvfb)
depends=(python3 qt5-{declarative,multimedia,svg,tools,xmlpatterns})
replaces=(qt5-python27{,-git}) # taking the liberty to clean up
source=('git+https://github.com/knossos-project/PythonQt.git')
md5sums=('SKIP')

pkgver() {
  git -C 'PythonQt' describe --always --dirty --tags | sed 's/^v//;s/-/+/;s/-/./g'
}
prepare() {
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_PREFIX='/usr' -DPythonQt_Qt5=TRUE -DPythonQt_Python3=TRUE -DCMAKE_CXX_FLAGS='-Wno-deprecated-declarations -Wno-cpp' -S "$srcdir/PythonQt" -B "$srcdir/build-$CHOST-$pkgname"
}
build() {
  cmake --build "$srcdir/build-$CHOST-$pkgname"
}
check() {
  xvfb-run ninja -C "$srcdir/build-$CHOST-$pkgname" tests
}
package() {
  depends+=("python<$(semver -i minor $(pacman -Q python | cut -d' ' -f2))")
  env DESTDIR="$pkgdir" cmake --install "$srcdir/build-$CHOST-$pkgname"
}
