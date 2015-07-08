# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
pkgname=grafana
pkgver=2.0.2
pkgrel=2
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb"
url="http://grafana.org"
arch=('x86_64' 'i686')
license=('APACHE')
depends=(phantomjs)
makedepends=(go nodejs-grunt-cli)
install=${pkgname}.install
backup=("etc/${pkgname}/${pkgname}.ini")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "config.patch"
        "grafana.service")
md5sums=('ac0111eef2e1d3329edfcfe2c6346255'
         'd5691b6e4f0ac0e0aa010801c9870d30'
         '05508c9c21f4c93ad86944a52d37e925')

prepare () {
  cd "${pkgname}-${pkgver}"	
  patch -p1 -i "${srcdir}"/config.patch
}

build() {
  export GOPATH="${srcdir}"/${pkgname}-${pkgver}
  export PATH="$PATH:$GOPATH/bin"
  cd "$GOPATH"
  go run build.go setup
  godep restore
  mkdir -p "$GOPATH/src/github.com/grafana/grafana/"
  ln -s "$GOPATH/pkg" "$GOPATH/src/github.com/grafana/grafana/"
  # build less to css for the frontend 
  npm install
  #grunt
  # build the backend
  # no longer doing package build since this just kicks off rpm/deb builds at the end.
  #go run build.go build package
  go run build.go build
  grunt build
  grunt build-post-process

}

package() {
  install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dsm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm644 tmp/conf/sample.ini "$pkgdir/etc/${pkgname}/${pkgname}.ini"
  install -Dm644 tmp/conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  cp -r tmp/public tmp/vendor "$pkgdir/usr/share/grafana/"
  rm "$pkgdir/usr/share/grafana/vendor/phantomjs/phantomjs"
}

# vim:set ts=2 sw=2 et:
