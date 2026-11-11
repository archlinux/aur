# Maintainer: agony <27015 at riseup dot net>

pkgname=terratag
pkgver=0.8.3
pkgrel=1
pkgdesc='Automatically create and maintain tags across AWS, Azure and GCP resources in Terraform'
arch=('x86_64' 'aarch64')
url='https://github.com/env0/terratag'
license=('MPL-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('opentofu: provider schemas for Terraform files'
            'terraform: provider schemas for Terraform files'
            'terragrunt: tagging Terragrunt projects')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('74a8f4ca1553cbdd2f9c84dde2312ec0debbbd2093486234fa7a7b107ac8c863')

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
  go build -v -ldflags="-linkmode=external -X main.version=${pkgver}" -o terratag ./cmd/terratag
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  # The integration tests run terraform, terragrunt and tofu and download providers
  SKIP_INTEGRATION_TESTS=1 go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 terratag -t "${pkgdir}/usr/bin"
}
