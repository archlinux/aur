# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="go-http-file-server"
pkgname="${_pkgname}-git"
_binname="ghfs"
pkgver=1.18.1.r0.78ce441
pkgrel=1
pkgdesc="Simple command line based HTTP file server to share local file system"
arch=('any')
url="https://github.com/mjpclab/${_pkgname}"
license=('MIT')
makedepends=('git' 'go>=1.18')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${_binname}" .
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_binname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_binname}/LICENSE"
}
