pkgname=nexttrace
pkgver=1.3.6
pkgrel=2
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/nxtrace/NTrace-core"
license=('GPL-3.0-or-later')
makedepends=('go')
_archive="NTrace-core-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ddfae697445b0e86ddada4c0871f6cd7646f26bb2653b33b09e03becdebe7ced')

build() {
  cd "$_archive"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X 'github.com/nxtrace/NTrace-core/config.Version=${pkgver}' " \
    .
}

package() {
  cd "$_archive"
  install -Dm755 NTrace-core "$pkgdir"/usr/bin/$pkgname
  setcap cap_net_raw,cap_net_admin+eip "$pkgdir"/usr/bin/$pkgname
}
