# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>
# Contributor: Tom Boshoven <tomboshoven at gmail dot com>

pkgname=opensonic
pkgver=0.1.4
pkgrel=6
pkgdesc="Game based on the Sonic the Hedgehog universe."
arch=('i686' 'x86_64')
url="http://opensnc.sourceforge.net/"
license=('GPL')
depends=('allegro4' 'libpng')
makedepends=('cmake')
install=opensonic.install
source=("http://downloads.sourceforge.net/project/opensnc/Open%20Sonic/$pkgver/opensnc-src-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh"
        "http://arch.carsten-teibes.de/aur-stuff/$pkgname-loadpng.tar.xz")
sha256sums=('3a4c3fa9538ee27c04b5ea848c9ad0a83f335471936d4617a18d3648c42588e9'
            '8649e72ba9eb3e01da81671c9c849a6823ccd4f022819e8b57d24abdaa691b06'
            'a7ed81118fea52c8ce60a8538e92b6121da3b3358c41d1e6d370ada83cef8740'
            '9681cf2519b5217149dababbc67ae0280d454a59b3b46ec36c0c9e843a554e36')

build() {
  cd loadpng
  cmake .
  make

  cd ../opensnc-src-$pkgver
  # add folder of loadpng.a (extracted from configure script)
  export _ALLEGRO_LIBS="-L$srcdir/loadpng $(allegro-config --libs)"
  export _ALLEGRO_VERSION="$(allegro-config --version)"
  # fix broken linking
  export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
  cmake .
  make
}

package() {
  cd opensnc-src-$pkgver

  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
