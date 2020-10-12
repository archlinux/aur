# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=openboard-develop-git
pkgver=1.6.0
_a=3
_src_folder="OpenBoard-${pkgver}a${_a}"
pkgrel=1
((pkgrel+=_a))
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
install=openboard.install
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'qt5-tools' 'qt5-xmlpatterns' 'libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip)  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
source=("https://github.com/OpenBoard-org/OpenBoard/archive/v${pkgver}a${_a}.tar.gz"
        openboard.desktop)
source+=(qchar.patch)
source+=(quazip.patch)
source+=(drop_ThirdParty_repo.patch)
md5sums=('01e94648e788a9ff4d35b334b8f333bb'
         '21d1749400802f8fc0669feaf77de683'
         'bf2c524f3897cfcfb4315bcd92d4206e'
         '0ffa4b3c8cefce374df5a1580d90a332'
         '879116c683374b2dde291014e44a29fe')

prepare() {
  cd "$srcdir"/$_src_folder
  patch -p1 < "$srcdir"/drop_ThirdParty_repo.patch
  patch -p1 < "$srcdir"/qchar.patch
  patch -p1 < "$srcdir"/quazip.patch
}

build() {
  cd "$srcdir"/$_src_folder
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir"/$_src_folder

  mkdir -p $pkgdir/opt/openboard

  for i in customizations etc i18n library; do
    cp -rp $srcdir/OpenBoard-$pkgver/resources/$i $pkgdir/opt/openboard;
  done

  cp -rp $srcdir/OpenBoard-$pkgver/resources/images/OpenBoard.png $pkgdir/opt/openboard/
  cp -rp build/linux/release/product/OpenBoard $pkgdir/opt/openboard/

  install -D -m 644 $srcdir/openboard.desktop $pkgdir/usr/share/applications/openboard.desktop
  install -d -m 755 $pkgdir/usr/bin
  ln -s /opt/openboard/OpenBoard $pkgdir/usr/bin/openboard
}
