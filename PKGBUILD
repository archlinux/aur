# Maintainer: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
_pkgname=grafana
_go_arch=$(go version | awk '{gsub("/","-",$NF); print $NF}')
pkgname=${_pkgname}-git
pkgver=v6.0.0.beta1.r3707.g649fa6789e
pkgrel=1
pkgdesc="The tool for beautiful monitoring and metric analytics & dashboards for Graphite, InfluxDB & Prometheus & More"
url="https://grafana.com"
_github_url="https://github.com/grafana/grafana"
arch=('any')
license=('APACHE')
makedepends=('go' 'npm' 'git' 'yarn' 'python2')
provides=('grafana')
options=('!strip' '!emptydirs')
conflicts=('grafana')
install=${_pkgname}.install
source=("git+https://github.com/${_pkgname}/${_pkgname}"
        "grafana.service")
md5sums=('SKIP'
         'bb223073eac39f0ccf9cb8b57fe8d685')

pkgver() {
        cd "${srcdir}/${_pkgname}"
        git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export GOPATH="${srcdir}"
	export PATH="$PATH:$GOPATH"
	mkdir -p "$GOPATH/src/github.com/${_pkgname}/"
	ln -nfs "${srcdir}/grafana" "$GOPATH/src/github.com/${_pkgname}/${_pkgname}"
	cd "$GOPATH/src/github.com/${_pkgname}/${_pkgname}"
        git pull origin master
	go run build.go setup
	go run build.go build
	# Build frontend assets
	yarn install --pure-lockfile --ignore-engines
	npm run build
}

package() {
	install -Dm644 "${srcdir}/grafana.service" "${pkgdir}/usr/lib/systemd/system/grafana.service"
	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/var/lib/grafana"
	install -dm755 "${pkgdir}/var/log/grafana"
	install -Dsm755 bin/${_go_arch}/grafana-server "${pkgdir}/usr/bin/grafana-server"
	install -Dsm755 bin/${_go_arch}/grafana-cli "${pkgdir}/usr/bin/grafana-cli"
	install -Dm644 conf/sample.ini "${pkgdir}/etc/${_pkgname}/${_pkgname}.ini"
	mkdir -p "${pkgdir}/usr/share/grafana"
	cp -r * "${pkgdir}/usr/share/grafana/"
	rm -rf * "${pkgdir}/usr/share/grafana/data"
}
