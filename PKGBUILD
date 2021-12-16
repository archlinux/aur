# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.19
pkgrel=8
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
sha256sums=('12e67a912da8f47486130eb0aff11a658cb0c728ae5641fbde692703bb217a4c'
            'f68cba127a9db82f2ee1f36a47bd8076d2192b925982da03339f75b53601e326'
            '7639c8b37eeb2bc14c3814579f20fb2e23975f44e3e3ea32426d29975776b742'
            '9d88499a1502a82c98ab8bbf8bfa6c9018b45c7529e94064da177744c1535764')
