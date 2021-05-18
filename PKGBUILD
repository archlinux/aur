# Maintainer: ml <>
pkgname=kind
pkgver=0.11.0
pkgrel=1
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'docker: container engine'
  'podman: container engine'

  'bazel: building node images with bazel'
  'kubectl: for managing Kubernetes clusters'
)
source=("https://github.com/kubernetes-sigs/kind/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c78bed3a39afd2e523b38256b7f16445d0ad4b8b25f18b5766005e095af772cd')

build() {
  local _commit
  _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw -trimpath'
  go build -o "$pkgname" -ldflags "-linkmode=external -X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=$_commit"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  ./"$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  ./"$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
