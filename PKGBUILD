# Maintainer: Joshua Schmeder <joshua@schmeder.dev>

_pkgname='moar'
pkgname="${_pkgname}-git"
pkgver=1.13.0.r0.geafb70d
pkgrel=1
pkgdesc='Drop-in replacement for the less pager'
arch=('x86_64')
url='https://github.com/walles/moar'
license=('BSD')
makedepends=('git' 'go')
optdepends=('highlight: syntax highlighting')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${_pkgname}"
  export VERSION="$(git describe --tags --dirty --always)"
  go build -v -ldflags="-s -w -X main.versionString=$VERSION" -o "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
}
