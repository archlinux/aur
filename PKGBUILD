# Maintainer: goelzma
pkgname=sprec-git
_pkgname=sprec
pkgdesc="Speech recognition tool using Vosk"
pkgrel=1
pkgver=r6.6015527
arch=('any')
url="https://git.sr.ht/~geb/sprec"
license=('GPL-3.0')
depends=('vosk-api')
makedepends=('go' 'scdoc' 'git' 'vosk-api')
provides=("sprec")
conflicts=("sprec")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${_pkgname}"
  go build -ldflags "-X main.Version=${pkgver}" -v
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "examples/sprec_type" "${pkgdir}/usr/bin/sprec_type"
  scdoc < "doc/sprec.1.scd" > "${_pkgname}.1"
  install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
