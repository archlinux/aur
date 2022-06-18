# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-ssl-exporter
_pkgname=ssl_exporter
pkgver=2.4.1
pkgrel=1
pkgdesc='Prometheus exporter for TLS certificates'
arch=('x86_64')
url='https://github.com/ribbybibby/ssl_exporter'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
_commit='52fb44781ccdab47811b9873afc37c73cd18ab8f'
source=("git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^[vV]//;s/-/+/g'
}

prepare() {
  cd "$_pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$_pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly\
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$(git rev-parse HEAD) \
    -X github.com/prometheus/common/version.Branch=$(git describe --all --contains --dirty HEAD) \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build ./...
}

check() {
  cd "$_pkgname"
  go test -v ./...
}

package() {
  cd "$_pkgname"

  # binary
  install -vDm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
