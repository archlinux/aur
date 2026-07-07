# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=tls-client
pkgname=tls-client-git
pkgver=1.15.1.r2.gb790a31
pkgrel=1
pkgdesc="net/http.Client-like HTTP client with selectable TLS fingerprints"
arch=('x86_64' 'aarch64')
url="https://github.com/bogdanfinn/tls-client"
license=('BSD-4-Clause')
depends=('glibc')
makedepends=('go' 'git')
provides=('tls-client' 'lib-tls-client')
conflicts=('tls-client' 'lib-tls-client')
source=("git+${url}.git" "${_pkgname}.pc.in")
sha256sums=('SKIP'
            '082b1fb28aa31320960d5f523dc2419f09958602577ed3f5184f5bb55896a2bc')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${_pkgname}/cffi_dist"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod edit -replace "github.com/bogdanfinn/tls-client=../"
  go mod download -modcacherw
}

build() {
  cd "${srcdir}/${_pkgname}/cffi_dist"
  export CGO_ENABLED=1
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -buildmode=c-shared -o build/${_pkgname}.so .
  sed "s|%%LIBVER%%|${pkgver}|g" "${srcdir}/${_pkgname}.pc.in" > build/${_pkgname}.pc
}

check() {
  cd "${srcdir}/${_pkgname}"
  go test .
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 cffi_dist/build/${_pkgname}.so "${pkgdir}/usr/lib/lib${_pkgname}.so"
  ln -s "lib${_pkgname}.so" "${pkgdir}/usr/lib/${_pkgname}.so"
  install -Dm644 cffi_dist/build/${_pkgname}.h "${pkgdir}/usr/include/${_pkgname}.h"
  install -Dm644 cffi_dist/build/${_pkgname}.pc "${pkgdir}/usr/lib/pkgconfig/${_pkgname}.pc"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 Readme.md "${pkgdir}/usr/share/doc/${pkgname}/Readme.md"
}
