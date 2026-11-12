# Maintainer: agony <27015 at riseup dot net>

pkgname=openapi
pkgver=1.26.3
pkgrel=1
pkgdesc='CLI for working with OpenAPI, Swagger, Arazzo and Overlay documents'
arch=('x86_64' 'aarch64')
url='https://github.com/speakeasy-api/openapi'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af4dfb380ec5d8845f979df9889d77368aee4cbeac68791b4cf4522bed81a5c1')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X main.version=${pkgver}" -o build/ ./cmd/openapi
  for shell in bash fish zsh; do
    build/openapi completion "${shell}" > "completion.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  # The stress tests download Arazzo documents from GitHub
  go test -skip '^TestArazzo_StressTests_(Validate|RoundTrip)$' ./... ./cmd/openapi/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/openapi -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/openapi"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/openapi.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_openapi"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
