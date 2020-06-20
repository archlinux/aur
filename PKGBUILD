# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=copy-pasta-git
pkgver=0.0.1.r28.g954489a
pkgrel=1
pkgdesc="Universal copy paste service, works across different machines"
arch=('x86_64')
url='https://github.com/jutkko/copy-pasta'
license=('MIT')
provides=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'go')
source=("copy-pasta::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/copy-pasta"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/copy-pasta"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./...
}

package() {
  cd "${srcdir}/copy-pasta"
  install -Dm755 build/copy-pasta "${pkgdir}/usr/bin/copy-pasta"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}