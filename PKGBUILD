# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>

pkgname=gx
pkgver=0.14.1
pkgrel=4

pkgdesc="Packaging tool built around the distributed, content addressed filesystem IPFS"
url="https://github.com/whyrusleeping/gx"
arch=('x86_64')
license=('MIT')

makedepends=('git' 'go-pie')
optdepends=('gx-go: gx packaing module for go')

source=("git+https://github.com/whyrusleeping/gx.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  mkdir -p "$srcdir"/src/github.com/whyrusleeping/
  ln -fs "$srcdir/gx" "$srcdir"/src/github.com/whyrusleeping/gx
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  cd "$srcdir"/src/github.com/whyrusleeping/gx

  go get -v
  go install \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" \
    -v
}

package() {
  install -Dm 755 bin/gx "$pkgdir/usr/bin/gx"
  install -Dm 644 gx/LICENSE "$pkgdir/usr/share/licenses/gx/LICENSE"
}
