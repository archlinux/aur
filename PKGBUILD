# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=scanrepo
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI tool that finds secrets accidentally committed to a git repo, eg passwords, private keys"
arch=('x86_64')
url='https://github.com/UKHomeOffice/repo-security-scanner'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/UKHomeOffice/repo-security-scanner/archive/${pkgver}.tar.gz")
sha256sums=('56338926727798a45c8dac8649953e638131ff77a2ad7ae8a7d2b12b0ecc60ac')

prepare() {
  cd "repo-security-scanner-${pkgver}"
  mkdir -p build/
}

build() {
  cd "repo-security-scanner-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./cmd/..
}

package() {
  cd "repo-security-scanner-${pkgver}"
  install -Dm755 build/repo-security-scanner-${pkgver} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache # Clean go cache
}