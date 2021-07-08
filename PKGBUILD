# Maintainer: Chuang Zhu <genelocated at yandex dot com>

pkgname=tunasync
pkgver=0.7.1
_githash=a54c969081b3b3089d18419c5364b0d8f270f9ab
pkgrel=1
pkgdesc='Mirror job management tool.'
url='https://github.com/tuna/tunasync'
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('go' 'make')
replaces=('tunasync-git' 'tunasync-bin')
conflicts=('tunasync-git' 'tunasync-bin')
provides=('tunasync' 'tunasynctl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbf30ab4f241bdb68d2c090d15feeeeb5aa2146d0ed2823bcd910f1650bc5146')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  _buildstamp="`date -u '+%s'`"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags="-linkmode=external -X main.buildstamp=$_buildstamp -X main.githash=$_githash" \
    -o build/ \
    ./cmd/tunasync \
    ./cmd/tunasynctl 
}

# check() {
#   cd "$pkgname-$pkgver"
#   _testpackages="`sed "s|$url|.|g" .testpackages.txt`"
#   go test $_testpackages
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/tunasync "$pkgdir"/usr/bin/tunasync
  install -Dm755 build/tunasynctl "$pkgdir"/usr/bin/tunasynctl
}

