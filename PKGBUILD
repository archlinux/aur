# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey-git
_gitname=libnitrokey
pkgver=3.1r593.09f80ac
pkgrel=1
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(hidapi)
makedepends=('cmake' 'qt5-tools')
provides=('libnitrokey')
conflicts=('libnitrokey')
source=("${_gitname}::git+https://github.com/Nitrokey/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}/"
  curver=$(sed -n 's/^project(libnitrokey LANGUAGES C CXX VERSION \(.*\)\.0)$/\1/p' CMakeLists.txt)
  printf "%sr%s.%s" "$curver" "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_gitname}/"
  mkdir -p build
}

build() {
  cd "$srcdir/${_gitname}/build"

  cmake .. \
        -DBUILD_SHARED_LIBS=ON \
        -DCOMPILE_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}/build"
  make DESTDIR="$pkgdir" install

  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"

  cd "${pkgdir}/usr/"
  mv lib64 lib
}
