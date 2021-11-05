# Maintainer: shulhan <ms@kilabit.info>

pkgname=stackdriver-collectd
pkgver=6.1.4
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

backup=('opt/collectd/etc/collectd.conf')
source=(
	"${pkgname}-v${pkgver}.tar.gz::https://github.com/Stackdriver/collectd/archive/${pkgver}.tar.gz"
	"collectd.conf"
	"stackdriver-collectd.service"
	"stackdriver-collectd.sh"
	"Makefile.am.patch"
)
md5sums=(
	'9e52721f665f636765a6f4dee00109b5'
	'7a2c4528d4ff161d7ac665daedc5fb3c'
	'8b5e44065504669e4ec0eff9fb1484f4'
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
	./configure --prefix=/opt/collectd --exec-prefix=/opt/collectd \
		--disable-sensors
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
