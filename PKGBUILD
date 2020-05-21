# Maintainer: Aloxaf <aloxafx@gmail.com>
pkgname=gitstatus-git
pkgver=r1281.0127fd2
pkgrel=1
pkgdesc='10x faster implementation of `git status` command'
arch=('x86_64')
url="https://github.com/romkatv/gitstatus"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'cmake' 'make' 'gcc' 'zsh' 'wget')
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
  cd "$srcdir/gitstatus"
  for file in docs/* src/* usrbin/* *; do
    [[ -d "$file" ]] && continue
    install -D "$file" "$pkgdir/usr/share/gitstatus/$file"
  done
}
