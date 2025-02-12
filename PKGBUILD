# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Götz
# Contributor: Jni <jni.viens at protonmail dot com>

pkgname="bitrise"
pkgver=2.28.0
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
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e6db749ae7f282ff0935954aa3d8312360310ee7efadce684ef4a42f5c25892c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .
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
