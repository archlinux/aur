# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=libarea-git
pkgver=120.f1986ac
pkgrel=5
pkgdesc="Library and python module for pocketing and profiling operations"
arch=('x86_64')
provides=('libarea')
url="https://github.com/Heeks/libarea"
license=('custom:BSD3')
depends=('python' 'opencascade' 'boost')
makedepends=('git' 'cmake')
source=('git://github.com/Heeks/libarea.git')
md5sums=('SKIP')

pkgver() {
  cd libarea
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd libarea
  sed -i 's,COMMAND python-config --includes,COMMAND python2-config --includes,g' CMakeLists.txt
  sed -i 's,COMMAND python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())",COMMAND python2 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())",g' CMakeLists.txt

}

build() {
  msg "Starting build..."
  export CASROOT=/opt/opencascade
  cd libarea
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
  cd libarea/build
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/libarea-git"
  install -m644 "$srcdir/libarea/debian/copyright" "$pkgdir/usr/share/licenses/libarea-git/copyright"
}
