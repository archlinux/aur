# Maintainer: qvalentin
# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls
pkgver=0.1.0
pkgrel=1
_commit=5b1dcc4e9b1ec3bbf6ec630cb43d3253fe624766
pkgdesc='Language server for Helm'
license=(MIT)

url='https://github.com/mrjosh/helm-ls'
# NOTE: submodules are required for check()
source=("$pkgname::git+$url.git#tag=v$pkgver")
md5sums=(SKIP)

arch=(x86_64)
depends=(glibc)
makedepends=(git go)
checkdepends=(yaml-language-server)
options=('!debug')

verify() {
  cd "$SRCDEST/$pkgname"
  # Check the commit hash of the tag - effectively verifies the source files
  [ "$(git --git-dir . rev-list -n1 v$pkgver)" = "$_commit" ]
}

build() {
  cd "$srcdir/$pkgname"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOLDFLAGS="-linkmode=external"

  make
}

check() {
  cd "$srcdir/$pkgname"
  # NOTE: cannot run `make test` as -buildmode=pie is not supported with -race
  make integration-test-deps
  go test ./... -tags=integration
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bin/helm_ls -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
