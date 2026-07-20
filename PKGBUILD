# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# Rendered by .github/workflows/release.yml: 0.5.0 is replaced with the
# release tag and sha256sums is filled by updpkgsums during the test build,
# so the published PKGBUILD is exactly what was built and verified.
pkgname=secrets-dispatcher
pkgver=0.5.0
pkgrel=1
pkgdesc='Per-operation approval and audit logging for secret access and git commit signing on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/nikicat/secrets-dispatcher'
license=('MIT')
depends=('glibc')
makedepends=('go' 'deno' 'git' 'make')
install=secrets-dispatcher.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cb9f86f0dbb6699a84a873790463fc2e60f980643f0fe3cf97c61b25cae5c23f')

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
