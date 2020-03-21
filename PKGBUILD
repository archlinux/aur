# Maintainer: ml <ml@visu.li>
pkgname=kind
pkgver=0.7.0
pkgrel=1
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('docker' 'glibc')
makedepends=('go' 'gzip')
optdepends=('kubectl: for managing Kubernetes clusters')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kind/archive/v${pkgver}.tar.gz")
sha256sums=('d2d4f98596b68c449be95a31e9680fbf7ff3503a28a0943f1997eba50de208f9')

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  local commit="$(zcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)"
  cd "${pkgname}-${pkgver}"
  # version.GitCommit is ignored for tagged releases, keeping it just in case this changes
  go build -o "$pkgname" -ldflags "-X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=${commit}"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  ./"$pkgname" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  ./"$pkgname" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
