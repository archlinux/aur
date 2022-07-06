pkgname=radioboat
pkgver=0.2.0
pkgrel=3
pkgdesc="A terminal web radio client, built with simplicity in mind"
arch=('x86_64')
url="https://github.com/slashformotion/radioboat"
license=('APACHE')
makedepends=('go' 'git')
depends=('mpv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c3aa7dadf5415077bd449b98aa95cfd2b4b80deb48e54dc97e16d20a383feb31')
provides=('radioboat')
prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download -x
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o build .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
}