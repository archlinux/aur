# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=mop
pkgname=${_pkgname}-git
pkgver=346.3ece0ff
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop')
options=('!emptydirs' '!lto')
source=("${_pkgname}"::"git+https://github.com/mop-tracker/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=$(git rev-list --count HEAD) -X main.branch=master -X main.commit=$(git rev-parse HEAD) -linkmode=external"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${_pkgname}/mop" "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -D -m644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
