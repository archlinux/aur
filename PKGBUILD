# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
# Whenever pkgver is updated, _libgit2ver below must also be updated.
pkgver=1.2.2
pkgrel=1
pkgdesc='Git status for Bash and Zsh prompt'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
# _libgit2ver depends on pkgver. They must be updated together. See libgit2_version in:
# https://raw.githubusercontent.com/romkatv/gitstatus/v${pkgver}/build.info
_libgit2ver="tag-d6c37a38587c9af2a9e63449fc8bf951dca0e854"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz"
  "libgit2-${_libgit2ver}.tar.gz::https://github.com/romkatv/libgit2/archive/${_libgit2ver}.tar.gz")
sha512sums=(
  '2f88d7fec27292bd2bdd07856cb39262fad31f5fa85572b944bab28db960f478ab86ea7944e96bbf68e31a385b1804b5282c03665ee7335389e313756c2bc4ca'
  '11fd09ce20191392947d171e9212a33a998c1f2c4bcb8ab7440a0dc88653ff1324a1529984a607d545ab8863738f4eb946134c46f44bd1c200c6d98c02657292')
makedepends=('git' 'cmake' 'zsh')
install='gitstatus.install'

build() {
  # Upstream packaging instructions:
  # https://github.com/romkatv/gitstatus/blob/master/README.md#compiling-for-distribution
  #
  # Put libgit2-${_libgit2ver}.tar.gz where build expects it.
  ln -sf "$srcdir/libgit2-${_libgit2ver}.tar.gz" "$srcdir/gitstatus-${pkgver}/deps/"
  cd "$srcdir/gitstatus-${pkgver}"
  ./build
  rm "./deps/libgit2-${_libgit2ver}.tar.gz"
  for file in *.zsh install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}

package() {
  cd "$srcdir/gitstatus-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/gitstatus/{}" ';'
}
