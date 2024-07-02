# Maintainer: qvalentin
# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls
pkgver=0.0.18
pkgrel=2
_commit=dd0ae6da6b873921f18ffc301940999f9593fcb9
pkgdesc='Language server for Helm'
license=(MIT)

url='https://github.com/mrjosh/helm-ls'
# NOTE: submodules are required for check()
source=("$pkgname::git+$url.git")
md5sums=(SKIP)

arch=(x86_64)
depends=(glibc)
makedepends=(git go)
checkdepends=(yaml-language-server)
options=('!debug')

verify() {
  cd "$pkgname"
  # Check the commit hash of the tag - effectively verifies the source files
  [ "$(git --git-dir . rev-list -n1 v$pkgver)" = "$_commit" ]
}

prepare() {
  cd "$srcdir/$pkgname"
  git checkout --quiet v$pkgver
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
