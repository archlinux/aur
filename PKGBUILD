# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=nethack4
pkgver=4.3.0.beta1
_pkgver=4.3.0-beta1
pkgrel=1
pkgdesc="A modern fork of Nethack"
arch=('i686' 'x86_64')
url="http://nethack4.org/"
license=('custom')
depends=('jansson' 'gcc-libs')
makedepends=('sdl2' 'libpng' 'chrpath')
optdepends=('sdl2: tiles'
            'libpng: tiles')
#source=('git+https://gitorious.org/nitrohack/ais523.git#branch=nicehack')
source=("http://nethack4.org/media/releases/nethack4-$_pkgver-source.tar.gz")
md5sums=('4b382dfca5553fce173291cc9840c2e5')

# postgresql-libs: multiuser server

build() {
  cd "$srcdir"
  # allow aimake to run as "root"  (fakeroot confuses it)
  sed -i "s/\$^O ne 'MSWin32'/0/" aimake
  mkdir -p build
  mkdir -p opt
  cd build
  ../aimake --without=jansson --without=gui --without=server -i ../opt/
  mv ../opt/nethack4 ../opt/nethack4-con
  ../aimake --without=jansson --with=gui --without=server -i ../opt/
}

package() {
  cd "$srcdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # manually install
  cd opt

  chrpath -r "/usr/lib" nethack4-con nethack4-sdl
  install -Dm755 nethack4-con "$pkgdir/usr/bin/nethack4"
  install -Dm755 nethack4-sdl "$pkgdir/usr/bin/nethack4-sdl"

  chrpath -r "/usr/lib" lib/libnethack.so lib/libnethack_client.so
  install -Dm755 lib/libnethack.so  "$pkgdir/usr/lib/libnethack.so"
  install -Dm755 lib/libnethack_client.so  "$pkgdir/usr/lib/libnethack_client.so"
  install -Dm755 lib/libuncursed_sdl.so "$pkgdir/usr/lib/libuncursed_sdl.so"
  install -Dm755 lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so"
  # make ldconfig happy
  ln -s /usr/lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so.1"
  ln -s /usr/lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so.1.0.2"

  install -d "$pkgdir/usr/share/man/man6/"
  install -m644 man/man6/* "$pkgdir/usr/share/man/man6/"

  install -dm775 -o root -g games "$pkgdir/var/games/nethack4/"
  install -m664 -o root -g games save/* "$pkgdir/var/games/nethack4/"

  install -d "$pkgdir/usr/share/nethack4/"
  install -m644 data/* "$pkgdir/usr/share/nethack4/"
 
}

