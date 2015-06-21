# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=moon-lander
pkgver=1.0
pkgrel=7
pkgdesc="An addictive game of skill where you must land a space-ship on the moon at a perfect speed."
arch=('i686' 'x86_64')
url="http://none"
license=('BSD')
depends=('sdl' 'sdl_mixer>=1.2.10' 'sdl_image' 'libvorbis')
source=(http://ftp.debian.org/debian/pool/main/m/moon-lander/${pkgname}_$pkgver.orig.tar.gz
	moon-lander-background.patch
	moon-lander.desktop
        LICENSE)
md5sums=('5726de9d85b9e8b60c27f2ea6428bc96'
         'd6b948632202ddcda78da4bb1fcd021a'
         '8bba1446183337ab24b427cb92a118f8'
         '883198142cca0450dfaab47ec26ac8c2')

build() {
  cd $srcdir/$pkgname
  sed -i "/DATAPATH/{s#\"\"#\"/usr/share/moon-lander/\"#}" moon_lander.c
  sed -i 's/-lSDL_mixer/-lSDL_mixer\ -lm/' Makefile
  patch -Np1 -i ${srcdir}/moon-lander-background.patch
  make clean
  make
}

package() {
  cd $srcdir/$pkgname

  install -dm755 $pkgdir/usr/share/$pkgname/{fonts,images/{backgrounds,kablam},sounds}
  for dir in fonts images{,/backgrounds,/kablam} sounds; do
    #install -m644 $dir/* $pkgdir/usr/share/$pkgname/$dir
    cp -R $dir/* $pkgdir/usr/share/$pkgname/$dir && chmod -R 755 $pkgdir/usr/share/$pkgname/$dir
  done
  install -Dm755 moon-lander.bin $pkgdir/usr/bin/moon-lander

  install -Dm644 $srcdir/moon-lander.desktop \
    $pkgdir/usr/share/applications/moon-lander.desktop

  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
