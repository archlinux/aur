# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=dogo-git
pkgver=1.0_beta2.r9.g7887b84
pkgrel=1
pkgdesc="Monitoring changes in the source file and automatically compile and run (restart)"
arch=('x86_64')
url='https://github.com/liudng/dogo'
license=('BSD')
provides=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'go')
source=("dogo::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/dogo"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/dogo"
  mkdir -p build/
}

build() {
  cd "${srcdir}/dogo"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/dogo"
  install -Dm755 build/dogo "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}