# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Thiago Almeida <thiago.almeida@topgolf.com>
pkgname=hcledit
url=https://github.com/minamijoyo/hcledit
pkgver=0.2.7
pkgrel=2
pkgdesc="A command line editor for HCL"
arch=('i686' 'x86_64' 'arm' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!lto')
changelog="${pkgname}.changelog"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/minamijoyo/hcledit/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8e851f989dadf671af7082eca9e90055fbce94b22f50eb764e4ab10ebb04a2396ff1444de6f563968e1deca6f1098218ebbeb98e590d0b5ecf99be33128ed227')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
