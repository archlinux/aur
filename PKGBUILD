# Maintainer: Spyhawk

pkgname=libzypp-git
pkgver=14.32.0
pkgrel=1
pkgdesc="Package, Patch, Pattern, and Product Management"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/libzypp"
license=('GPL')
depends=('libsolv-git' 'openssl' 'curl' 'libsystemd')
makedepends=('git' 'cmake' 'boost' 'dejagnu' 'graphviz'
             'libxml2' 'expat' 'gnupg' 'rpm-org' 'libproxy')
             # doxygen
provides=('libzypp')
conflicts=('libzypp')
source=('git+https://github.com/openSUSE/libzypp.git')
md5sums=('SKIP')
_gitname="libzypp"

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed -r 's/-/./g')
}

build() {
  cd "$srcdir/$_gitname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SKIP_RPATH=1 \
    -D DISABLE_AUTODOCS=1 \
    -D DISABLE_LIBPROXY=0 \
    .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  # cmake fix (see GH#28)
  mkdir -p $pkgdir/usr/lib/cmake/Zypp
  mv $pkgdir/usr/share/cmake/Modules/FindZypp.cmake $pkgdir/usr/lib/cmake/Zypp/ZyppConfig.cmake
  mv $pkgdir/usr/share/cmake/Modules/ZyppCommon.cmake $pkgdir/usr/lib/cmake/Zypp/ZyppCommon.cmake
  
  # hacky lib64 symlink fix
  mv $pkgdir/usr/lib64/* $pkgdir/usr/lib/
  rmdir $pkgdir/usr/lib64
}
