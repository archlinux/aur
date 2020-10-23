# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
provides=("gitstatus")
conflicts=("gitstatus")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('364b3f5a480c86341b5b5148750613f4de90bafda926a66ca0cfc7ee2bdcf21b590ea4b52b3432f6b11707395cbc44d497537b2eebe9ee1fec25d012ea77bafa')
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
