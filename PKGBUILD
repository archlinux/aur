# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>

pkgname=grafana
pkgver=2.6.0
pkgrel=2
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb"
url="http://grafana.org"
arch=('x86_64' 'i686' 'armv5h' 'armv6h' 'armv7h')
license=('APACHE')
depends=()
makedepends=("git" "go" "godep" "nodejs-grunt-cli" "npm" "phantomjs")
install=${pkgname}.install
backup=("etc/${pkgname}/${pkgname}.ini")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "config.patch"
        "grafana.service")
sha512sums=('1690e690fceb3107fc9f88b9da732a6ebea43e404c94afa12fab5c186c06161f09bb3f93ca7f6dee15ac1129baca8c40fd822a090178b468cae2fa0e062ef267'
            'e2359ecbc64ba6e54a261101f9fdf05f364a9df4fe60ba6658f3cf75ea86b80da7b159d4f9e7e3f8f8b64a5d89b36daa6024b82e3ca2097177670838868caedb'
            '2fdb8eda4671a81cc7674f471a20f37cd2078123838a80c3906777da3b6a8602caf5bcb65a23038a67b70f556d43cd8db7982a8dc7f3ee317ce1634e4c7409f7')

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
