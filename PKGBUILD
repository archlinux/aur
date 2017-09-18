# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ddroom-git
pkgver=r102.07dd715
pkgrel=2
pkgdesc='Digital photo processing application'
arch=('i686' 'x86_64')
url='https://github.com/ddroom/DDRoom'
license=('GPL')
depends=(openjpeg2 lensfun qt5-base hicolor-icon-theme ocl-icd exiv2)
makedepends=(libpng mesa exiv2 lensfun libgl libtiff zlib openjpeg expat qt5-base opencl-headers)
provides=(ddroom)
conflicts=(ddroom)
source=(
git://github.com/ddroom/DDRoom.git
libpng.diff
openjpeg.diff
ddroom.desktop
)
sha256sums=('SKIP'
            '3888ccad9b6ca73cbaa5707e0721f50bc55d706b6575ad8dcbd706833301e2f2'
            '422e8726a7f86f8799fc1540b4be95528bbe2b9832b05be8edbce8a0b13b0c39'
            '295ead54a3b159ec084c0e369a54b8ac99993eff7f8936c12e8c1e8cbf91d419')
_gitname='DDRoom'

prepare(){
  cd "$srcdir"/$_gitname
  patch -p1 -i $srcdir/libpng.diff
  patch -p1 -i $srcdir/openjpeg.diff
}
pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
build(){
  cd "$srcdir"/$_gitname
  qmake
  make -f Makefile.Release
}
package(){
  cd "$srcdir"/$_gitname
  make -f Makefile.Release DESTDIR="$pkgdir/" install
  install -Dm755 release/ddroom "$pkgdir"/usr/bin/ddroom
  install -Dm644 resources/ddroom.png "$pkgdir"/usr/share/icons/ddroom.png
  install -Dm644 "$srcdir"/../ddroom.desktop "$pkgdir"/usr/share/applications/ddroom.desktop
}

