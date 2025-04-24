# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Götz
# Contributor: Jni <jni.viens at protonmail dot com>

pkgname="bitrise"
pkgver=2.31.0
pkgrel=1
pkgdesc="Run your bitrise.io automations offline"
arch=('x86_64')
url="https://www.bitrise.io/cli"
_url="https://github.com/bitrise-io/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('envman: manage Environment Variable collections'
            'stepman: manage decentralized StepLib Step (script) collections')
install="${pkgname}.install"
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a3805ca8fe04a3ce835d0641c3c51ca477bc594696e8ee842dbb8f272ebcd0e8')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"

  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  go build -v -o "build/${pkgname}" .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
