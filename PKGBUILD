# Maintainer: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
_pkgname=grafana
pkgname=${_pkgname}-git
pkgver=v4.0.2.r283.g830bf5a
pkgrel=2
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb"
url="http://grafana.org"
arch=('x86_64' 'i686')
license=('APACHE')
makedepends=('go' 'nodejs-grunt-cli' 'npm')
provides=('grafana')
options=('!strip' '!emptydirs')
conflicts=('grafana')
install=${_pkgname}.install
source=("git+https://github.com/${_pkgname}/${_pkgname}"
        "grafana.service")
md5sums=('SKIP'
         'bb223073eac39f0ccf9cb8b57fe8d685')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	export GOPATH="${srcdir}"
	export PATH="$PATH:$GOPATH"
	mkdir -p "$GOPATH/src/github.com/${_pkgname}/"
	ln -nfs "${srcdir}/grafana" "$GOPATH/src/github.com/${_pkgname}/${_pkgname}"
	cd "$GOPATH/src/github.com/${_pkgname}/${_pkgname}"
	go run build.go setup
	go run build.go build
	# Build frontend assets
	npm install
	npm run build
}

package() {
	install -Dm644 "${srcdir}/grafana.service" "${pkgdir}/usr/lib/systemd/system/grafana.service"
	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/var/lib/grafana"
	install -dm755 "${pkgdir}/var/log/grafana"
	install -Dsm755 bin/grafana-server "${pkgdir}/usr/bin/grafana-server"
	install -Dsm755 bin/grafana-cli "${pkgdir}/usr/bin/grafana-cli"
	install -Dm644 conf/sample.ini "${pkgdir}/etc/${_pkgname}/${_pkgname}.ini"
	mkdir -p "${pkgdir}/usr/share/grafana"
	cp -r * "${pkgdir}/usr/share/grafana/"
	rm -rf * "${pkgdir}/usr/share/grafana/data"
}
