# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=git-chglog
pkgver=0.14.2
pkgrel=1
pkgdesc='git CHANGELOG generator'
url="https://github.com/git-chglog/git-chglog"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/git-chglog/git-chglog/archive/v${pkgver}.tar.gz)
sha512sums=('f50c51339a109bb3c184e23840c634a00654ec210add808572e0533a012950444093804a0faa9241d5a0a696ffd06ecd3b197c4013168bf7611f55a4ea112f6e')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} ./cmd/git-chglog
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
