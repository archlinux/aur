# Maintainer: Daniel Milde <daniel at milde dot cz>
# Co-maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>

pkgname=gdu
pkgver=5.0.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu-git gdu-bin)
depends=('glibc')
makedepends=('go' 'pandoc')
arch=('x86_64')
url="https://github.com/dundee/gdu"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('bb0f430f3c9007a39f402c143ff3b0cbb4b425ffc794d02ca20241afb452e2f3')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p dist/
}

build() {
  cd "$pkgname-$pkgver"
  local _BUILDINFO="-X 'github.com/dundee/gdu/v5/build.Version=${pkgver}' \
                    -X 'github.com/dundee/gdu/v5/build.User=${PACKAGER}' \
                    -X 'github.com/dundee/gdu/v5/build.Time=$(date)'"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" ${_BUILDINFO}" \
    -o dist/gdu \
    github.com/dundee/gdu/v5/cmd/gdu
  pandoc gdu.1.md -s -t man > dist/gdu.1
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 dist/$pkgname "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 dist/gdu.1    "${pkgdir}/usr/share/man/man1/$pkgname.1"
  install -D -m644 LICENSE.md  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
