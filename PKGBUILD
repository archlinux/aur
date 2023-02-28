# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=tekton-cli-bin
pkgver=0.29.1
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache-2.0')
makedepends=(git go)
conflicts=(tektoncd-cli tekton-cli)
_commit="d48a2cc72e7f695b4a90cee62678fd9764a7db85" # v0.29.1
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cli"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd "$srcdir/cli"
  mkdir -p build/
}

build() {
  cd "$srcdir/cli"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/tkn
}

check() {
  cd "$srcdir/cli"
  go test -v $(go list ./... | grep -v third_party/)
}

package() {
  cd "$srcdir/cli"
  install -Dm755 build/tkn "$pkgdir"/usr/bin/tkn
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tkn/LICENSE"
}
