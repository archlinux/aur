# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=influxdb1
_pkgname=influxdb
pkgver=1.12.1
pkgrel=1
pkgdesc='Influx 1.x branch for everyone who is too lazy to upgrade'
arch=('x86_64')
url='https://github.com/InfluxData/influxdb'
license=('MIT')
conflicts=('influxdb')
makedepends=('asciidoc' 'xmlto' 'go' 'go-tools' 'git' 'protobuf' 'yarn'
             'cargo' 'clang' 'llvm')
backup=('etc/influxdb/influxdb.conf')
source=("git+https://github.com/influxdata/influxdb.git#tag=v${pkgver}"
        "influxdb.service")

build(){
  cd "$_pkgname"
  export PKG_CONFIG=$(git rev-parse --show-toplevel)/pkg-config.sh
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  export GOPATH=$startdir/go

  go install \
    -ldflags="-X main.version=${pkgver} \
              -X main.branch=v${pkgver} \
              -X main.commit=$(git rev-parse --short HEAD)" \
    ./...

  cd man
  make
}

package(){
  cd "$_pkgname"
  install -Dm644 ../influxdb.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm755 $startdir/go/bin/influxd -t "$pkgdir/usr/bin"
  install -Dm755 $startdir/go/bin/influx -t "$pkgdir/usr/bin"
  install -Dm755 $startdir/go/bin/influx_tools -t "$pkgdir/usr/bin"
  install -Dm755 $startdir/go/bin/influx_inspect -t "$pkgdir/usr/bin"
  install -Dm755 etc/config.sample.toml "$pkgdir/etc/influxdb/influxdb.conf"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/influxdb"

  install -Dm0644 man/*.1 -t "$pkgdir"/usr/share/man/man1
}
sha256sums=('85dfe38451b2b021cc28b5986a625c63bea89201de373e18af333611ec1adad4'
            'ada0d13107cd863bb3d516dc00b9fa33c41715244e3aea88d215f5191204ba6b')
