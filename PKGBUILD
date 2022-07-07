# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin

pkgname=yamagi-quake2
pkgver=8.10
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems"
url="https://www.yamagi.org/quake2/"
arch=('i686' 'x86_64' 'aarch64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend'
            'curl: http download support')
makedepends=('openal' 'mesa' 'curl')
install=$pkgname.install
source=("https://deponie.yamagi.org/quake2/quake2-$pkgver.tar.xz"
        "$pkgname.desktop")
sha256sums=('93d625f67bd365d943113f6aa7c65f6fd2bd4c46c4ab77eedc4642735c143ea1'
            '7049a1798e38a263fb2660b94fb70f5154fad1f807259d41649e12cea1a6757c')

build() {
  make -C quake2-$pkgver WITH_RPATH=no WITH_SYSTEMWIDE=yes
}

package() {
  cd quake2-$pkgver

  # client + server binaries, renderer libraries
  install -Dm755 -t "$pkgdir"/usr/lib/$pkgname release/{quake2,q2ded,*.so}

  # symlinks to make the commands available
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkgname/quake2 "$pkgdir"/usr/bin/$pkgname
  ln -s /usr/lib/$pkgname/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/$pkgname/baseq2 release/baseq2/game.so

  # shared game directory
  install -d "$pkgdir"/usr/share/games/quake2
  echo "You can put Quake 2 game files here." > "$pkgdir"/usr/share/games/quake2/README

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname stuff/yq2.cfg doc/*.md

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkgname.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
