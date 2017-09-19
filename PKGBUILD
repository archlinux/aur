# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=libnitrokey-git
_gitname=libnitrokey
pkgver=3.0r515.8f7435e
pkgrel=4
pkgdesc="Communicate with Nitrokey stick devices in a clean and easy manner"
arch=('i686' 'x86_64')
url="https://www.nitrokey.com"
license=('LGPL3')
depends=(libusb hidapi)
makedepends=('cmake' 'qt5-tools')
provides=('libnitrokey')
conflicts=('libnitrokey')
source=("${_gitname}::git+https://github.com/Nitrokey/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}/"
  curver=$(sed -n 's/^SET(PROJECT_VERSION "\(.*\)-alpha")$/\1/p' CMakeLists.txt)
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
        -DLIBNITROKEY_STATIC=OFF \
        -DCOMPILE_TESTS=OFF \
        -DUSE_CLANG=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${_gitname}/build"
  make DESTDIR="$pkgdir" install
  install -D -m755 libnitrokey-log.so "$pkgdir/usr/lib/libnitrokey-log.so"

  cd ..
  install -d -m755 $pkgdir/usr/lib/${_gitname}
  cp -R include $pkgdir/usr/lib/${_gitname}/

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
