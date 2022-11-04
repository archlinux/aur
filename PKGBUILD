# Maintainer: Will Furnass <will at thearete dot co dot uk>

pkgname='fn'
pkgver='0.6.22'
pkgrel='3'
epoch=
pkgdesc='fn: a container-native, cloud-agnostic tool for defining serverless functions.'
arch=('x86_64')
url='https://fnproject.io/'
license=('Apache')
groups=()
depends=('docker')
makedepends=('go')
source=("https://github.com/fnproject/cli/archive/$pkgver.tar.gz")
sha256sums=('40581ee36aed8c570ce5dff63ac3dc291b5c0c17dcb92ded54626157d9db702b')

prepare(){
  cd "cli-$pkgver"
}

build() {
  cd "cli-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname
}

check() {
  cd "cli-$pkgver"
  test "$($pkgname --version)" == "fn version $pkgver"
  # NB github.com/fnproject/cli/commands tests can't be run as get
  # 'commands/invoke_windows.go:16:1: misplaced +build comment'
  go test -v $(go list ./... |  grep -Ev '^github.com/fnproject/cli/test$' | grep -Ev '^github.com/fnproject/cli/commands$')
}

package() {
  cd "cli-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}






