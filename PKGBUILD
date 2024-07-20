# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>

_binname="clash"
pkgname="clasht"
pkgver=1.20.1
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions"
arch=('any')
url="https://${pkgname}.drypeng.io/"
_url='https://github.com/DryPeng/clashT'
license=('GPL-3.0-or-later')
makedepends=('go')
depends=('glibc')
optdepends=('clash-geoip: a GeoLite2 data created by MaxMind')
provides=("${pkgname}" "${_binname}")
conflicts=("${pkgname}" "${_binname}")
_pkgsrc="clashT-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_binname}.service")
sha256sums=('83a1ba34822cf35c0b341b689b0f1130b61c47066a4647b5c18d2295a40784d4'
            '2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a')

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
  export LDFLAGS="${LDFLAGS:-} \
                  -X ${_url#https://}/clashT/constant.Version=${pkgver} \
                  -X ${_url#https://}/clashT/constant.Version=$(date -u)"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}"
  install -Dm644 "${_binname}.service" "${pkgdir}/usr/lib/systemd/system/${_binname}.service"

  cd "${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
