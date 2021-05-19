# Maintainer: Henry Bubert <cryptix@riseup.net>
_reponame=go-ssb-room
pkgname=${_reponame}-git
pkgver=r531.d8da4ae
pkgrel=1
pkgdesc='The Secure-Scuttlebutt Room v2 server, written in Go'
arch=('x86_64')
_goimport='github.com/ssb-ngi-pointer/go-ssb-room'
url="https://$_goimport"
license=('MIT')
makedepends=('go' 'gcc')
source=("$_reponame::git+https://${_goimport}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame/cmd/server"
  meta="-X main.version=v$pkgver -X main.commit=release -X main.date=$(date +%F)"
  go build -v \
    -o go-ssb-room \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS $meta"
}

package() {
  install -Dm755 $srcdir/$_reponame/cmd/server/go-ssb-room -t "$pkgdir"/usr/bin/
  #install -Dm644 $srcdir/$_reponame/LICENSE "$pkgdir/usr/share/licenses/$_reponame/LICENSE"
}

