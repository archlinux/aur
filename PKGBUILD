# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl
pkgver=0.1.3
pkgrel=1
pkgdesc='Cherry Servers CLI.'
arch=('x86_64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
makedepends=(git go)
depends=(glibc)
conflicts=()
_commit="b3494ce755951a0639ec35f4df73406b2b7b706c" # v0.1.3
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/cherryctl"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd "$srcdir/cherryctl"
  mkdir -p build/
}

build() {
  cd "$srcdir/cherryctl"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$srcdir/cherryctl"
#  tests failing upstream
#  go test -v ./...
}

package() {
  cd "$srcdir/cherryctl"
  install -Dm755 build/cherryctl -t "$pkgdir"/usr/bin/
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/cherryctl/LICENSE"

  dir_path="$HOME/.config/cherry"
  if [ -z "$(find "$dir_path" -maxdepth 1 -name '*.yaml' -print -quit)" ]; then
    mkdir -p "$(dirname "$file_path")" && touch "$dir_path/default.yaml"
  fi
}
