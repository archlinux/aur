# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xapian-core-git
pkgver=1.5.0.r18998.72a282c84759
pkgrel=1
pkgdesc="Open source search engine library"
arch=('i686' 'x86_64')
url="https://github.com/xapian/xapian"
license=('GPL')
depends=('zlib' 'util-linux')
makedepends=(
  'git'
  'help2man'
  'graphviz'
  'doxygen'
  'python-docutils'
  'python-pygments'
  'tcl'
  'pngcrush'
)
provides=('xapian-core')
conflicts=('xapian-core')
source=("git+https://github.com/xapian/xapian")
sha512sums=('SKIP')
options=('libtool')
		  
pkgver() {
  cd "$srcdir/xapian/xapian-core"
  printf "%s.r%s.%s" $(awk '/AC_INIT/ {print $2}' configure.ac |tr -d \[\],) \
	 $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/xapian"
  ./bootstrap xapian-core
  export CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}
  export CXXFLAGS+="-Wno-error=maybe-uninitialized -Wno-error=use-after-free"
  cd "$srcdir/xapian/${pkgname/-git/}"
  ./configure --prefix=/usr --enable-maintainer-mode
  #hack to make docs build
  make || true
  make
}

package() {
  cd "$srcdir"/xapian/xapian-core
  make DESTDIR="$pkgdir/" install
  cd "$pkgdir"/usr/lib/pkgconfig
  ln -s xapian-core-1.5.pc xapian-core.pc
}
