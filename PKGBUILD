# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Forked from community/go-tools. Original maintainers:
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=gopls-git
pkgver=r3439.e377ae9d6
pkgrel=1
pkgdesc='An LSP server for Go'
arch=(x86_64)
url='https://golang.org/'
license=(BSD)
depends=(glibc)
makedepends=(git go-pie)
provides=("gopls=$pkgver")
source=(go-tools::git+https://go.googlesource.com/tools
        go-sync::git+https://go.googlesource.com/sync
        golang-net::git+https://github.com/golang/net)
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd go-tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p gopath/src/golang.org/x
  cp -rf go-tools gopath/src/golang.org/x/tools
  cp -rf go-sync gopath/src/golang.org/x/sync
  cp -rf golang-net gopath/src/golang.org/x/net
}

build() {
  export GOPATH="$srcdir/gopath"
  cd gopath/src/golang.org/x/tools
  go install -v -a \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags \"$LDFLAGS\"" \
    ./cmd/gopls
}

package() {
  install -Dm755 gopath/bin/gopls -t "$pkgdir"/usr/bin
  install -Dm644 go-tools/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
