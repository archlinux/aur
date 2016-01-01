# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana
pkgver=2.6.0
pkgrel=1
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb"
url="http://grafana.org"
arch=('x86_64' 'i686')
license=('APACHE')
depends=()
makedepends=(git go godep nodejs-grunt-cli npm phantomjs)
install=${pkgname}.install
backup=("etc/${pkgname}/${pkgname}.ini")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "config.patch"
        "grafana.service")
md5sums=('f143f0e1b4d49d3472057370fc7d90d8'
         'f676cfe7bdd2463e2600ff8fce75a2d6'
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

	 # Build frontend assets
	 npm install
	 # Install phantomjs in this directory as well for some reason. Can be removed after next patch: https://github.com/grafana/grafana/issues/2999
	 cd node_modules/karma-phantomjs-launcher
	 npm install
	 cd "$GOPATH"
	 grunt
	 grunt build
	 grunt build-post-process

	 # build the backend
	 # no longer doing package build since this just kicks off rpm/deb builds at the end.
	 #go run build.go build package
	 go run build.go build
 }

 package() {
	 install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
	 cd "${srcdir}/${pkgname}-${pkgver}"
	 install -dm755 "${pkgdir}/var/lib/grafana"
	 install -dm755 "${pkgdir}/var/log/grafana"
	 install -Dsm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
	 install -Dm644 conf/sample.ini "$pkgdir/etc/${pkgname}/${pkgname}.ini"
	 install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
	 cp -r vendor "$pkgdir/usr/share/grafana/"
	 cp -r public_gen "$pkgdir/usr/share/grafana/public"
 }
