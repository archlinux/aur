# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=gomi
pkgver=1.2.2
pkgrel=1
pkgdesc="Rm alternative written in Go"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/b4b4r07/${pkgname}"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6482ce9e610f9be14a7b5f87dec4742d8ba9a315adf07a93e6963f0dabf09a22f79e9adcac87b3538e19f9ce4cc7c335d53000f13200acd7780ebaa459e0a4bf')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd ${pkgname}-${pkgver}
  go build -o build
}

check() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd ${pkgname}-${pkgver}
  go test ./...
}

package() {
  cd ${pkgname}-${pkgver}
  install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
