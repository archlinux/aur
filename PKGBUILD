# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="cloudlist"
pkgver=1.5.1
pkgrel=1
pkgdesc="Tool for listing Assets from multiple Cloud Providers"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://docs.projectdiscovery.io/tools/cloudlist"
_url="https://github.com/projectdiscovery/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'go'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('e75a769df7418f51b011b444c62fd4b758547e2dcc130369f69872a1b6e7009c')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  go build -v -o "build/${pkgname}" "./cmd/${pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
