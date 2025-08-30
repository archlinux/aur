# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="proxify"
pkgver=0.0.16
pkgrel=1
pkgdesc="Swiss Army knife Proxy tool for HTTP/HTTPS traffic capture, manipulation and replay"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
b2sums=('0cf6420cb2e2f44e2fb182817fe73f8e34e630c06d25660afcc006dcaaca499bb52534c9f3f3f13ac6543f5f27961503ec6770ad68dc432dd503ba1e75828f72')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build"
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
  go build -v -o "build/${pkgname}" ./"cmd/${pkgname}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.MD" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim: ts=2 sw=2 et:
