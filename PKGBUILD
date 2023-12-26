# Maintainer: Lev Gorodetskiy <aur@drsr.io>
pkgname=unflac
pkgrel=1
pkgver=1.2
pkgdesc='A command line tool for fast frame accurate audio image + cue sheet splitting.'
arch=('x86_64')
url="https://git.sr.ht/~ft/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/$pkgver.tar.gz")
depends=('ffmpeg')
sha256sums=('070d404cd088de024d425bbbf224b302bc02db903a8b3526f20e423019cac796')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
