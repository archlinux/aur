# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Denis Kobozev <d.v.kobozev at gmail dot com>
# Contributor: Hauptmech <hauptmech@gmail.com>

pkgname=openrave-git
pkgver=3364.1cf3710
pkgrel=1
url="http://openrave.org"
pkgdesc="An environment for testing, developing, and deploying motion planning algorithms in real-world robotics applications."
arch=('i686' 'x86_64')
depends=('boost' 'soqt' 'bullet' 'ffmpeg' 'python2-numpy' 'python2-sympy'
         'python2-h5py' 'ode' 'collada-dom' 'assimp' 'mpfr' 'openscenegraph')
makedepends=('git' 'cmake')
optdepends=('cmake: plugin compilation'
            'qhull')
license=('LGPL' 'Apache')

_gitroot=https://github.com/rdiankov/openrave.git
_gitname=openrave

source=( "git+$_gitroot" )
md5sums=( "SKIP" )

pkgver() {
    cd "$srcdir/$_gitname"
      # Use the tag of the last commit
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  #sed -i -e 's/BIND_PER_PRIMITIVE/BIND_OVERALL/' plugins/qtosgrave/Item.cpp 
  mkdir -p build
  cd build
  cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
      -DCMAKE_CXX_FLAGS=-fpermissive

  make
}
package() {
  cd "$srcdir/${_gitname}/build"
  make install DESTDIR=$pkgdir
}
# vim:set ts=2 sw=2 et:
