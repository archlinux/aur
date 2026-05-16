# Maintainer: LekkerKofi

pkgname=flux-operator
pkgver=0.49.0
pkgrel=1
pkgdesc="GitOps on Autopilot Mode"
arch=('x86_64' 'aarch64')
url="https://fluxoperator.dev"
license=('AGPL-3.0-only')
depends=(glibc)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/controlplaneio-fluxcd/flux-operator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8a94f8506bdab34f10af6fd50009a72d033b48378e9bd07920319d91945952e')

prepare() {
  cd "${pkgname}-${pkgver}"

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"

  local ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
    -X main.VERSION=${pkgver} \
  "

  go build -v -ldflags "$ld_flags" -o flux-operator ./cmd/cli
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vDm755 -t "$pkgdir/usr/bin" flux-operator

  ./flux-operator completion bash | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/flux-operator"
  ./flux-operator completion fish | install -vDm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/flux-operator.fish"
  ./flux-operator completion zsh | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_flux-operator"
}
