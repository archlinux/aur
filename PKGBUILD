# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
pkgname=openanno-archive
pkgver=0.1
pkgrel=1
pkgdesc="Very early and completely broken ancestor of the real-time strategy game Unknown Horizons. Git version."
arch=('i686' 'x86_64')
url=https://github.com/GreyGhost/OpenAnno-Archive
license=('GPL')
depends=('sdl' 'sdl_gfx' 'sdl_image' 'sdl_ttf' 'sdl_mixer'
         'physfs' 'gettext')
makedepends=('cmake' 'git')
optdepends=('unknown-horizons: The game developed starting from here')
source=($pkgname::git+https://github.com/GreyGhost/OpenAnno-Archive.git)

_where="$pkgname/CPP_0_1"

prepare() {
  cd "$srcdir/$_where"
  # Fix linker trouble with lua not accepting `-ldl`
  # Apparently there is no way of passing FLAGS as env var here
  sed -i -e 's@openanno lua tinyxml@& dl@g' "src/CMakeLists.txt"
}

build() {
  cd "$srcdir/$_where"
  cmake -Wno-dev .
  make -j4
}

package() {
  cd "$srcdir/$_where"

  # Even `make install` appears to be broken...
  #make DESTDIR="$pkgdir/" install

  msg  "Manually copying data to /opt/ since ``make install`` appears broken."
  mkdir -p "$pkgdir/opt/OpenAnno/data"
  cp -r src/openanno "$pkgdir/opt/OpenAnno/"
  cp -r data/*       "$pkgdir/opt/OpenAnno/data/"
  cp icon.png        "$pkgdir/opt/OpenAnno/"
  msg  "To launch:"
  msg2 "cd /opt/OpenAnno/"
  msg2 "./openanno"
}

md5sums=('SKIP')
sha256sums=('SKIP')
