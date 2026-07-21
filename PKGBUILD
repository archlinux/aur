# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Rendered by .github/workflows/release.yml: 0.6.0 is replaced with the
# release tag and sha256sums is filled by updpkgsums during the test build,
# so the published PKGBUILD is exactly what was built and verified.
pkgname=secrets-dispatcher
pkgver=0.6.0
pkgrel=1
pkgdesc='Per-operation approval and audit logging for secret access and git commit signing on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/nikicat/secrets-dispatcher'
license=('MIT')
depends=('glibc')
makedepends=('go' 'deno' 'git' 'make')
install=secrets-dispatcher.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de5ec03a4aa552c6c1c96196e44d256a5cb676344b33a7f2d16c484c61212de3')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build VERSION="v$pkgver" GO_LDFLAGS="-linkmode=external -s -w"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 secrets-dispatcher "$pkgdir/usr/bin/secrets-dispatcher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.yaml.example "$pkgdir/usr/share/secrets-dispatcher/config.yaml.example"
}
