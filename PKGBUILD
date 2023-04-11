# Maintainer: FLX (Paul Werther) <flx@evait.de>
pkgname=katana-git
_pkgname=katana
pkgver=1.0.1.r0.g846693f
pkgrel=1
pkgdesc='A next-generation crawling and spidering framework'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/projectdiscovery/katana'
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
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
