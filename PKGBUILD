# Maintainer: Alex Biddulph <bidskii@gmail.com>
pkgname=nuclear-git
pkgver=r876.42d9b0d
pkgrel=1
pkgdesc="NUClear is a C++ software framework designed to aid in the development of real time modular systems."
arch=('x86_64' 'i686')
url="https://github.com/Fastcode/NUClear"
license=('MIT')
groups=('devel')
makedepends=('git' 'make' 'cmake>=3.1', 'gcc>=4.9')
optdepends=('python-sphinx: documentation' 'doxygen: documentation')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}"::'git+https://github.com/Fastcode/NUClear.git#branch=master')
md5sums=('SKIP')
# Check for optional dependencies
_installed_pkgs=$(pacman -Qq)
_sphinx_installed=$(echo "${_installed_pkgs}" | grep "python-sphinx" > /dev/null ; echo $?)
_doxygen_installed=$(echo "${_installed_pkgs}" | grep "doxygen" > /dev/null ; echo $?)
pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "$srcdir/${pkgname%-git}"
  # Check to see if we should build documentation
  optional_args="-DBUILD_DOCUMENTATION=OFF"
  if [[ ( "${_sphinx_installed}" == 0 ) && ( "${_doxygen_installed}" == 0 ) ]];
  then
    optional_args="-DBUILD_DOCUMENTATION=ON"
  fi
  echo "${optional_args}" "${_sphinx_installed}" "${_doxygen_installed}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib \
           -DBUILD_TESTS=ON \
           ${optional_args}
    make
}
check() {
  cd "$srcdir/${pkgname%-git}/build"
  ./tests/test_nuclear
}
package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    cd "$srcdir/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

