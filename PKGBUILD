# Maintainer: ml <ml@visu.li>
pkgname=spruce
pkgver=1.26.0
pkgrel=1
pkgdesc='A BOSH template merge tool'
arch=('x86_64')
url='https://github.com/geofffranks/spruce'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04a301ad75704f480ddc8d0da5b150b46a82a8ad254e187cc2248a613336a81c')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build -ldflags "-X=main.Version=${pkgver}" ./cmd/spruce
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm755 doc/* -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples -t "$pkgdir/usr/share/doc/$pkgname"
}
