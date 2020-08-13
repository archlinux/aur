# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=anew
pkgname=${_pkgname}-git
pkgver=r6.f212493
pkgrel=1
pkgdesc='Append lines from stdin to a file, but only if they dont already appear in the file'
arch=('x86_64')
url='https://github.com/tomnomnom/anew'
license=('MIT')
makedepends=('git' 'go')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

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
  export GOPATH="${srcdir}"

  cd "${_pkgname}"
  go build -v -o "${_pkgname}" main.go
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.mkd'
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE'
}

# vim: ts=2 sw=2 et:
