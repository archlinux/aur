# Maintainer: Javier Tia <floss@jetm.me>
_pkgauthor=chojs23
_pkgname=ec
pkgname=easy-conflict
pkgver=0.1.3
pkgrel=1
pkgdesc='Terminal-native Git mergetool with 3-pane IntelliJ-like conflict resolver'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
options=(!lto)
license=('MIT')
depends=('git')
makedepends=('go')
provides=('ec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c4cca328cc9d181f168ea6d95caa649e1f05b5c750b78de22f9e17488ccb40c3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -ldflags "-s -w -X main.version=${pkgver}" -o ${_pkgname} ./cmd/${_pkgname}
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ft=PKGBUILD ts=2 sw=2 et:
