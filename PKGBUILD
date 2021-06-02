# Maintainer: ml <>
pkgname=kind
pkgver=0.11.1
pkgrel=2
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'docker: container engine'
  'podman: container engine'

  'kubectl: for managing Kubernetes clusters'
)
install=kind.install
source=("https://github.com/kubernetes-sigs/kind/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        iptables.conf)
sha256sums=('95ce0e7b01c00be149e5bd777936cef3f79ba7f1f3e5872e7ed60595858a2491'
            'fac7413afb24af54abd8cbe5e1424723ea6bccf0c26205670b7f3f4fe0f98f0d')

build() {
  local _commit
  _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'

  go build -o "$pkgname" -ldflags="-linkmode=external \
    -X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=$_commit"

  ./"$pkgname" completion bash >completion.bash
  ./"$pkgname" completion zsh >completion.zsh
}

package() {
  install -Dm755 iptables.conf -t "$pkgdir/etc/modules-load.d"

  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
