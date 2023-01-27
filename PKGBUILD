# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=pdtm-git
_pkgname=pdtm
pkgver=0.0.3.r0.gef9c86b
pkgrel=1
pkgdesc='pdtm is a simple and easy-to-use golang based tool for managing open source projects from ProjectDiscovery'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/pdtm'
license=('MIT')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
source=("${_pkgname}::git+https://github.com/projectdiscovery/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  cd "${srcdir}/${_pkgname}/cmd/${_pkgname}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  mkdir -p ../build
  go build -o ../build -v ./...

  go clean -modcache
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dvm755 "cmd/build/${_pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
