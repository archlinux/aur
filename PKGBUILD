# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=smc
pkgver=1.9
pkgrel=23
pkgdesc="Secret Maryo Chronicles"
arch=('i686' 'x86_64')
url="http://www.secretmaryo.org/"
license=('GPL3')
depends=('sdl_image' 'sdl_ttf' 'sdl_mixer' 'cegui-0.7' 'boost-libs')
makedepends=('boost')
source=("http://downloads.sourceforge.net/smclone/smc-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/smclone/SMC_Music_5.0_high.zip"
        "smc-cegui-0.7.diff"
        "smc-boost_filesystem3.diff"
        "smc.png"
        "smc.desktop")
md5sums=('75ab7826303c49aec25b052a8b90287f'
         '0bccac29052d3eed93e88535312eaaa2'
         '51dfea21b741ad19df14e738df52f1cf'
         '309a5a6d4b3c0b3dc5e1b7f4de84086f'
         'efca7580e28748625eb676c9d24ee122'
         'SKIP')

prepare() {
  cd $pkgname-$pkgver

  # to remove when smc will be compatible with cegui-0.7.x or better 0.8.x
  patch -Np1 < ../smc-cegui-0.7.diff

  # fix for boost >= 1.50
  patch -Np1 < ../smc-boost_filesystem3.diff
}

build() {
  cd $pkgname-$pkgver

  # fix compilation
  export CXXFLAGS="${CXXFLAGS} -fpermissive"
  ./autogen.sh
  LIBS+="-lX11 -lboost_system" ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  # install HQ music
  cp -R ../data/music "$pkgdir"/usr/share/smc/

  # install desktop file
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

}
