# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Maintainer: Adam S Levy <adam@aslevy.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='kapacitor'
_gitname='kapacitor'
pkgver='1.5.1'
pkgrel='1'
pkgdesc='Open source framework for processing, monitoring, and alerting on time series data'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/InfluxData/kapacitor'
license=('MIT')
provides=('kapacitor' 'tickfmt')
makedepends=('go' 'git')
provides=('kapacitor')
backup=('etc/kapacitor/kapacitor.conf')
install='kapacitor.install'
source=("git+https://github.com/influxdata/kapacitor#tag=v$pkgver"
        "kapacitor.install"
        "kapacitor.sysusers"
        "kapacitor.tmpfiles")
sha256sums=('SKIP'
            'f2db9b53ee3f36f7011f9fa6dec80c582434db636b3645f8803f11b93873c380'
            '0110debb39c33b7eb6b8260d70f33dacb4f22028e902dcb9099e6cacc9990294'
            'f1d375eed50a1218b1fb0e94f831737688bc2d1aea8dc0152eb11cb2c7e24f2e')
build()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOBIN:$PATH"
  mkdir -p "$GOPATH/src/github.com/influxdata"
  ln -sf "$srcdir/kapacitor" "$GOPATH/src/github.com/influxdata/kapacitor"

  cd "$GOPATH/src/github.com/influxdata/kapacitor"

  revision=`git rev-parse HEAD`
  version=`git describe --tags`
  echo "Building kapacitor version=$version commit=$revision branch=master"
  go install -ldflags="-X main.version=$version -X main.commit=$revision -X main.branch=master" ./cmd/... ./tick/cmd/...
}
package()
{
  cd $srcdir
  install -Dm644 kapacitor.sysusers "$pkgdir/usr/lib/sysusers.d/kapacitor.conf"
  install -Dm644 kapacitor.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kapacitor.conf"

  cd $GOBIN
  install -Dsm755 kapacitord "$pkgdir/usr/bin/kapacitord"
  install -Dsm755 kapacitor  "$pkgdir/usr/bin/kapacitor"
  install -Dsm755 tickfmt    "$pkgdir/usr/bin/"
  install -Dsm755 tickdoc    "$pkgdir/usr/bin/"

  cd "$GOPATH/src/github.com/influxdata/kapacitor"
  install -Dm644 scripts/kapacitor.service "$pkgdir/usr/lib/systemd/system/kapacitor.service"
  install -Dm644 etc/kapacitor/kapacitor.conf "$pkgdir/etc/kapacitor/kapacitor.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/kapacitor/LICENSE"
  completions=usr/share/bash-completion/completions/kapacitor
  install -Dm644 $completions "$pkgdir/$completions"
}
