# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.22
pkgrel=4
pkgdesc="CrowdSec firewall bouncer fetches decisions via the CrowdSec API to add them in a blocklist used by supported firewalls."
arch=('any')
url="https://hub.crowdsec.net/author/crowdsecurity/bouncers/cs-firewall-bouncer"
license=('MIT')
install=${pkgname}.install
source=(
	"$pkgname-${pkgver}-source.tgz"::"https://github.com/crowdsecurity/cs-firewall-bouncer/archive/refs/tags/v${pkgver}.tar.gz" 
	"$pkgname.install"
	"install.sh.patch"

)
depends=(
	'crowdsec'
	'iptables'
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
	sed -Ei "s/(BUILD_VERSION\?=\")[^\"]+(\")/\1${pkgver}\2/" Makefile
	make -s release 
	cd ${_altpkgname}-${pkgver}
	# Add archlinux to allowed platforms
        patch install.sh < ${srcdir}/install.sh.patch
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/${pkgname}
	cp -R ${srcdir}/${pkgname}-${pkgver}/${_altpkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/${pkgname}
}
sha256sums=('c9b6026216b1d7f76b7302c88d7491fe4bf9922cd931f37a052dcb17bcf77992'
            '3c106b8d517372841f9f5b27c7c14121140e5483061a0126bcd425c8497ad8b0'
            '7639c8b37eeb2bc14c3814579f20fb2e23975f44e3e3ea32426d29975776b742')
