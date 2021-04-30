# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
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
provides=('smc-data') # this is a hack to support transition from seperate
                      # data package, can be removed later
source=("http://downloads.sourceforge.net/smclone/smc-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/smclone/SMC_Music_5.0_high.zip"
        "smc.png"
        "smc-cegui-0.7.diff"
        "smc-boost_filesystem3.diff"
	"smc-boost_filesystem-patch.diff"
        "smc.desktop")
sha256sums=('b4194e70d3f1de3da884dd1a11e4f5cec25a205f66a3b85cc9fc1c86289b237d'
            'c5bb2e1830c7cbe499c93851f5a02b2b900b4730d2c7a133a44a7b43a297dab8'
            'ace860984a79fe50b63eb1853b885ca910e070a1409e86b3fb5fb7b84b198ef9'
            'a82a47525126c874ceeda28c310d5ce1fb521b8e2812dd1134b8a686551c7412'
            '42c8698af5241f09f736f0f878ea2713224834477fd625da72372bb694d34d1e'
            '41d99a7696dc5d2001957d320f2aa559dd17b519dd1e7dd88fbe51b1315740d3'
            '291fca2243262c24cf086bec60ae77fd53f58bc42e876b224d58e96a5a35d79a')

prepare() {
  cd $pkgname-$pkgver

  # to remove when smc will be compatible with cegui-0.7.x or better 0.8.x
  patch -Np1 < ../smc-cegui-0.7.diff

  # fix for boost >= 1.50
  patch -Np1 < ../smc-boost_filesystem3.diff

  # fix for 2021 boost
  patch -Np1 < ../smc-boost_filesystem-patch.diff
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
