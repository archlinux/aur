# Contributor: Leonidas <marek@xivilization.net>
pkgname=homeshick-git
pkgver=r374.8f752a5
pkgrel=1
pkgdesc="bash stand-in for homesick by technicalpickles"
arch=(any)
url="https://github.com/andsens/homeshick"
license=('BSD')
depends=('git')
source=("$pkgname"::'git+https://github.com/andsens/homeshick.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  #printf "r%d.%s\n" $(git rev-list HEAD --count) $(git rev-parse --short HEAD)
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )}

build() {
  # patch the location of the library scripts
  sed -i 's|homeshick="\$repos/homeshick"|homeshick=/usr/lib/homeshick|' "$srcdir"/$pkgname/bin/homeshick
  sed -i 's|\$HOME/.homesick/repos/homeshick/bin/homeshick|/usr/bin/homeshick|' "$srcdir"/$pkgname/bin/homeshick.csh
  sed -i 's|\$HOME/.homesick/repos/homeshick/bin/homeshick|/usr/bin/homeshick|' "$srcdir"/$pkgname/homeshick.sh
  sed -i 's|\$HOME/.homesick/repos/homeshick/bin/homeshick|/usr/bin/homeshick|' "$srcdir"/$pkgname/homeshick.fish
}

package() {
  # copy the 'binary' *ahem* script
  install -D "$srcdir"/$pkgname/bin/homeshick "$pkgdir"/usr/bin/homeshick
  install -D "$srcdir"/$pkgname/bin/homeshick.csh "$pkgdir"/usr/bin/homeshick.csh
  # copy the utils scripts
  mkdir -p "$pkgdir"/usr/lib/homeshick/lib/
  install -D "$srcdir"/$pkgname/homeshick.sh "$pkgdir"/usr/lib/homeshick/homeshick.sh
  install -D "$srcdir"/$pkgname/homeshick.fish "$pkgdir"/usr/lib/homeshick/homeshick.fish
  cp -r "$srcdir"/$pkgname/lib "$pkgdir"/usr/lib/homeshick/
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$pkgname/LICENSE*
}
