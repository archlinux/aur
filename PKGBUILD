# Maintainer: Lizr <oilizr2004@gmail.com>
pkgname=ccrplus
pkgver=1.1.0
pkgrel=3
pkgdesc="A opensource and cross-platform judge environment for OI contest."
arch=('x86_64')
url="https://github.com/sxyzccr/CCR-Plus"
license=('GPL')
depends=('qt5-base')
makedepends=('git' 'imagemagick')
source=(
    "CCR-Plus::git+https://github.com/sxyzccr/CCR-Plus.git"
    "ccrplus.desktop"
    "ccrplus.patch"
    "logo.png"
)
md5sums=('SKIP'
         '1931fae6a6bc9b3af2c482abb2c486a2'
         '373961947698de92068588bd4e982609'
         '868c770c21bd42936562591d569bdfe3')

prepare() {
    cd ${srcdir}/CCR-Plus
    patch -p1 < ${srcdir}/ccrplus.patch
}

build() {
  cd $srcdir/CCR-Plus
  mkdir -p build && cd build
  qmake-qt5 ..
  make -j$(nproc)
}

package() {

  cd "$srcdir/CCR-Plus"
  mkdir -p $pkgdir/usr/share/ccrplus/checker
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  install -m755 'build/src/CCR-Plus' "$pkgdir/usr/share/ccrplus"
  install -m755 'build/src/tools/checker/fulltext' "$pkgdir/usr/share/ccrplus/checker/fulltext"
  install -m755 'build/src/tools/monitor/monitor' "$pkgdir/usr/share/ccrplus/monitor"
  install -m644 "$srcdir/ccrplus.desktop" "$pkgdir/usr/share/applications/ccrplus.desktop"
  ln -s "/usr/share/ccrplus/CCR-Plus" "$pkgdir/usr/bin/ccrplus"

  for size in 16x16 22x22 32x32 44x44 48x48 64x64 128x128 150x150; do
    mkdir -p $pkgdir/usr/share/icons/hicolor/$size/apps
    convert $srcdir/logo.png -resize $size $pkgdir/usr/share/icons/hicolor/$size/apps/ccrplus.png
  done
}
