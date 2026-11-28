# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=slk
pkgver=0.53.0
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
b2sums=('42ed13631301c8ecde91a5679c98fc1c8587ec1275fd735e13b46d7cfa642729de558a24ad8a712aceb5272a4f89258e92c41d925817860aa306a9fcc09626e1')

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
