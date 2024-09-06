# Maintainer: Imran Iqbal <imran@imraniqbal.org>
pkgname=cf-ddns
pkgver=0.2.0
pkgrel=1
pkgdesc='Simple program to update Cloudflare A records, useful for dynamic dns'
arch=('x86_64')
url="https://git.sr.ht/~imraniq/$pkgname"
license=('GPL3')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1331bfb42bc4f395a6238d0de99b5b6d436ba78c3f623f2236af1e20c3d57cb6')

prepare(){
  cd "$srcdir/$pkgname-v$pkgver" || exit
  mkdir -p build/
  go mod download
}

build() {
  cd "$srcdir/$pkgname-v$pkgver" || exit
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$srcdir/$pkgname-v$pkgver" || exit
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-v$pkgver" || exit
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
