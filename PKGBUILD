# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>

pkgname='telegraf'
pkgver='0.1.7'
pkgrel='1'
epoch=
pkgdesc='Server-level metric gathering agent for InfluxDB'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=('telegraf')
conflicts=()
replaces=()
backup=('etc/telegraf.conf')
options=()
install="$pkgname.install"
source=("$pkgname.service"
        "$pkgname.install")
changelog=
noextract=()
md5sums=('SKIP'
         'SKIP')

prepare()
{ 
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"
  if [ -d $GOBIN ]; then
    rm $GOBIN/*;
  fi;

  echo "Downloading $pkgname ..."
  go get github.com/influxdb/telegraf
}
build() 
{
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"

  echo "Building $pkgname ..."
  cd "$GOPATH/src/github.com/influxdb/telegraf"
  make
}
package()
{
  export GOPATH="${srcdir}"
  export GOBIN="$GOPATH/bin"

  # systemctl service file
  install -D -m644  "$srcdir/telegraf.service" "$pkgdir/usr/lib/systemd/system/telegraf.service"

  # binaries
  install -D -m755 "$GOPATH/src/github.com/influxdb/telegraf/telegraf" "$pkgdir/usr/bin/telegraf"

  # configuration file
  mkdir -p "$pkgdir/etc"
  $GOPATH/src/github.com/influxdb/telegraf/telegraf -sample-config > $pkgdir/etc/telegraf.conf

  # license
  install -Dm644 "$GOPATH/src/github.com/influxdb/telegraf/LICENSE" "$pkgdir/usr/share/licenses/telegraf/LICENSE"
}
