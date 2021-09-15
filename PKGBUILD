# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=nuclei
pkgver=2.5.1
pkgrel=1
pkgdesc='Fast tool for configurable targeted scanning based on templates offering massive extensibility and ease of use'
arch=('x86_64' 'armv6h' 'aarch64')
url='https://github.com/projectdiscovery/nuclei'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('d04adc6f2d12ed481aa6cf3e1166a6867640b54f21660e6ce250b5ae12522a97693657211b0eb1522b056b821a1565a71d956f999346c3b2aa42c21806b1a09a')

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  cd "${pkgname}-${pkgver}/v2"
  go build -v -o "${pkgname}" ."/cmd/${pkgname}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "v2/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
