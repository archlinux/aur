# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=slk
pkgver=0.40.0
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
b2sums=('4e6725b49408f519119b0747e29b0dcbc9fb7460dd579736da7c5d9b3090417158de5d0a2231ce8058a9e9fe8c96148db489e3f28b1bfc05192eed897b34d0e8')

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
