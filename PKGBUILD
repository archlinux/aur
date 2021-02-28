# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=mop
pkgname=${_pkgname}-git
pkgver=195.570a5d6
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
source=("${_pkgname}"::"git+https://github.com/mop-tracker/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  go mod init github.com/mop-tracker/${_pkgname}
  go mod tidy
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=$(git rev-list --count HEAD) -X main.branch=master -X main.commit=$(git rev-parse HEAD) -extldflags ${LDFLAGS}"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${_pkgname}/mop" "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${_pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
