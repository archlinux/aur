# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_binname="chaos"
pkgname="${_binname}-client"
pkgver=0.5.2
pkgrel=1
pkgdesc="Go client to communicate with Chaos DB API"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://chaos.projectdiscovery.io"
_url="https://github.com/projectdiscovery/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('e7a720426da76a07cebf2b810c5950b5377b121a08dbe763ea0c8f66c7f6a2f4fb4ae7e06a6d7ad12d52b63d2b869d5d3bbc9078df444ad318c84def4103eddc')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

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
  go build -v -o "build/${_binname}" ./"cmd/${_binname}"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_binname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim: ts=2 sw=2 et:
