# Maintainer: gcrtnst <52910071+gcrtnst@users.noreply.github.com>

pkgname='pacorphan'
pkgver='0.2.0'
pkgrel=1
pkgdesc='A smarter alternative to "pacman -Qdt"'
arch=('x86_64')
url='https://github.com/gcrtnst/pacorphan'
license=('Unlicense')
depends=('glibc' 'pacman')
makedepends=('git' 'go')
checkdepends=('util-linux')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('af092c8a4a37b20f5b6cfccdbbb9596ad710ebacbe3a94911ef7b33ce6fa4485')

_gomodflags=(
  '-modcacherw'
)

_gobuildflags=(
  '-buildmode=pie'
  '-mod=vendor'
  '-ldflags=-compressdwarf=false -linkmode=external'
  '-buildvcs=true'
  "${_gomodflags[@]}"
)

_go() {
  local -x CGO_ENABLED=1
  local -x CGO_CFLAGS="${CFLAGS}"
  local -x CGO_CPPFLAGS="${CPPFLAGS}"
  local -x CGO_CXXFLAGS="${CXXFLAGS}"
  local -x CGO_FFLAGS="${FFLAGS}"
  local -x CGO_LDFLAGS="${LDFLAGS}"
  local -x GOPATH="$srcdir/gopath"

  go "$@"
}

prepare() {
  cd "$pkgname"

  # Prevent "+dirty" from appearing in "pacorphan --version"
  # by excluding generated directories.
  echo "/vendor/" >> .git/info/exclude
  echo "/build/"  >> .git/info/exclude

  _go mod vendor "${_gomodflags[@]}" -v
}

build() {
  cd "$pkgname"

  mkdir -p build/
  _go build "${_gobuildflags[@]}" -v -o "build/$pkgname" .
}

check() {
  cd "$pkgname"

  mkdir -p build/
  _go build "${_gobuildflags[@]}" -v -o "build/alpmtest" ./internal/alpmtest
  _go build "${_gobuildflags[@]}" -v -o "build/pacorphantest" ./internal/pacorphantest

  _go test -v ./...
  build/alpmtest
  build/pacorphantest --cmd "build/$pkgname"
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin/" "build/$pkgname"
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -vDm644 -t "$pkgdir/usr/share/man/man1/" man/man1/pacorphan.1
}
