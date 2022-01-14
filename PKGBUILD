# Maintainer: Donald <sirspudd _at_ gmail.com>
pkgname=litehtml-git
_pkgname=litehtml
pkgver=0.5.r135.ge7fa81d
pkgrel=1
pkgdesc='liteweight web rendering engine'
url='https://github.com/litehtml/litehtml'
source=("git+https://github.com/litehtml/litehtml")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('BSD')
makedepends=('cmake' 'clang' 'gumbo-parser')
depends=()
conflicts=('litehtml')
provides=('litehtml')
sha256sums=(SKIP)

build () {
  local working_dir=${srcdir}/${_pkgname}
  local build_dir=${working_dir}/build

  mkdir -p ${build_dir}
  cd ${build_dir}

  cmake -G Ninja  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_C_COMPILER=clang \
    -DBUILD_TESTING=OFF \
    -DEXTERNAL_GUMBO=ON \
    -DBUILD_SHARED_LIBS=ON \
    ${working_dir}

  ninja all
}

package() {
  cd "$srcdir/$_pkgname"

  local working_dir=${srcdir}/${_pkgname}
  local build_dir=${working_dir}/build

  cd ${build_dir}
  DESTDIR=${pkgdir} ninja install
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
