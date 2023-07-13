# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Victor <victor@xirion.net>

pkgname=krew
pkgver=0.4.3
pkgrel=3
pkgdesc="Find and install kubectl plugins"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/kubernetes-sigs/krew"
license=(Apache)
depends=(
  glibc
  kubectl
  git
)
makedepends=(go)
install=kubectl-krew.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('77cc28f744e10ce33860e47c1465fddb9e1b171ac5c366792785df27e29bcd34')

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
  go build -o . -ldflags "$_ld_flags" ./cmd/{krew,validate-krew-manifest}
}

check() {
  cd "$_archive"

  unset KREW_ROOT
  KREW_BINARY="${PWD}/${pkgname}" go test ./...
}

package() {
  cd "$_archive"

  install -Dm755 krew "${pkgdir}/usr/bin/kubectl-krew"
  install -m755 validate-krew-manifest -t "${pkgdir}/usr/bin"

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
}
