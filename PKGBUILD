# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname=clai
pkgver=1.10.8
pkgrel=1
pkgdesc="Command line artificial intelligence - Your local LLM context-feeder"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/baalimago/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('glow: for formatted markdown output when querying text responses')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e646a49b22522420d39f73d5f1131ae26b6637507faa226e81948ce26ea32918')

prepare() {
  cd "${srcdir}/${_pkgsrc}"

  export GOMODCACHE="${srcdir}/go-mod-cache"

  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"

  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"

  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
