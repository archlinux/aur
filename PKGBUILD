# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=git-chglog
pkgver=0.10.0
pkgrel=1
pkgdesc='git CHANGELOG generator'
url="https://github.com/git-chglog/git-chglog"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/git-chglog/git-chglog/archive/v${pkgver}.tar.gz)
sha512sums=('675f40babb0784bebabbfb39dc292189becb5b712bffd89ddc019c29d485de4bd1ac811fb86cc96db3a665080a18c732b2ea4e8860009bb10727f29ed197d1db')

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
