pkgname=nexttrace
pkgver=1.5.0
pkgrel=1
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url="https://github.com/nxtrace/NTrace-core"
license=('GPL-3.0-or-later')
makedepends=('go')
_archive="NTrace-core-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6def8e05d0311aa864e6faf99884ae408fa4c2705232671c334224fa0e34cd3b')

build() {
  cd "$_archive"
  BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' -X 'github.com/nxtrace/NTrace-core/config.Version=${pkgver}' -X 'github.com/nxtrace/NTrace-core/config.BuildDate=${BUILD_DATE}' -checklinkname=0" \
    .
}

package() {
  cd "$_archive"
  install -Dm755 NTrace-core "$pkgdir"/usr/bin/$pkgname
  setcap cap_net_raw,cap_net_admin+eip "$pkgdir"/usr/bin/$pkgname
}
