# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=cf-ddns
pkgver=0.1.1
pkgrel=2
pkgdesc='Simple program to update Cloudflare A records, useful for dynamic dns'
arch=('x86_64')
url="https://git.sr.ht/~imraniq/$pkgname"
license=('GPL3')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('201dc027d199c6bc3474917f6f04ea7cbc14a386ac41c00f3ba4dd2c19ea0643')

prepare(){
  cd "$srcdir/$pkgname-v$pkgver"
  mkdir -p build/
  go mod download
}

build() {
  cd "$srcdir/$pkgname-v$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$srcdir/$pkgname-v$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
