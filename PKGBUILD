# Maintainer: ml <>
pkgname=kubectl-cert-manager
pkgver=1.2.0
pkgrel=1
pkgdesc='Automatically provision and manage TLS certificates in Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/jetstack/cert-manager'
license=('Apache')
depends=('kubectl')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('12950a802ed47d31ab73893cc6e94f1f56188830e9006b0a2a916d0d05d29720')

prepare() {
  cd cert-manager-"$pkgver"
  #go mod vendor
}

build() {
  local _x _commit
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  _x=(
    AppVersion="v$pkgver"
    AppGitCommit="${_commit:?}"
    AppGitState="clean"
  )

  cd cert-manager-"$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -ldflags="-linkmode=external ${_x[*]/#/-X=github.com/jetstack/cert-manager/pkg/util.}" ./cmd/ctl
}

check() {
  cd cert-manager-"$pkgver"
  # we don't want e2e and other tests that explicitly want bazel
  go test -short ./cmd/ctl/...
}

package() {
  cd cert-manager-"$pkgver"
  install -Dm755 ctl "$pkgdir"/usr/bin/kubectl-cert_manager
}
