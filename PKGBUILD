# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: fzerorubigd <fzero@rubi.gd>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=openage-git
pkgver=v0.3.0.r1077.gf624779b
pkgrel=1
pkgdesc='A free (as in freedom) clone of the Age of Empires II engine'
arch=('i686' 'x86_64')
url='http://openage.sft.mx/'
license=('GPL3')
depends=('python' 'libepoxy' 'ftgl' 'sdl2_image' 'opusfile' 'qt5-declarative' 'xdg-utils' 'sdl2' 'qt5-quickcontrols' 'libpng' 'python-pillow' 'python-numpy')
makedepends=('git' 'cmake' 'cython' 'python-pygments' 'opus-tools' 'doxygen')
optdepends=('opus-tools: for the media convert script'
            'ttf-dejavu: for text display, but you can use any font')
provides=('openage' 'nyan-lang')
conflicts=('openage' 'nyan-lang' 'nyan-lang-git')

source=("$pkgname::git+https://github.com/SFTtech/openage")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DDOWNLOAD_NYAN=YES \
        -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  install -d $pkgdir/usr/bin
  cp "$srcdir/$pkgname/run.py" $pkgdir/usr/bin/openage
}
