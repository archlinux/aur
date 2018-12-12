# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=zypper-git
pkgver=1.14.18.7.ge9dd3e4d
pkgrel=1
pkgdesc="Command line software manager using libzypp"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/zypper"
license=('GPL')
depends=('libzypp-git' 'libxml2' 'procps' 'readline' 'augeas')
makedepends=('git' 'cmake' 'ninja' 'boost' 'asciidoc')
provides=('zypper' 'apt')
conflicts=('zypper' 'apt')
source=('git+https://github.com/openSUSE/zypper.git'
        'make-ZyppCommon-cmake-module-includable.patch')
sha256sums=('SKIP'
            'f5cdd85109c58d786f1124fa3cab1c5431a93a8d87a59117eac257c6e4698ae7')
_gitname="zypper"

pkgver() {
  cd "${_gitname}"
  echo $(git describe --always | sed -r 's/-/./g')
}

prepare() {
  cd "${_gitname}"
  patch -p1 -i ../make-ZyppCommon-cmake-module-includable.patch 
}

build() {
  cd "${_gitname}"
  mkdir -p build && cd build
  cmake \
    -G Ninja \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D LIB=/lib \
    -D ZYPP_PREFIX=/usr \
    ..
  ninja
}

package() {
  cd "${_gitname}/build"
  DESTDIR="$pkgdir/" ninja install

  # hacky sbin symlink fix
  mv "${pkgdir}"/usr/sbin/* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}
