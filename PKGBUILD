# Maintainer: Andrius Lukosevicius <niobium93@gmail.com>

pkgname=yamagi-quake2-zaero-git
pkgver=r90.d52ee31
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Zaero for yamagi-quake2 (development version)"
url="https://www.yamagi.org/quake2/"
license=('GPL' 'custom')
depends=('sh' 'yamagi-quake2')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=(${pkgname%-*}::"git+https://github.com/yquake2/zaero.git"
        "${pkgname%-*}.sh"
        "${pkgname%-*}.desktop")
sha256sums=('SKIP'
            '4daeced3a4e5c3e59df0a8936fd681a26830ab140bfc86da0bc53e135ccb56ea'
            'ad64cef29d28cd37bea07af6d396ed94a45056438664951910ea44f7e5f83ec9')

pkgver() {
  cd ${pkgname%-*}
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  make -C ${pkgname%-*}
}

package() {
  local pkg=${pkgname%-*}

  cd $pkg

  # game library
  install -Dm644 -t "$pkgdir"/usr/lib/yamagi-quake2/zaero release/game.so

  # game launcher
  install -Dm755 ../$pkg.sh "$pkgdir"/usr/bin/$pkg

  # doc
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkg README

  # desktop entry
  install -Dm644 -t "$pkgdir"/usr/share/applications ../$pkg.desktop

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
