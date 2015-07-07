# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname='influxdb'
_gitname='influxdb'
pkgver='0.9.0'
pkgrel='1'
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=()
makedepends=('autoconf' 'protobuf' 'bison' 'flex' 'go' 'gawk' 'mercurial' 'git' 'collectd')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb.conf')
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
  export GOPATH=${srcdir}
  gitsrc=${srcdir}/src/github.com/influxdb

  if [ ! -d "${gitsrc}" ]; then 
    # clone influxdb git repo
    mkdir -p ${gitsrc};
    cd ${gitsrc};
    echo "Cloning influxdb git repo ..."
    git clone -q https://github.com/influxdb/influxdb;

  else 
    echo "Git repository already cloned, skipping"
  fi;

  # checkout wanted version
  cd ${gitsrc};
  echo "Switching to ${pkgver} branch ..."
  cd ${gitsrc}/influxdb
  git checkout -q "v${pkgver}"
  commit=`git rev-parse HEAD`
}
build() 
{
  if [ -d ${srcdir}/bin ]; then
    rm ${srcdir}/bin/*;
  fi;

  echo "Building deps ..."
  cd ${gitsrc}
  go get -u -f ./...
  go build ./...

  echo "Building influxdb ${pkgver} (commit ${commit}) ..."
  cd ${gitsrc}
  go install -a -ldflags="-X main.version $pkgver -X main.commit $commit" ./...

}
package()
{
  gitsrc=${srcdir}/src/github.com/influxdb

  # systemctl service file
  cd ${srcdir}
  install -D -m644  'influxdb.service' "$pkgdir/usr/lib/systemd/system/influxdb.service"

  # binaries
  cd ${srcdir}/bin
  install -D -m755 influxd "$pkgdir/usr/bin/influxd"
  install -D -m755 influx "$pkgdir/usr/bin/influx"

  # configuration file
  cd ${gitsrc}/influxdb
  install -D -m644 etc/config.sample.toml "${pkgdir}/etc/influxdb.conf"
  sed -i 's;/var/opt/;/var/lib/;g' ${pkgdir}/etc/influxdb.conf

  # license
  cd ${gitsrc}/influxdb
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/influxdb/LICENSE"
}
