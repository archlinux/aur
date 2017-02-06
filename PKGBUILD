# Maintainer: Score_Under <seejay.11@gmail.com>
pkgname=pngwolf-zopfli-git
pkgver=0.r76.952f812
pkgrel=1
pkgdesc="A PNG optimizer using a genetic algorithm to find effective compression parameters"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jibsen/pngwolf-zopfli"
license=('GPL3')
# At the time of writing, you can get libdeflate as "libdeflate-git" from the
# AUR.
depends=(libzopfli zlib libdeflate)
makedepends=('git')
source=(git+https://github.com/jibsen/pngwolf-zopfli.git
        http://lancet.mit.edu/ga/dist/galib247.tgz)
md5sums=('SKIP'
         '2b6a28fd06d4c7c4d0bb39c92b2b376c')

provides=('pngwolf')
conflicts=('pngwolf')

pkgver() {
  cd pngwolf-zopfli
  printf '0.r%s.%s' "$(git rev-list HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mv galib247 galib
  patch -Np1 -i pngwolf-zopfli/galib247.patch
}

build() {
  cd pngwolf-zopfli
  # Yes I know how morally wrong that awk is. What's worse is compiling it "by
  # the book", because that requires checking out all the git submodules and
  # prevents you from using dynamic libraries. Also, it's using Windows line
  # endings -- for shame!
  SOURCES="pngwolf.cxx $(awk '/^ *galib/{gsub("\r",""); print "../" $1}' CMakeLists.txt)"
  CPPFLAGS="-I../galib $CPPFLAGS"
  # -fpermissive required because the author tries to implicitly drop a const qualifier
  CXXFLAGS="$CXXFLAGS -fpermissive"
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
