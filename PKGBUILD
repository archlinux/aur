# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-bind-exporter
_pkgname=bind_exporter
pkgver=0.8.0
pkgrel=1
pkgdesc='Prometheus exporter for BIND metrics'
arch=('x86_64')
url='https://github.com/prometheus-community/bind_exporter'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
optdepends=('bind: for monitoring a local BIND server')
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
sha512sums=('2b54ceed99ad386d699961a821bd0f1061f487536029cfa5dd1192c9cb6fc485bbf4a82548c8dcd70c602e7e38e905cbe24968649923eede77be7dc7aaf05cc6'
            '8c22cfadddd8820258e02f53253de78cc1707f6220da13f36e682b79d58a3b59ef615b3f0c74ced01bcb6afb19c35414821575d265227512f5192182aca2d042'
            '143591ed6c2550085a2ab5c292aa57a6ab047826158270c630acaf1dd1afc9e3cbccb612f0b684206832c8d641eb432bf4f474dd07b9dc744cfd7174d320b552')
b2sums=('d6a1ecf0cd42509aac8f8755c55f9a405d549a4de60ae45ebdf9933b0be73986e24fbffd3b255445c4121ca762e672e76d0629910c6e116e245136ba16e436b5'
        '83ac2fb9b39f10f9eb130fc566887a5dc70447265d9d567221ceccf83a9fe7ad8035dfa751ecefe9681c64fd8ddb260b3e370f956350b9cab699eed507d9affc'
        '739b1e4e7ab277096d0875ed14d61f223e7b990e7081721e4638aebad9c3beccc270ce9944384784af8eab035dbb34a86badae687c065291bfb384abfb42573a')

prepare() {
  cd "$_pkgname-$pkgver"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$_pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags '${LDFLAGS}' \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build .
}

#check() {
#  cd "$_pkgname-$pkgver"
#  go test ./...
#}

package() {
  # systemd integration
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "$_pkgname-$pkgver/build/$_pkgname"
}
