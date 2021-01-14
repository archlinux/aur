# Maintainer: Pieter Joost van de Sande <pj@born2code.net>
pkgname=owncast
pkgver=0.0.5
pkgrel=1
pkgdesc='Take control over your live stream video by running it yourself. Streaming + chat out of the box.'
url='https://github.com/owncast/owncast'
arch=('any')
license=('MIT')
makedepends=('git')
depends=('go' 'git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6aa1ffdc8ab96374a35817e962fc33c7970ac2572f371df9885247a4e45b542e')

provides=("${pkgname}")

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} -ldflags "-extldflags ${LDFLAGS} -s -w -X main.version=${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: ft=sh ts=2 sw=2 et
