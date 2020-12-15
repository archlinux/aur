# Maintainer: ml <>
_pkgname=cert-manager
_bin=kubectl-${_pkgname/-/_}
pkgname=kubectl-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc='Automatically provision and manage TLS certificates in Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/jetstack/cert-manager'
license=('Apache')
depends=('kubectl')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ae4b38bd7c1d88668e077fdca16b5505f75c9e2cd941db082a52290fba396901')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
}

build() {
  local _x _commit
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  _x=(
    AppVersion="v$pkgver"
    AppGitCommit="$_commit"
    AppGitState="clean"
  )

  cd "$_pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -o "$_bin" -ldflags="-linkmode=external ${_x[*]/#/-X=github.com/jetstack/cert-manager/pkg/util.}" ./cmd/ctl
}

check() {
  cd "$_pkgname-$pkgver"
  # we don't want e2e and other tests that explicitly want bazel
  go test -short ./cmd/ctl/...
}

package() {
  install -Dm755 "$_pkgname-$pkgver/$_bin" -t "$pkgdir/usr/bin"
}
