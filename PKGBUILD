# Maintainer: Score_Under <seejay.11@gmail.com>
pkgname=pngwolf-zopfli-git
pkgver=0.r80.31b3399
pkgrel=2
pkgdesc="A PNG optimizer using a genetic algorithm to find effective compression parameters"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jibsen/pngwolf-zopfli"
license=('GPL3')
# At the time of writing, you can get libdeflate as "libdeflate-git" from the
# AUR.
depends=(libzopfli.so zlib libdeflate)
makedepends=('git')
source=(git+https://github.com/jibsen/pngwolf-zopfli.git
        git+https://github.com/jibsen/galib.git#branch=pngwolf-support)
md5sums=(SKIP SKIP)

provides=('pngwolf')
conflicts=('pngwolf')

pkgver() {
  cd pngwolf-zopfli
  printf '0.r%s.%s' "$(git rev-list HEAD --count)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pngwolf-zopfli
  # Yes I know how morally wrong that awk is. What's worse is compiling it "by
  # the book", because that requires checking out all the git submodules and
  # prevents you from using dynamic libraries. Also, it's using Windows line
  # endings -- for shame!
  SOURCES="pngwolf.cxx $(awk '/^ *galib/{gsub("\r",""); print "../" $1}' CMakeLists.txt)"
  CPPFLAGS="-I../galib $CPPFLAGS"
  LDLIBS="-lz -lzopfli -ldeflate $LDLIBS"
  (
    set -x
    g++ -o pngwolf $SOURCES $CPPFLAGS $CXXFLAGS $LDFLAGS $LDLIBS
  )
}

package() {
  cd pngwolf-zopfli
  install -D pngwolf "$pkgdir/usr/bin/pngwolf"
}
