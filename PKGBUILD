# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='1.5.3'
pkgrel='1'
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/InfluxData/influxdb'
license=('MIT')
makedepends=('go' 'git' 'asciidoc' 'xmlto')
provides=('influxdb')
backup=('etc/influxdb/influxdb.conf')
install='influxdb.install'
source=("git+https://github.com/influxdata/influxdb#tag=v$pkgver"
        "influxdb.sysusers"
        "influxdb.tmpfiles")
sha256sums=('SKIP'
            '809cca823ae3027984bc7ace70db75753d7d0d4f6658a36db9d94a33054ca5e9'
            'e2aa59413a6204737383b86cedefd866d7073f56ace5b89aad38c530cc86e60c')
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  cp -af "$srcdir/influxdb" "$GOPATH/src/github.com/influxdata/"

  cd "$GOPATH/src/github.com/influxdata/influxdb"

  echo "Downloading dependencies"
  go get github.com/sparrc/gdm
  gdm restore

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building $pkgname version=$version commit=$revision branch=master"
  _LDFLAGS="-X main.version=$version -X main.commit=$revision -X main.branch=master"
  go install -ldflags="$_LDFLAGS" ./...

  echo "Building man pages"
  cd man/
  make
}

package()
{
  cd "$srcdir"
  install -Dm644 influxdb.sysusers "$pkgdir/usr/lib/sysusers.d/influxdb.conf"
  install -Dm644 influxdb.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/influxdb.conf"

  cd "$GOBIN"
  install -d "$pkgdir/usr/bin/"
  install -Dsm755 influxd        "$pkgdir/usr/bin/"
  install -Dsm755 influx         "$pkgdir/usr/bin/"
  install -Dsm755 influx_tsm     "$pkgdir/usr/bin/"
  install -Dsm755 influx_stress  "$pkgdir/usr/bin/"
  install -Dsm755 influx_inspect "$pkgdir/usr/bin/"

  cd "$GOPATH/src/github.com/influxdata/influxdb"
  install -Dm644 scripts/influxdb.service "$pkgdir/usr/lib/systemd/system/influxdb.service"
  install -Dm644 etc/config.sample.toml   "$pkgdir/etc/influxdb/influxdb.conf"
  install -Dm644 LICENSE                  "$pkgdir/usr/share/licenses/influxdb/LICENSE"

  # Install man pages
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 man/*.1 "$pkgdir/usr/share/man/man1/"
}
