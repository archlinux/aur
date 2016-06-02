# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributer: Justin Dray <justin@dray.be>

pkgname='chronograf'
pkgver='0.13.0'
pkgrel='1'
pkgdesc='Time-series data visualization tool for InfluxDB'
arch=('x86_64')
url='https://influxdata.com/time-series-platform/chronograf/'
license=('unknown')
backup=('etc/chronograf.toml')
install="${pkgname}.install"
source=("https://dl.influxdata.com/chronograf/releases/chronograf_${pkgver}_amd64.deb"
        "${pkgname}.install"
        "${pkgname}.service"
        "LICENSE")
sha1sums=('ee114b1ff5b3c8eca12963dd2988232ba9e146f3'
          '9b12bdd944bc6b62f74bc911a0b0fecf52b2aced'
          'ef155872a161cf8c5cb07a38e10bd58069e6daab'
          '58d4131a7c2b90d9187eabf469f96e438bbeeaa7')

prepare() {
	bsdtar xf data.tar.gz
	sed -i 's|/opt/|/var/lib/|g' "${srcdir}/opt/chronograf/config.toml"
}

package() {
	# systemctl service file
	install -D -m644  "${srcdir}/chronograf.service" "${pkgdir}/usr/lib/systemd/system/chronograf.service"

	# binary
	install -D -m755 "${srcdir}/opt/chronograf/chronograf" "${pkgdir}/usr/bin/chronograf"

	# configuration file
	install -D -m644 "${srcdir}/opt/chronograf/config.toml" "${pkgdir}/etc/chronograf.toml"
}
