# Maintainer: wansing <mail at wansing dot org>
pkgname=goscanpdf
pkgver=0.1.0
pkgrel=2
pkgdesc="Scans pages from a (document) scanner and uploads the compressed multipage PDF file via SSH. Works on a Raspberry Pi."
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/wansing/$pkgname"
license=('GPL')
makedepends=('go')
optdepends=('insaned')
source=("$url/archive/v$pkgver.tar.gz")
validpgpkeys=('F433936B030F7FB97F4084E4C7C21DFFE932EF9D')
sha256sums=('d779fcc4aa30e51d410ca87e6f7d18749b6a01dcb5c2d4a8a79b5065a6399efb')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  # "Dependencies defined inside the package() function are only required to run the software."
  depends=('graphicsmagick'
           'netcat'
           'openssh'
           'poppler'
           'rsync'
           'sane')
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
