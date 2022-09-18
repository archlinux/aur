pkgname=go-outline-git
pkgver=20161011.9_e785568
pkgrel=2
pkgdesc="Utility to extract JSON representation of declarations from a Go source file"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/lukehoban/go-outline"
makedepends=(
  'go'
  'git'
)

source=(
  "git+https://github.com/lukehoban/go-outline.git"
)

md5sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/go-outline"
  local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  local count=$(git rev-list --count HEAD)
  local commit=$(git rev-parse --short HEAD)
  echo "$date.${count}_$commit"
}

prepare() {
  cd "${pkgname%-git}"
  go mod init "${url#https://}"
  go mod tidy
}

build() {
  GOPATH=$srcdir
  GOBIN=$srcdir/bin/
  mkdir -p $srcdir/src
  ln -sf $srcdir/go-outline $srcdir/src
  cd $srcdir/src/go-outline
  go get -v
}

package() {
  find "$srcdir/bin/" -type f -executable | while read filename; do
    install -DT "$filename" "$pkgdir/usr/bin/$(basename $filename)"
  done
}
