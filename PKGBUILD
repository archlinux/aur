# Maintainer: robinpie <redacted@fake.email>
pkgname=dinky
pkgver=0.8.0
pkgrel=3
pkgdesc='A terminal text editor for those who just want to edit some text'
arch=('x86_64')
url='https://github.com/sedwards2009/dinky'
license=('MIT')
makedepends=('go>=1.24')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0cb51d24fd1ac0dfdd4861ba2f2ac3daf25439dde76343061b8df72cefe1e703')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  go build -v -o dinky .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 dinky "${pkgdir}/usr/bin/dinky"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
