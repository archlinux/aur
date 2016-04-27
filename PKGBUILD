# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='telegraf'
pkgver='0.12.1'
pkgrel='1'
epoch=
pkgdesc='Server-level metric gathering agent for InfluxDB'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=()
makedepends=('go' 'godep' 'git')
checkdepends=()
optdepends=()
provides=('telegraf')
conflicts=()
replaces=()
backup=('etc/telegraf/telegraf.conf')
options=()
install="$pkgname.install"
source=("$pkgname.install")
changelog=
noextract=()
md5sums=('SKIP')

prepare()
{
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  export TELEGRAFPATCH="$GOPATH/src/github.com/influxdata/telegraf"
  if [ -d $GOBIN ]; then
    rm -rf $GOBIN;
  fi;

  go get -v github.com/influxdata/telegraf
  cd $TELEGRAFPATCH
  git checkout $pkgver
  go get -v github.com/sparrc/gdm
  $GOBIN/gdm restore
}
build()
{
  echo "Building $pkgname version=${pkgver} ..."
  cd $TELEGRAFPATCH
  go build -o telegraf -ldflags="-X main.Version=$pkgver" cmd/telegraf/telegraf.go
}
package()
{
  # systemctl service file
  install -D -m644  "$TELEGRAFPATCH/scripts/telegraf.service" "$pkgdir/usr/lib/systemd/system/telegraf.service"
  sed -i 's;/etc/opt/telegraf;/etc/telegraf;g' "$pkgdir/usr/lib/systemd/system/telegraf.service"
  sed -i 's;/opt/telegraf;/usr/bin;g' "$pkgdir/usr/lib/systemd/system/telegraf.service"

  # binaries
  install -D -m755 "$TELEGRAFPATCH/telegraf" "$pkgdir/usr/bin/telegraf"

  # configuration file
  mkdir -p "$pkgdir/etc/telegraf"
  mkdir -p "$pkgdir/etc/telegraf.d"
  $TELEGRAFPATCH/telegraf -sample-config > "$pkgdir/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "$TELEGRAFPATCH/LICENSE" "$pkgdir/usr/share/licenses/telegraf/LICENSE"
}
