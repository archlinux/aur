# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
provides=("gitstatus")
conflicts=("gitstatus")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('3e21151e27af6a4124f3e0d7805e68e4e6908f03d485a643280e865241a4177ed284477790040aaa6951b196d1bf236a326d6762554d93f8b733d07c913a83de')
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
