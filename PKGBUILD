# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
provides=("gitstatus")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('d046090b6d2e8c56b58e907cbb9dad86609cfaefdea526813978c1c7846178c61cd91fa60b8ca036c4c5b6f55caaa17974c1a23f5055e2b4064ed072a3ba4f7d')
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
