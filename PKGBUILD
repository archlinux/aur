# Maintainer: Igor Shimanogov <shimanogov.in@phystech.edu>

pkgname=runal
pkgver=0.7.0
pkgrel=1
pkgdesc='text-based creative coding environment for the terminal'
arch=('x86_64')
url="https://github.com/emprcl/$pkgname"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d31c2ad9d4138fa86071e565c17b7446a57ede100e1ef0079b8174316ec534bd')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver/cli"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./... -vet=atomic,bool,buildtags,directive,errorsas,ifaceassert,nilfunc,stringintconv,tests
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd 'cli'
  ls
  install -Dm755 $pkgname-cli "$pkgdir"/usr/bin/$pkgname
}
