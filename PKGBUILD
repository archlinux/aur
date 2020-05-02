# Maintainer: ml <ml@visu.li>
pkgname=kind
pkgver=0.8.1
pkgrel=2
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('docker')
optdepends=('podman: to use podman as container engine')
makedepends=('go' 'git' 'gzip')
optdepends=('kubectl: for managing Kubernetes clusters')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kind/archive/v${pkgver}.tar.gz")
sha256sums=('2a04a6427d45fa558fc4bfe90fde0b7ea2c7f2d6fcf3b7c581fc281ae49b5447')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  local _commit
  _commit="$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)"
  cd "${pkgname}-${pkgver}"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o "$pkgname" -ldflags "-X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=${_commit}"
}

check() {
  cd "${pkgname}-${pkgver}"
  # CGO_FLAGS might break tests for yay users. TODO: investigate
  unset CGO_CFLAGS
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  ./"$pkgname" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  ./"$pkgname" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
