# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=gitstatus
pkgver=1.1.2
pkgrel=1
pkgdesc='10x faster implementation of `git status` command'
arch=('any')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/gitstatus/archive/v${pkgver}.tar.gz")
sha512sums=('d046090b6d2e8c56b58e907cbb9dad86609cfaefdea526813978c1c7846178c61cd91fa60b8ca036c4c5b6f55caaa17974c1a23f5055e2b4064ed072a3ba4f7d')
makedepends=('git' 'cmake' 'file' 'make' 'gawk' 'gcc' 'zsh' 'wget')
install='gitstatus.install'

build() {
  rm -rf "$srcdir/gitstatus"
  mv "$srcdir/gitstatus-${pkgver}" "$srcdir/gitstatus"
  cd "$srcdir/gitstatus"
  ./build -w
  rm ./deps/libgit2-*.tar.gz
  for file in *.zsh install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}

package() {
  cd "$srcdir"
  find gitstatus -path gitstatus/.git -prune \
    -o '(' -type f -exec install -D '{}' "$pkgdir/usr/share/{}" ';' ')'
}
