# Maintainer: agony <27015 at riseup dot net>

pkgname=gator
pkgver=3.23.1
pkgrel=1
pkgdesc='Suite of authorship tools for Gatekeeper policies'
arch=('x86_64' 'aarch64')
url='https://github.com/open-policy-agent/gatekeeper'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("gatekeeper-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d49585365c26e809754850b4119b0f97eaba608071b1c99bc3e68b41038272e')

_gator_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
}

_go_env() {
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
}

prepare() {
  cd "gatekeeper-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "gatekeeper-${pkgver}"
  _go_env
  go build -v -ldflags="-linkmode=external -X github.com/open-policy-agent/gatekeeper/v3/pkg/version.Version=v${pkgver}" -o gator ./cmd/gator
  for shell in bash fish zsh; do
    ./gator completion "${shell}" > "completion.${shell}"
  done
}

check() {
  _go_env
  _gator_env
  cd "gatekeeper-${pkgver}"
  go test ./cmd/gator/... ./pkg/gator/...
}

package() {
  cd "gatekeeper-${pkgver}"
  install -Dm755 gator -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/gator"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/gator.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_gator"
  install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
