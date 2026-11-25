# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=slk
pkgver=0.48.0
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
b2sums=('c94583b1f658b5f778f652cc93152950ae2bb514a97cc0b8c0a1e66fcd0286a960d7da2e4924c3ff25b116d9b9917b4d91a053414bd68a3a013dd674ff7ba776')

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
