# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=ctx
pkgver=0.1.10
pkgrel=1
pkgdesc='Multi-environment context switcher for cloud, Kubernetes, VPN, and SSH tunnels'
arch=('x86_64')
url='https://github.com/vlebo/ctx'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('03f4379f0b1e187085f4037ae4c6ddc85b15e216ac24d59cc8f353cc06b2d3fb')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/
  export GOPATH="${srcdir}"
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
    -ldflags "-linkmode=external -extldflags '${LDFLAGS}' \
      -X main.version=${pkgver} \
      -X main.commit=v${pkgver} \
      -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    -o build/ctx ./cmd/ctx

  # Generate shell completions
  ./build/ctx completion bash > build/ctx.bash
  ./build/ctx completion fish > build/ctx.fish
  ./build/ctx completion zsh > build/_ctx
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/ctx "${pkgdir}/usr/bin/ctx"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Shell completions
  install -Dm644 build/ctx.bash "${pkgdir}/usr/share/bash-completion/completions/ctx"
  install -Dm644 build/ctx.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ctx.fish"
  install -Dm644 build/_ctx "${pkgdir}/usr/share/zsh/site-functions/_ctx"
}
