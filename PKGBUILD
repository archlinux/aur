# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

pkgname=gitstatus-git
pkgver=r1282.0e70dbc
pkgrel=1
pkgdesc='10x faster implementation of `git status` command'
arch=('x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake' 'file' 'make' 'gawk' 'gcc' 'zsh' 'wget')
install=gitstatus.install
provides=("gitstatus")
source=('gitstatus::git+https://github.com/romkatv/gitstatus')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gitstatus"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
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
