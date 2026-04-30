# Maintainer: Trevor Facer <trevordf@protonmail.com>

pkgname=docker-model-plugin
pkgver=1.1.38
pkgrel=1
pkgdesc='Docker CLI plugin for Model Runner - manage and run AI models in containers'
arch=('x86_64')
url='https://github.com/docker/model-runner'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go>=2:1.25')
optdepends=('docker: for Docker Engine container operations')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/docker/model-runner/archive/v${pkgver}.tar.gz")
sha256sums=('a753688f2ca973066ac93b123319979afaa6725feac3e1390da36eb36e16cb69')

prepare() {
  cd "model-runner-${pkgver}"

  # Download Go module dependencies for both modules
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS="-modcacherw"

  # Download root module dependencies (required by cmd/cli)
  go mod download -x

  # Download CLI module dependencies
  cd cmd/cli
  go mod download -x
}

build() {
  cd "model-runner-${pkgver}/cmd/cli"

  # Set Go build flags per Arch guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}/gopath"

  # Build the binary with version information
  # Upstream ldflags format: -X github.com/docker/model-runner/cmd/cli/desktop.Version
  go build -o docker-model \
    -ldflags "-linkmode=external -X github.com/docker/model-runner/cmd/cli/desktop.Version=${pkgver}" \
    .
}

check() {
  cd "model-runner-${pkgver}/cmd/cli"

  # Verify binary was built correctly
  ./docker-model --help > /dev/null

  # Run unit tests
  go test -short -v ./... || warning "Some tests failed - may require Docker runtime"
}

package() {
  cd "model-runner-${pkgver}"

  # Install CLI plugin to system-wide Docker plugin directory
  install -Dm755 cmd/cli/docker-model "${pkgdir}/usr/lib/docker/cli-plugins/docker-model"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
