# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.21
pkgrel=1
pkgdesc="CrowdSec firewall bouncer fetches decisions via the CrowdSec API to add them in a blocklist used by supported firewalls."
arch=('any')
url="https://hub.crowdsec.net/author/crowdsecurity/bouncers/cs-firewall-bouncer"
license=('MIT')
install=${pkgname}.install
source=(
	"$pkgname-source.tgz"::"https://github.com/crowdsecurity/cs-firewall-bouncer/archive/refs/tags/v${pkgver}.tar.gz" 
	"$pkgname.install"
	"install.sh.patch"
	"Makefile.patch"

)
depends=(
	'crowdsec'
)
makedepends=(
	'libnewt'
	'go'
)

provides=(
	'cs-firewall-bouncer'
 	'crowdsec-firewall-bouncer'
)

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	go mod download github.com/mattn/go-sqlite3 ## Needed due to something broken in the make command
	# Patch makefile to support build version
	patch Makefile < ${srcdir}/Makefile.patch
	make -s release 
	cd ${_altpkgname}-${pkgver}
	# Add archlinux to allowed platforms
        patch install.sh < ${srcdir}/install.sh.patch
}

package() {
	mkdir -p ${pkgdir}/var/lib/crowdsec/installers/${pkgname}
	cp -R ${srcdir}/${pkgname}-${pkgver}/${_altpkgname}-${pkgver}/* ${pkgdir}/var/lib/crowdsec/installers/${pkgname}
}
sha256sums=('c92e02085c4c8481009a46ba80374329d102a45933fd0fd2164901954331923e'
            'f68cba127a9db82f2ee1f36a47bd8076d2192b925982da03339f75b53601e326'
            '7639c8b37eeb2bc14c3814579f20fb2e23975f44e3e3ea32426d29975776b742'
            'a28a3cfbe9c0cf540a7fb1ca05e7dae2c71a3be98f4a4a2392676a0587588890')
