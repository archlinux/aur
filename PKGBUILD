# Maintainer: ml <>
_pkgname=cert-manager
pkgname=kubectl-"$_pkgname"
pkgver=1.0.3
pkgrel=1
pkgdesc='Automatically provision and manage TLS certificates in Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/jetstack/cert-manager'
license=('Apache')
depends=('kubectl')
makedepends=('git' 'go')
groups=('kubectl-plugins')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c7603966b7bdc788f64dafed12584870ee56be7f214e13ee86ad32d0a9b98078')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod download
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
  go build -ldflags="-linkmode=external ${_x[*]/#/-X=github.com/jetstack/cert-manager/pkg/util.}" \
    -o "$pkgname" ./cmd/ctl
}

check() {
  cd "$_pkgname-$pkgver"
  # we don't want e2e and other tests that explicitly want bazel
  go test -short ./cmd/ctl/...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
