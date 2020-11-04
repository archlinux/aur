# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='cspparse'
pkgname="${_pkgname}-git"
pkgver=r27.372a4b8
pkgrel=1
pkgdesc='Tool to evaluate Content Security Policies'
arch=('x86_64')
url='https://github.com/lc/cspparse'
license=('Unknown')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${_pkgname}"
  go build -v -o "${_pkgname}" .
}

package() {
  cd "${_pkgname}"
  install -Dvm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
  #install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
