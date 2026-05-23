# Maintainer: LekkerKofi

pkgname=flux-operator
pkgver=0.50.0
pkgrel=1
pkgdesc="GitOps on Autopilot Mode"
arch=('x86_64' 'aarch64')
url="https://fluxoperator.dev"
license=('AGPL-3.0-only')
depends=(glibc)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/controlplaneio-fluxcd/flux-operator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d6b525b9bc6cd7f120fef893ea6e80f16b2f3c0fd6d89feb7a308f7369abccb')

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
