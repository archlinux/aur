# Maintainer: Albert Westra <odyssyewestra@gmail.com>
# Maintainer: Iru Cai <mytbk920423@gmail.com>

_basever=2.0.0.master
pkgname=libmypaint-git
pkgver=2.0.0.master.r981.c28b059
pkgrel=1
pkgdesc="A library for making brushstrokes which is used by MyPaint and other projects."
arch=('i686' 'x86_64')
url="http://mypaint.org/"
license=('ISC')
depends=('gobject-introspection' 'json-c')
makedepends=('git' 'intltool' 'python')
provides=("libmypaint=${_basever}")
conflicts=('libmypaint')
source=('git+https://github.com/mypaint/libmypaint.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libmypaint"

  printf "${_basever}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//g;s/-/./g'
}

prepare() {
    cd "${srcdir}/libmypaint"
    export CFLAGS='-Ofast -ftree-vectorize -fopt-info-vec-optimized -march=native -mtune=native -funsafe-math-optimizations -funsafe-loop-optimizations'
    
}

build() {
  cd "$srcdir/libmypaint"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libmypaint"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
