# Maintainer: Denis Yantarev <denis.yantarev@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
pkgname=homeshick-git
pkgver=1.0.0.r74.g680252e
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
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # patch the location of the library scripts
  sed -i 's|\$homeshick/lib|\$homeshick/lib/homeshick/lib|' \
    "$srcdir"/$pkgname/bin/homeshick
  # patch the location of the homeshick installation
  sed -i 's|\$HOME/.homesick/repos/homeshick|/usr|' \
    "$srcdir"/$pkgname/bin/homeshick.csh \
    "$srcdir"/$pkgname/homeshick.sh \
    "$srcdir"/$pkgname/homeshick.fish \
    "$srcdir"/$pkgname/bin/homeshick
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
	# copy bash-completion files
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
	install -m644 "$srcdir"/$pkgname/completions/_homeshick "$pkgdir"/usr/share/bash-completion/completions/_homeshick
	install -m644 "$srcdir"/$pkgname/completions/homeshick-completion.bash "$pkgdir"/usr/share/bash-completion/completions/homeshick
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$pkgname/LICENSE*
}

