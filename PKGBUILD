# Maintainer: Alyxia Sother <yrkvfbgu2005@tznvy.pbz(rot13)>
_pkgname=impregnate
pkgname="${_pkgname}-git"
pkgver=r66.9a01360
pkgrel=1
pkgdesc="Official installer for Discord client mod 'Cumcord'"
arch=(x86_64 i686)
url="https://github.com/Cumcord/Impregnate"
license=('MIT')
depends=('sdl2')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/Cumcord/Impregnate.git"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            '5b1311ea091fbcab72e81ee454b97a55253c296a8f0979c2da5246454b5287bf')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="${srcdir}/${pkgname}-gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -ldflags=-s -ldflags=-w"
  export CGO_ENABLED=1
  export GO111MODULE=on

  cd "${srcdir}/${pkgname}"
  go get -v
  go build -v
}

package() {
  export GOPATH="${srcdir}/${pkgname}-gopath"
  install -Dm755 "${srcdir}/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
