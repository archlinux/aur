# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=soryu-git
_pkgname=soryu
pkgver=r8.e371d90
pkgrel=1
license=('Unlicense')
pkgdesc='Glitch an image in the terminal'
makedepends=("git" "go")
conflicts=('soryu')
provides=('soryu')
arch=("x86_64")
_gourl='github.com/enjuus/soryu'
url="https://${_gourl}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')


pkgver() {
	cd "$srcdir/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw -mod=vendor"
  go mod vendor
  go build -o $_pkgname .

  go clean -modcache
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 -t "${pkgdir}/usr/bin" $_pkgname
}
# vim:set ts=2 sw=2 et:
