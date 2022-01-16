pkgname=asciitosvg-git
pkgver=r49.ca82a5c
pkgrel=1
pkgdesc="Create beautiful SVG diagrams from ASCII art"
arch=("any")
url="https://github.com/asciitosvg/asciitosvg/"
license=("MIT")

makedepends=(
  'git'
  'go-pie'
)

source=(
  "git+https://github.com/asciitosvg/asciitosvg"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd asciitosvg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd asciitosvg
  go mod init 'github.com/asciitosvg/asciitosvg'
  go mod tidy
}

build() {
  mkdir -p gopath/src/github.com/asciitosvg
  ln -rTsf asciitosvg gopath/src/github.com/asciitosvg/asciitosvg
  export GOPATH="$srcdir/gopath"
  cd "$GOPATH/src/github.com/asciitosvg/asciitosvg"
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 "gopath/bin/a2s" "$pkgdir/usr/bin/a2s"
}
