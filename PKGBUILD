# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=slk
pkgver=0.37.0
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
b2sums=('0090ea0bf07106f11a610ddc65d76f04b1c4be28c2ed78a3e32b1f03160aedd4bb9a09d828aeef372a82625e2f7c48776498456e5b404ace9edae8e7c4611bf0')

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
