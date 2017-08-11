# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname='chronograf'
pkgver='1.3.6.0'
pkgrel='1'
pkgdesc='Time-series data visualization tool for InfluxDB'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://influxdata.com/time-series-platform/chronograf/'
license=('AGPL')
conflicts=('chronograf')
provides=('chronograf')
depends=('glibc')
makedepends=('go' 'git' 'make' 'npm' 'yarn' 'nodejs')

prepare() {
        GOPATH=${srcdir}
	/usr/bin/go get -d github.com/influxdata/${pkgname}
}

build() {
	GOPATH=${srcdir}
	PATH="$PATH:$GOPATH/bin"
	/usr/bin/go get -d github.com/influxdata/${pkgname}
	cd "${GOPATH}"/src/github.com/influxdata/${pkgname}
	make
	/usr/bin/go install github.com/influxdata/${pkgname}/cmd/${pkgname}
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 "${srcdir}/src/github.com/influxdata/${pkgname}/etc/scripts/chronograf.service" "${pkgdir}/usr/lib/systemd/system/chronograf.service"
	install -Dm 755 "${srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin"
}
