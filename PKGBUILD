# Maintainer: shulhan <ms@kilabit.info>

pkgname=stackdriver-collectd
pkgver=6.1.3
pkgrel=1

pkgdesc="Stackdriver's monitoring agent based on collectd"
arch=(x86_64)
url='https://github.com/Stackdriver/collectd'
license=('MIT')
groups=()

depends=(
	'curl'
	'iptables'
	'libxml2'
	'lua'
	'systemd-libs'
	'yajl'
)
makedepends=(
	'autoconf'
	'automake'
	'bison'
	'flex'
	'gcc'
	'libtool'
	'pkg-config'
)
optdepends=(
	'mariadb-libs'
)

provides=('stackdriver-collectd')
conflicts=('collectd')

backup=('etc/collectd.conf')
source=(
	"${pkgname}-v${pkgver}.tar.gz::https://github.com/Stackdriver/collectd/archive/${pkgver}.tar.gz"
	"collectd.conf"
	"stackdriver-collectd.service"
	"stackdriver-collectd.sh"
	"Makefile.am.patch"
)
md5sums=(
	'7c21988e0de3c8e002ec43a34d8fab51'
	'7a2c4528d4ff161d7ac665daedc5fb3c'
	'251922321b6d566c8f1750402e4cfd21'
	'e4da9e61c35f6d74d3d76a02eb441ff2'
	'79f4913634ec33585b7b741e7f2e7dcf'
)

prepare() {
	cd collectd-${pkgver}
	patch --forward --strip=1 --input="${srcdir}/Makefile.am.patch"
	./build.sh
}

build() {
    cd collectd-${pkgver}
    ./configure --disable-sensors
    make
}

package() {
    cd collectd-${pkgver}

    # install binaries and libraries
    make DESTDIR="${pkgdir}/" install

    # install license file and documentation
    cd "${srcdir}/collectd-${pkgver}"
    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    cd ${srcdir}
    install -Dm 644 collectd.conf -t "${pkgdir}/opt/collectd/etc/"
    install -Dm 644 stackdriver-collectd.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm 644 stackdriver-collectd.sh -t "${pkgdir}/etc/profile.d/"
}
