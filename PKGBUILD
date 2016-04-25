# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributer: Justin Dray <justin@dray.be>

pkgname='chronograf'
pkgver='0.12.0'
pkgrel='2'
epoch=
pkgdesc='A new data visualization tool for InfluxDB'
arch=('x86_64')
url='http://influxdb.org/chronograf'
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/chronograf.toml')
options=()
install="$pkgname.install"
pkgtar="v${pkgver}.tar.gz"
source=("https://s3.amazonaws.com/get.influxdb.org/chronograf/chronograf_${pkgver}_amd64.deb"
        "$pkgname.install"
        "$pkgname.service"
		  "LICENSE")
md5sums=('3392f10416e43ae818d1fda2f83e3514'
         '5eeadbb9b80534dcf87ce3a9131ab75e'
         '396feb4648ea8447c3d69bc97a80b9be'
         '51c3bce403f0005b9ef91ab20cc00964')
changelog=
noextract=()

prepare() {
	bsdtar xf data.tar.gz

	sed -i 's|/opt/|/var/lib/|g' "$srcdir/opt/chronograf/config.toml"
}

package() {
	# systemctl service file
	install -D -m644  "$srcdir/chronograf.service" "$pkgdir/usr/lib/systemd/system/chronograf.service"

	# binary
	install -D -m755 "$srcdir/opt/chronograf/chronograf" "$pkgdir/usr/bin/chronograf"

	# configuration file
	install -D -m644 "$srcdir/opt/chronograf/config.toml" "$pkgdir/etc/chronograf.toml"

	# license file
	install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
