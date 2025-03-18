# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

_commit='0e9bd17e0b2899c11bbd3b62db387e81ac61ea30'
pkgname=mop
pkgver=2025.03.17
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop-git')
options=('!emptydirs' '!lto')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mop-tracker/${pkgname}/archive/${_commit}.tar.gz")
b2sums=('618fe7c21e5539f34dca4b635dd137348b3f1f00d37ffa2f675a01c860f66e2c15d1f1e17a1b2d375d5c21b34badae336f74e2e1c5ac623d5d48bcb3f5afb465')

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${_commit} -linkmode=external"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${_commit}/mop" \
    "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
