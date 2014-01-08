# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=gngeo
pkgver=0.8
pkgrel=8
pkgdesc="A portable command-line NeoGeo Emulator"
url="http://gngeo.googlecode.com"
license=('custom GPL')
arch=('i686' 'x86_64')
install=$pkgname.install
depends=('zlib' 'sdl' 'libgl')
makedepends=('nasm' 'glu')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-zlib' 'lib32-sdl' 'lib32-libgl')
  makedepends=('nasm' 'gcc-multilib' 'lib32-glu')
fi
source=("$url/files/$pkgname-$pkgver.tar.gz" "4dec1ccfb85d.patch")
sha256sums=('4955a36a978accbc13cc9d58be3dbbed8864f27c34446b2fea879ee27fd7c4b6'
            '8666f2cf6d2a21ddf4d44e5106f9ae60a73820789a6ad3fec09befadb7105901')

build() {
  cd $pkgname-$pkgver

  # fixes unknown reference error
  patch -Np2 < ../4dec1ccfb85d.patch

  # change path
  sed 's|games/lib|share|' -i sample_gngeorc

  if [ "$CARCH" == "i686" ]; then
    ./configure --prefix=/usr --mandir=/usr/share/man
  elif [ "$CARCH" == "x86_64" ]; then
    # fix path for lib32
    sed 's|/usr/lib/libGL.so|/usr/lib32/libGL.so|' -i sample_gngeorc
    # force 32 bit build
    ./configure --prefix=/usr --mandir=/usr/share/man \
        CC='gcc -m32' SDL_CONFIG='/usr/bin/sdl-config-32'
  fi
  # force single threaded build
  make -j1
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 sample_gngeorc "$pkgdir"/usr/share/$pkgname/sample_gngeorc
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
