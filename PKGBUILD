# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2
pkgver=5.30
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems"
url="http://www.yamagi.org/quake2/"
arch=('i686' 'x86_64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2' 'libvorbis')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend')
makedepends=('openal' 'mesa')
install=$pkgname.install
changelog=$pkgname.ChangeLog
source=("http://deponie.yamagi.org/quake2/quake2-$pkgver.tar.xz"
        "$pkgname.desktop")
sha256sums=('ecbcbb2827a45e323ab8954eac2b9dce50942a901d5ffca8b26dc5387b241596'
            '7049a1798e38a263fb2660b94fb70f5154fad1f807259d41649e12cea1a6757c')

prepare() {
  # skip rpath, not needed
  sed '/rpath/d' -i quake2-$pkgver/Makefile
}

build() {
  cd quake2-$pkgver

  make WITH_SYSTEMWIDE=yes WITH_SYSTEMDIR=/usr/share/$pkgname
}

package() {
  cd quake2-$pkgver

  # client + server binaries
  install -Dm755 release/quake2 "$pkgdir"/usr/bin/$pkgname
  install -m755 release/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game library
  install -Dm644 release/baseq2/game.so "$pkgdir"/usr/share/$pkgname/baseq2/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -m644 stuff/yq2.cfg "$pkgdir"/usr/share/doc/$pkgname

  # desktop entry
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
