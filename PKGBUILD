# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
provides=("gitstatus")
conflicts=("gitstatus")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('2f88d7fec27292bd2bdd07856cb39262fad31f5fa85572b944bab28db960f478ab86ea7944e96bbf68e31a385b1804b5282c03665ee7335389e313756c2bc4ca')
makedepends=('zsh')
install='gitstatus.install'

build() {
  cd "$srcdir/gitstatus-${pkgver}"
  zsh -fc '
    emulate zsh -o no_aliases
    unset -m "GITSTATUS_*"
    GITSTATUS_CACHE_DIR="$PWD"/usrbin ./install -f'
  for file in *.zsh install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}

package() {
  cd "$srcdir/gitstatus-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/gitstatus/{}" ';'
}
