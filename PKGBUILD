# Maintainer: Denis Yantarev <denis.yantarev@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: mrhanky <mrhanky@unterschicht.tv>
pkgname=homeshick-git
pkgver=2.0.0.r0.eea2fc5
pkgrel=1
pkgdesc="bash stand-in for homesick by technicalpickles"
arch=(any)
url="https://github.com/andsens/homeshick"
license=('BSD')
makedepends=('git')
depends=('bash')
source=("$pkgname"::'git+https://github.com/andsens/homeshick.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags  | sed 's/^v//; s/\([^-]*-\)g/r\1/; s/-/./g'
}

build() {
  # patch the location of the library scripts
  sed -i 's|\$homeshick/lib|\$homeshick/lib/homeshick/lib|' \
    "$srcdir"/$pkgname/bin/homeshick
  # patch the location of the homeshick installation
  sed -i 's|\$HOME/.homesick/repos/homeshick|/usr|' \
    "$srcdir"/$pkgname/homeshick.csh \
    "$srcdir"/$pkgname/homeshick.sh \
    "$srcdir"/$pkgname/homeshick.fish \
    "$srcdir"/$pkgname/bin/homeshick
}

package() {
  # copy the 'binary' *ahem* script
  install -D "$srcdir"/$pkgname/bin/homeshick "$pkgdir"/usr/bin/homeshick
  # copy the utils scripts
  mkdir -p "$pkgdir"/usr/lib/homeshick/lib/
  install -D "$srcdir"/$pkgname/homeshick.csh "$pkgdir"/usr/lib/homeshick/homeshick.csh
  install -D "$srcdir"/$pkgname/homeshick.sh "$pkgdir"/usr/lib/homeshick/homeshick.sh
  install -D "$srcdir"/$pkgname/homeshick.fish "$pkgdir"/usr/lib/homeshick/homeshick.fish
  cp -r "$srcdir"/$pkgname/lib "$pkgdir"/usr/lib/homeshick/
  # copy bash-completion files
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m644 "$srcdir"/$pkgname/completions/homeshick-completion.bash "$pkgdir"/usr/share/bash-completion/completions/homeshick
  # copy fish-completion files
  mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d
  install -m644 "$srcdir"/$pkgname/completions/homeshick.fish "$pkgdir"/usr/share/fish/vendor_completions.d/homeshick.fish
  # copy zsh-completion files
  mkdir -p "$pkgdir"/usr/share/zsh/site-functions
  install -m644 "$srcdir"/$pkgname/completions/_homeshick "$pkgdir"/usr/share/zsh/site-functions/_homeshick
  # copy the licenses
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m=644 -t "$pkgdir"/usr/share/licenses/$pkgname/ "$srcdir"/$pkgname/LICENSE*
}

