# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
# Contributor: Matthias Maennich <arch@maennich.net>

pkgname=shiboken-git
pkgver=0.4.0.1373.g9536f13
pkgrel=1
_pyver=2.7
pkgdesc="Support library for Python bindings"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=("python2>=${_pyver}" "qt4>=4.8" 'openssl')
optdepends=("python-sphinx: Documentation")
makedepends=('cmake' 'automoc4' 'generatorrunner-git')
conflicts=("shiboken")
provides=("shiboken")
source=($pkgname::git+https://github.com/PySide/Shiboken.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr  \
            -DCMAKE_BUILD_TYPE=Release   \
            -DBUILD_TESTS=OFF            \
            -DPYTHON_EXECUTABLE=/usr/bin/python$_pyver \
            -DPYTHON_LIBRARY=/usr/lib/libpython$_pyver.so
  make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install

    cd generator
    mkdir -p "$pkgdir/usr/lib/cmake/Shiboken-$pkgver"
    install -Dm755 ../data/ShibokenConfig.cmake \
        "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/"
    install -Dm755 ../data/ShibokenConfigVersion.cmake \
        "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/"
    install -Dm755 ../data/ShibokenConfig-python$_pyver.cmake \
        "$pkgdir/usr/lib/cmake/Shiboken-$pkgver/"
    install -Dm755 ../data/shiboken.pc "$pkgdir/usr/lib/pkgconfig"
}

