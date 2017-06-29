# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-git
pkgver=7.01.r1.g815bc34
pkgrel=1
pkgdesc="Enhanced Quake II engine optimized for modern systems (development version)"
url="http://www.yamagi.org/quake2/"
arch=('i686' 'x86_64')
license=('custom: Info-ZIP' 'GPL2')
depends=('sdl2' 'libvorbis')
optdepends=('quake2-demo: shareware data files'
            'openal: alternative audio backend')
makedepends=('openal' 'mesa' 'cmake')
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

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname%-*} -DCMAKE_BUILD_TYPE=Release -DSYSTEMWIDE_SUPPORT=ON
  make
}

package() {
  cd build

  # client + server binaries
  install -Dm755 release/quake2 "$pkgdir"/usr/lib/${pkgname%-*}/quake2
  install -m755 release/q2ded "$pkgdir"/usr/lib/${pkgname%-*}

  # symlinks to make the commands available
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/${pkgname%-*}/quake2 "$pkgdir"/usr/bin/${pkgname%-*}
  ln -s /usr/lib/${pkgname%-*}/q2ded "$pkgdir"/usr/bin/yamagi-q2ded

  # game libraries
  install -m644 release/*.so "$pkgdir"/usr/lib/${pkgname%-*}
  install -Dm644 release/baseq2/game.so "$pkgdir"/usr/lib/${pkgname%-*}/baseq2/game.so

  cd ../${pkgname%-*}

  # doc
  install -Dm644 README.md "$pkgdir"/usr/share/doc/${pkgname%-*}/README.md
  install -m644 stuff/yq2.cfg "$pkgdir"/usr/share/doc/${pkgname%-*}

  # desktop entry
  install -Dm644 ../${pkgname%-*}.desktop "$pkgdir"/usr/share/applications/${pkgname%-*}.desktop
  install -Dm644 stuff/icon/Quake2.png "$pkgdir"/usr/share/pixmaps/${pkgname%-*}.png

  # licenses
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
