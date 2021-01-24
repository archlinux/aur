# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Nils Czernia <nils@czserver.de>

pkgname=prometheus-postgresql-exporter
pkgver=0.8.0
pkgrel=3
pkgdesc="Prometheus exporter for PostrgreSQL"
arch=('x86_64')
url="https://github.com/wrouesnel/postgres_exporter"
license=('Apache')
makedepends=('git' 'go')
backup=('etc/conf.d/prometheus-postgresql-exporter')
source=("https://github.com/wrouesnel/postgres_exporter/archive/v${pkgver}.tar.gz"
	"prometheus-postgresql-exporter.service"
	"prometheus-postgresql-exporter.conf")
sha256sums=('27877c9b3aa751c7c1265f39986218f6a2c2b66a126cf348c6cc2f20f5201b02'
	'5eac41333fb12db676fed18c02156cfdefee957154241b4c724718fd40d23212'
	'5436ad34fbcd6faab69da8675631f3eb5b89d964682eb23164bf4bb816ad1897')

prepare() {
	cd "postgres_exporter-${pkgver}"

	export GOPATH="${srcdir}/gopath"
	mkdir -p "${GOPATH}/src/github.com/wrouesnel"
	ln -snf "${srcdir}/postgres_exporter-${pkgver}" "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
}

build() {
	export GOPATH="${srcdir}/gopath"
	cd "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
	go run mage.go binary
}

check() {
	export GOPATH="${srcdir}/gopath"
	cd "${GOPATH}/src/github.com/wrouesnel/postgres_exporter"
	go run mage.go test
}

package() {
	install -Dm644 "prometheus-postgresql-exporter.service" \
	"${pkgdir}/usr/lib/systemd/system/prometheus-postgresql-exporter.service"
	install -Dm644 "prometheus-postgresql-exporter.conf" \
	"${pkgdir}/etc/conf.d/prometheus-postgresql-exporter"

	cd "postgres_exporter-${pkgver}"
	install -Dm755 "postgres_exporter" "${pkgdir}/usr/bin/prometheus_postgresql_exporter"
}
