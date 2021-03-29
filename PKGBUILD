# Maintainer: sseneca <me at ssene dot ca>

pkgname=jellycli
pkgver=0.9.1
pkgrel=1
pkgdesc="Terminal music player for Jellyfin."
arch=('x86_64')
url='https://github.com/tryffel/jellycli'
conflicts=("${pkgname}-bin" "${pkgname}-git")
license=('GPL3')
makedepends=('go' 'git')
depends=('glibc' 'alsa-lib')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1fab0b8376a3d45f3b4fb07fdeadd557860422a177c2a95f5dfa892612465238f93d3e5a2ff194b3baec57efdce6dd16db306e7ac68c88cef693bf27fe3efb03')

build() {
  cd "$pkgname-$pkgver"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
