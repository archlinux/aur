# Maintainer: Magnus Lång <magnus.lang@it.uu.se>
pkgname=nidhugg-git
pkgver=0.2.r152.ea22422
pkgrel=2
pkgdesc="A bug-finding tool for concurrency and weak-memory bugs in C and C++ programs"
arch=('x86_64' 'i686')
url="https://github.com/nidhugg/nidhugg"
license=('GPL')
depends=('python' 'clang')
makedepends=('llvm'
             'boost') # For check() only
provides=("nidhugg=$pkgver")
conflicts=('nidhugg')
source=("git://github.com/nidhugg/nidhugg.git")
sha256sums=('SKIP')

pkgver() {
  cd nidhugg
  # Versions are tracked not with git, but by updating the configure.ac file.
  _vercommit="$(git blame --porcelain configure.ac | head -1 | cut -d' ' -f1)"
  printf "%s.r%s.%s" \
         "$(head -1 configure.ac | sed 's/AC_INIT(\[Nidhugg\], \[\([^]]*\)\].*/\1/')" \
         "$(git rev-list --count $_vercommit..HEAD)" \
         "$(git rev-parse --short $_vercommit)"
}

build() {
  cd nidhugg
  autoreconf -fi
  export CXXFLAGS="$CXXFLAGS -isystem /usr/lib/libffi-3.2.1/include/"
  export CFLAGS="$CFLAGS -isystem /usr/lib/libffi-3.2.1/include/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/nidhugg"
  make test
}

package() {
  cd "$srcdir/nidhugg"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
