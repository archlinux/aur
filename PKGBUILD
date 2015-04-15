# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-git
pkgver=5.30.r2.g0b9ac6c
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems (development version)"
url="http://www.yamagi.org/quake2/"
arch=('i686' 'x86_64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2' 'libvorbis')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend')
makedepends=('openal' 'mesa' 'chrpath')
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
  make -C ${pkgname%-*} WITH_SYSTEMWIDE=yes WITH_SYSTEMDIR=/usr/share/${pkgname%-*}
}

package() {
  cd ${pkgname%-*}

  # client + server binaries
  install -Dm755 release/quake2 "$pkgdir"/usr/bin/${pkgname%-*}
  install -m755 release/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # remove rpath, not needed
  chrpath -d "$pkgdir"/usr/bin/${pkgname%-*}

  # game library
  install -Dm644 release/baseq2/game.so "$pkgdir"/usr/share/${pkgname%-*}/baseq2/game.so

  # doc
  install -Dm644 README "$pkgdir"/usr/share/doc/${pkgname%-*}/README
  install -m644 stuff/yq2.cfg "$pkgdir"/usr/share/doc/${pkgname%-*}

  # desktop entry
  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir"/usr/share/applications/${pkgname%-*}.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
