# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=clawea
pkgver=1.2.1
pkgrel=1
pkgdesc="Weather forecast TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/cladamos/clawea"
license=('MIT')
depends=('glibc')
makedepends=('go')
_licrev=5b730dc3a08bbe8b3b28a9a3f655551a53769187
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}-LICENSE::https://raw.githubusercontent.com/cladamos/clawea/${_licrev}/LICENSE")
sha256sums=('939e15ba6bc99c42ceb280e487596f58a4c12967bdb9c8c7d4910439a7a40df4'
            'b3664abc7d73b310106cb3953497d74144a9a19524988d267f93101585dabd1b')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "clawea-${pkgver}"
  _goenv
  go mod download
}

build() {
  cd "clawea-${pkgver}"
  _goenv
  go build -ldflags "-linkmode=external" -o "build/clawea" .
}

check() {
  cd "clawea-${pkgver}"
  _goenv
  go test -short ./...
}

package() {
  cd "clawea-${pkgver}"
  install -Dm755 "build/clawea" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
