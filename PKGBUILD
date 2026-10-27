# Maintainer: David Birks <david@birks.dev>

pkgname=beads
pkgver=1.3.2
pkgrel=1
pkgdesc='Git-backed issue tracking system designed for AI coding agents'
arch=('x86_64')
url='https://github.com/gastownhall/beads'
license=('MIT')
provides=('bd')
depends=('git')
makedepends=('go' 'gcc')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gastownhall/beads/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4ac28a8cba1e3d778dfff8e2166e6c3fc5149f96522e548bb5a3a6a6aa076d7806cb0a18819df394f3171d372dc2122e4b75c318f981a29de0065f662279914f')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -buildvcs=false -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export CGO_ENABLED=1
  export GOTOOLCHAIN=local

  go build -tags gms_pure_go -o bd ./cmd/bd
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 bd "${pkgdir}/usr/bin/bd"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

  "${pkgdir}/usr/bin/bd" completion bash > "${pkgdir}/usr/share/bash-completion/completions/bd"
  "${pkgdir}/usr/bin/bd" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_bd"
  "${pkgdir}/usr/bin/bd" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/bd.fish"

  # Clean up Go cache
  go clean -modcache
}
