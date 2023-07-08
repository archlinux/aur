# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-pgbouncer-exporter
pkgver=0.7.0
pkgrel=1
pkgdesc='Prometheus exporter for PgBouncer metrics'
arch=('x86_64')
url='https://github.com/prometheus-community/pgbouncer_exporter'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('pgbouncer: for monitoring a local pgbouncer instance')
options=('!lto')
_commit='d1c70405e5e532ed47048f75bc122a9bb8ed9c9b'
source=("$pkgname::git+$url.git#commit=$_commit"
        'systemd.service'
        'sysusers.conf')
b2sums=('SKIP'
        '68c1e1cde7d13b095681ddbe3a473b07508cbca6b882a43108ccb652a4c7e8d509bb432159d3dfc68b073645178ec204122789529757cdab141de0fed301f274'
        '324a833a5c46446612e21faa29221dbd35dccae309b9373e0431ca96ca59020abec9f3de5fde93c237a0385e754aa0b587d471f7b26c275dbcfe967e68f0ace9')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=main \
    -X github.com/prometheus/common/version.BuildUser=makepkg \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o "build/$pkgname" \
    .
}

package() {
  # systemd files
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
