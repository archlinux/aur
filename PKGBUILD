# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=openboard-git
_fragment="#branch=master"
pkgver=v1.5.3.r0.g426b1f7a
pkgrel=1
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64')
url="http://openboard.ch/index.en.html"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'qt5-tools' 'qt5-xmlpatterns' 'libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
source=("git://github.com/OpenBoard-org/OpenBoard.git${_fragment}"
        "git://github.com/OpenBoard-org/OpenBoard-ThirdParty.git"
        qchar.patch
        qwebkit.patch
        https://github.com/OpenBoard-org/OpenBoard/pull/218.diff
        https://github.com/OpenBoard-org/OpenBoard/pull/223.diff
        openboard.desktop)
md5sums=('SKIP'
         'SKIP'
         'bf2c524f3897cfcfb4315bcd92d4206e'
         '60f64db6bf627015f4747879c4b30fd3'
         'f484614cc48181287607afb5a45ef644'
         '04c421c140e983d41975943ede5fe61a'
         '21d1749400802f8fc0669feaf77de683')

pkgver() {
  cd $srcdir/OpenBoard
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/OpenBoard
  patch -p1 < $srcdir/qchar.patch
  patch -p1 < $srcdir/qwebkit.patch
  patch -p1 < $srcdir/218.diff
  patch -p1 < $srcdir/223.diff
}

build() {
  cd "$srcdir/OpenBoard-ThirdParty"
  
  cd freetype
  qmake freetype.pro -spec linux-g++
  make
  cd ..

  cd quazip
  qmake quazip.pro -spec linux-g++
  make
  cd ..

  cd xpdf/xpdf-3.04
  ./configure --with-freetype2-library="../../freetype/lib/linux" --with-freetype2-includes="../../freetype/freetype-2.6.1/include"
  cd ..
  qmake xpdf.pro -spec linux-g++
  make
  cd ..

  cd "$srcdir/OpenBoard"
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir/OpenBoard"

  mkdir -p $pkgdir/opt/openboard

  for i in customizations etc i18n library; do
    cp -rp $srcdir/OpenBoard/resources/$i $pkgdir/opt/openboard;
  done

  cp -rp $srcdir/OpenBoard/resources/images/OpenBoard.png $pkgdir/opt/openboard/
  cp -rp build/linux/release/product/OpenBoard $pkgdir/opt/openboard/

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/openboard.desktop $pkgdir/usr/share/applications

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/openboard/OpenBoard $pkgdir/usr/bin/openboard
}
