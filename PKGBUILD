# Maintainer: qvalentin
# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls
pkgver=0.0.17
pkgrel=1
_commit=bab4b4c745a472ee517967a71d21b2892f7f0307
pkgdesc='Language server for Helm'
arch=(x86_64)
url='https://github.com/mrjosh/helm-ls'
license=(MIT)
depends=(glibc)
makedepends=(go)
checkdeps=(yaml-language-server)
options=('!debug')
# NOTE: submodules are required for check()
source=("$pkgname::git+$url.git")
md5sums=(SKIP)

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
