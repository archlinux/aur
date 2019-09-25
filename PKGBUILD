# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=goproxy
pkgver=8.3
pkgrel=2
pkgdesc="A high performance HTTP, HTTPS, websocket, TCP, UDP, Secure DNS, Socks5 proxy server"
arch=('x86_64')
url="https://github.com/snail007/goproxy"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/snail007/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go' 'git')
md5sums=('1b0fb4fbf3abfe65b4ed7123b6be6101')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  find . -name '*.go' | xargs -L1 sed -i -e 's,"proxy/,"github.com/snail007/goproxy/,g'
  [[ -f go.mod ]] || go mod init github.com/snail007/goproxy
}

build() {
  cd $srcdir/$pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
