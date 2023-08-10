# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>

pkgname=('soldat-git')
_installdir='/usr/share/soldat'
pkgver=122.g967097b
pkgrel=2
pkgdesc="Unique 2D (side-view) multiplayer action game."
arch=('x86_64')
url='https://soldat.pl/en/'
license=('cc-by-4.0' 'BSD')
depends=('sdl2' 'openal' 'freetype2' 'physfs')
makedepends=('make' 'fpc' 'zip' 'cmake' 'gamenetworkingsockets')
provides=('soldat')
source=("$pkgname::git+https://github.com/Soldat/soldat.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/continuous-//g' | sed 's/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "$srcdir/soldat-base/client/readme.txt" "$pkgdir/usr/share/licenses/$pkgname/ASSET_LICENSE"
  install -Dm 655 "server/build/soldatserver_x64" -t "$pkgdir/$_installdir";
  install -Dm 655 "client/build/soldat_x64" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/build/libstb.so" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/media/soldat.ico" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/soldat.smod" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/client/play-regular.ttf" -t "$pkgdir/$_installdir";
  install -Dm 655 "soldat" -t "$pkgdir/usr/bin";
  install -Dm 655 "soldatserver" -t "$pkgdir/usr/bin";
  install -Dm 644 "soldat.desktop" -t "$pkgdir/usr/share/applications";
}
