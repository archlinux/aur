# Maintainer: ml <ml@visu.li>
pkgname=kind
pkgver=0.7.0
pkgrel=2
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('docker')
makedepends=('go')
optdepends=('kubectl: for managing Kubernetes clusters')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kind/archive/v${pkgver}.tar.gz")
sha256sums=('d2d4f98596b68c449be95a31e9680fbf7ff3503a28a0943f1997eba50de208f9')

build() {
  # version.GitCommit is ignored for tagged releases
  # _commit="$(zcat "${srcdir}/${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)"
  # -ldflags "-X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=${_commit}"
  cd "${pkgname}-${pkgver}"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'
  go build -o "$pkgname"
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
