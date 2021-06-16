# Maintainer: ml <>
pkgname=kind
pkgver=0.11.1
pkgrel=5
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('x86_64' 'aarch64')
url='https://kind.sigs.k8s.io/'
license=('Apache')
depends=('kubectl')
makedepends=('go' 'git')
optdepends=(
  'podman: provider podman '
  'podman-dnsname: provider podman'
  'dnsmasq: provider podman'
  'docker: provider docker')
install=kind.install
source=("https://github.com/kubernetes-sigs/kind/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        modules-load.conf
        registry-aliases.conf)
sha256sums=('95ce0e7b01c00be149e5bd777936cef3f79ba7f1f3e5872e7ed60595858a2491'
            '87bc2d0263e7393c66d540375efa9b68f2e3fdd72d5b12688587e0c3d6b99d88'
            '0a1fb437511953ca2416aeebe954fb68189dfb493ce41f99d021eb4f142ffb2e')

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
  install -Dm644 modules-load.conf "$pkgdir/etc/modules-load.d/kind.conf"
  install -Dm644 registry-aliases.conf "$pkgdir/etc/containers/registries.conf.d/kind.conf"

  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
