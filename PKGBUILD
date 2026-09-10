# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=slk
pkgver=0.18.0
pkgrel=1
pkgdesc=' A blazingly fast Slack TUI '
arch=(x86_64)
url='https://github.com/gammons/slk'
license=(MIT)
depends=(
  glibc
)
makedepends=(
  git
  go
)
source=(git+$url#tag=v$pkgver)
b2sums=('12f5e697032d42af405d34fe2f8f43fd8d0c4c4dc784e7b7f9ad7ced44fc56609e33f6d358bd9ff4c9cc1b7df87e18d2d300e662015d2513ef01fe1f062b3222')

prepare(){
  cd ${pkgname}
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd ${pkgname}
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/slk
}

package() {
  cd ${pkgname}
  install -Dm755 slk "${pkgdir}"/usr/bin/slk
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ LICENSE
}
