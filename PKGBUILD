# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-git
pkgver=8.00.r18.g8358e386
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems (development version)"
url="https://www.yamagi.org/quake2/"
arch=('i686' 'x86_64' 'aarch64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend'
            'curl: http download support')
makedepends=('openal' 'mesa' 'curl')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=(${pkgname%-*}::"git+https://github.com/yquake2/yquake2.git"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '7049a1798e38a263fb2660b94fb70f5154fad1f807259d41649e12cea1a6757c')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^QUAKE2_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C ${pkgname%-*} WITH_RPATH=no WITH_SYSTEMWIDE=yes
}

package() {
  local pkg=${pkgname%-*}

  cd $pkg

  # client + server binaries, renderer libraries
  install -Dm755 -t "$pkgdir"/usr/lib/$pkg release/{quake2,q2ded,*.so}

  # symlinks to make the commands available
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkg/quake2 "$pkgdir"/usr/bin/$pkg
  ln -s /usr/lib/$pkg/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/$pkg/baseq2 release/baseq2/game.so

  # shared game directory
  install -d "$pkgdir"/usr/share/games/quake2
  echo "You can put Quake 2 game files here." > "$pkgdir"/usr/share/games/quake2/README

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkg stuff/yq2.cfg doc/*.md

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkg.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/$pkg.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
