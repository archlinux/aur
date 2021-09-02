# Maintainer: Chuang Zhu <genelocated at yandex dot com>

pkgname=tunasync
pkgver=0.8.0
_githash=c07aaffe65da65217665d7c5df46ea2d857fdfa9
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
sha256sums=('c14c588cda22e280a6c264f7e6351e9648f2099f48bbc110ec51e135e0e2eeef')

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

