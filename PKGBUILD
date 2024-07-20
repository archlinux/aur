# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: irmluity <45vw4yz8g@mozmail.com>

_binname="clash"
_pkgname="clasht"
pkgname="${_pkgname}-git"
pkgver=1.20.1.r1.g7b55c5e
pkgrel=1
pkgdesc="A rule-based tunnel in Go. Provide you with powerful and fast network functions"
arch=('any')
url="https://${_pkgname}.drypeng.io/"
_url='https://github.com/DryPeng/clashT'
license=('GPL-3.0-or-later')
makedepends=('git' 'go')
depends=('glibc')
optdepends=('clash-geoip: a GeoLite2 data created by MaxMind')
provides=("${_pkgname}=${pkgver%%.r*}" "${_binname}=${pkgver%%.r*}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="clashT"
source=("${_pkgsrc}::git+${_url}.git"
        "${_binname}.service")
sha256sums=('SKIP'
            '2112a72532fdda187a649c5b35468dbba32d5c4601f36c107f4be202197c6b7a')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
                  -X ${_url#https://}/clashT/constant.Version=${pkgver%%.r*} \
                  -X ${_url#https://}/clashT/constant.Version=$(date -u)"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${_pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}"
  install -Dm644 "${_binname}.service" "${pkgdir}/usr/lib/systemd/system/${_binname}.service"

  cd "${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
