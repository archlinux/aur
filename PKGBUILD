# Maintainer: ptrv <mail@petervasil.net>

pkgname=sc3-plugins-git
_name="sc3-plugins"
pkgver=3.7.0.alpha1.r7.g9367339
pkgrel=1
pkgdesc="Plugins for SuperCollider (Git version)"
url="http://supercollider.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('supercollider')
conflicts=('supercollider-with-extras-git')
provides=('supercollider-with-extras-git')

source=("${_name}::git+https://github.com/supercollider/sc3-plugins")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/Version.//g'
}

build() {
  cd $srcdir/$_name
  git submodule update --init --recursive .

  [ -d bld ] || mkdir bld && cd bld

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DSC_PATH=$HOME/src/supercollider \
        -DSUPERNOVA=1\
        -DAY=1
  make
}

package() {
  cd "$srcdir/$_name/bld"
  make DESTDIR="$pkgdir/" install
}
