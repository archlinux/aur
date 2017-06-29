# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2
pkgver=7.01
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems"
url="http://www.yamagi.org/quake2/"
arch=('i686' 'x86_64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2' 'libvorbis')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend')
makedepends=('openal' 'mesa' 'cmake')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/quake2-$pkgver.tar.xz"
        "$pkgname.desktop")
sha256sums=('972f77867093b3c162dfb28ca930585cb71d1b7b183d676d8659d2fc97137ef7'
            '7049a1798e38a263fb2660b94fb70f5154fad1f807259d41649e12cea1a6757c')

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake ../quake2-$pkgver -DCMAKE_BUILD_TYPE=Release -DSYSTEMWIDE_SUPPORT=ON
  make
}

package() {
  cd build

  # client + server binaries
  install -Dm755 release/quake2 "$pkgdir"/usr/lib/$pkgname/quake2
  install -m755 release/q2ded "$pkgdir"/usr/lib/$pkgname

  # symlinks to make the commands available
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkgname/quake2 "$pkgdir"/usr/bin/$pkgname
  ln -s /usr/lib/$pkgname/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game libraries
  install -m644 release/*.so "$pkgdir"/usr/lib/$pkgname
  install -Dm644 release/baseq2/game.so "$pkgdir"/usr/lib/$pkgname/baseq2/game.so

  cd ../quake2-$pkgver

  # doc
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -m644 stuff/yq2.cfg "$pkgdir"/usr/share/doc/$pkgname

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
