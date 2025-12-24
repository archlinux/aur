# Maintainer: Lev Gorodetskiy <aur@drsr.io>
pkgname=unflac
pkgrel=1
pkgver=1.4
pkgdesc='A command line tool for fast frame accurate audio image + cue sheet splitting.'
arch=('x86_64')
url="https://git.sr.ht/~ft/$pkgname"
license=('MIT')
makedepends=('go')
source=("$url/archive/$pkgver.tar.gz")
depends=('ffmpeg')
sha256sums=('ab9e24d1c57176d939315059c0f6966db0bcb25f1295b490a8b6805ec801d5de')

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
