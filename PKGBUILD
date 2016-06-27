# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

_pkgname=splitsh-lite
pkgname=$_pkgname-git
pkgver=r15.ec01ec9
pkgrel=2
pkgdesc="Split your monorepo into many repos"
arch=('x86_64' 'i686')
url="https://github.com/splitsh/lite"
license=('MIT')
makedepends=('go' 'git' 'libgit2')
depends=('libgit2')
options=('!strip' '!emptydirs')
source=("splitsh-lite::git+https://github.com/splitsh/lite.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -d "$srcdir/gopath/src/github.com/splitsh" ]] && \
    rm -rf "$srcdir/gopath/src/github.com/splitsh"
  mkdir -p "$srcdir/gopath/src/github.com/splitsh"
  mv "$srcdir/$_pkgname" "$srcdir/gopath/src/github.com/splitsh/lite"

  GOPATH="$(pwd)/gopath" go get -x -v "github.com/boltdb/bolt"
  GOPATH="$(pwd)/gopath" go get -x -v "github.com/libgit2/git2go"
  GOPATH="$(pwd)/gopath" go build -o "$srcdir/build/$_pkgname" "github.com/splitsh/lite"
}

package() {
  install -Dm755 "$srcdir/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/gopath/src/github.com/splitsh/lite/LICENSE" \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
