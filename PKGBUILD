# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Fabian Melters <melters [at] gmail [dot] com>

pkgname=ultimatestunts
pkgver=0.7.7.1
pkgrel=3
pkgdesc="A remake of the famous DOS racing game 'Stunts'/'4D Sports Driving'."
arch=('i686' 'x86_64')
url="http://www.ultimatestunts.nl"
license=('GPL')
depends=('sdl_image' 'freealut' 'libvorbis' 'libgl')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-srcdata-${pkgver//./}.tar.gz"
        "$pkgname-metaserver-cpp-add-includes.patch"
        "$pkgname.png"
        "$pkgname.desktop")
sha256sums=('fcc06e4a2ff2c5c1bd937670acdb079140f3ce0efdf00578eb6559a20ebb26d3'
            '29cb962fba6956f87a33744f9a8c593298727738d7b09b7407c8415867a816e5'
            '4ed29f72565e802e7b293e7a7a31cb2ca5fb89380ca2bb29a6f02d0527a86cd1'
            '9787c726c9073564c47b3ef030269fecef778d0f272095b27934f5893f075f87')

prepare() {
  patch -d $pkgname-srcdata-${pkgver//./} -Np0 < $pkgname-metaserver-cpp-add-includes.patch
}

build() {
  cd $pkgname-srcdata-${pkgver//./}

  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd $pkgname-srcdata-${pkgver//./}

  make sysconfdir="$pkgdir/etc" prefix="$pkgdir/usr" install

  # .desktop entry
  install -Dm644 ../$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # cleanup
  find "$pkgdir/" -type d -name .svn -print0 | xargs -0 rm -rf
}
