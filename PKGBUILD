# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=quien
pkgver=0.6.1
_builddate=$(date --rfc-3339=date)
pkgrel=1
pkgdesc="A better WHOIS lookup tool"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('13b0788797d3dc9e743a3dd64ff79fe228af009f8e0649e5fae85a9b36f6b9db')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags="-linkmode=external -X main.version=$pkgver -X main.commit=$pkgrel -X main.date=$_builddate" \
    -o ${pkgname}

  # Clean up deps
  go clean -modcache
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
