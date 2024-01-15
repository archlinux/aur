# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Victor <victor@xirion.net>

pkgname=krew
pkgver=0.4.4
pkgrel=2
pkgdesc="Find and install kubectl plugins"
arch=(
  x86_64
  aarch64
  armv7h
)
url="https://github.com/kubernetes-sigs/krew"
license=(Apache-2.0)
depends=(
  git
  glibc
  kubectl
)
makedepends=(go)
install=kubectl-krew.install

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd11ef2d56a0897d38ac219f17332effbd09a3c6a1f68974635b925ba129cd35')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _ld_flags="-linkmode external"
  _ld_flags="$_ld_flags -X sigs.k8s.io/krew/internal/version.gitTag=v$pkgver"
  go build -buildvcs=false -ldflags "$_ld_flags" -o . ./cmd/...
}

check() {
  cd "$_archive"

  unset KREW_ROOT
  KREW_BINARY="$PWD/krew" go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 krew "$pkgdir/usr/bin/kubectl-krew"
  install -Dm755 validate-krew-manifest "$pkgdir/usr/bin/validate-krew-manifest"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp --archive -t "$pkgdir/usr/share/doc/$pkgname" docs/*
}
