# Maintainer: Steven Joruk <steven@joruk.com>

pkgname=gumbo-gq-git
pkgver=r138.f2051cc
pkgrel=2
pkgdesc="GQ is a CSS Selector Engine for Gumbo Parser written in C++11"
url=""
arch=("x86_64")
license=("MIT")
makedepends=("cmake" "git" "boost")
depends=("gumbo-git")

source=(
  "${pkgname%-git}"::"git://github.com/TechnikEmpire/GQ.git"
  "0001-Add-CMake-install.patch"
)

md5sums=(
  "SKIP"
  "2a050ea524fdceac7c6af6596b7d9c80"
)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -Np1 -i "$srcdir/0001-Add-CMake-install.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib

  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
