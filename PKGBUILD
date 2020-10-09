# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='librespeed-cli'
pkgname="${_pkgname}-git"
pkgver=1.0.7.r3.geb7f5cb
pkgrel=1
pkgdesc='Command line client for LibreSpeed'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/librespeed/speedtest-cli'
license=('LGPL3')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
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
  go build -v -o "${_pkgname}"
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
