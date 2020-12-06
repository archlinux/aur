# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='moar'
pkgname="${_pkgname}-git"
pkgver=1.1.r0.geace381
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
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${_pkgname}"
  go build -v -o "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
