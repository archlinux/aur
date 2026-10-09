# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=nuclei-git
pkgver=3.11.1.r6653.59dad1b
pkgrel=1
pkgdesc="Fast and customizable vulnerability scanner"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://projectdiscovery.io/nuclei"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go>=1.27.1'
)
provides=("nuclei=$pkgver")
conflicts=("nuclei")
source=("git+https://github.com/projectdiscovery/nuclei")
b2sums=('SKIP')

pkgver() {
  cd nuclei
  _tag="$(grep -P '^\s+Version' pkg/catalog/config/constants.go | awk -F\` '{print $2}' | sed 's/^v//')"
  printf "%s.r%s.%s" "$_tag" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd nuclei
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd nuclei
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  go build -ldflags "-compressdwarf=false -linkmode external" ./cmd/nuclei
  go build ./cmd/docgen
}

check() {
  cd nuclei
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS='-buildmode=pie -mod=readonly -modcacherw'
  local _skip=(
    'lib' # Connects to an external host and gets an unexpected result
    'pkg/operators/common/dsl' # Always returns nil, but expects an error
  )
  go test $(go list ./... | grep -Ev "$(printf 'github\.com/projectdiscovery/nuclei/v3/%s$|' "${_skip[@]}" | sed 's/|$//')")
}

package() {
  cd nuclei
  install -Dm0755 nuclei -t "$pkgdir/usr/bin/"
  install -Dm0644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 <(./docgen /dev/stdout nuclei-jsonschema.json) "$pkgdir/usr/share/doc/$pkgname/docs.md"
}

# vim: ts=2 sw=2 et:
