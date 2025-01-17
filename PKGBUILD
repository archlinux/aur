pkgname=nexttrace
pkgver=1.3.7
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/nxtrace/NTrace-core"
license=('GPL-3.0-or-later')
makedepends=('go')
_archive="NTrace-core-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('94f8893f80b6b0a8d02b2fe709a62557034f3e32879a55807c38cb6ee2f8ab01')

build() {
  cd "$_archive"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X 'github.com/nxtrace/NTrace-core/config.Version=${pkgver}' -checklinkname=0" \
    .
}

package() {
  cd "$_archive"
  install -Dm755 NTrace-core "$pkgdir"/usr/bin/$pkgname
  setcap cap_net_raw,cap_net_admin+eip "$pkgdir"/usr/bin/$pkgname
}
