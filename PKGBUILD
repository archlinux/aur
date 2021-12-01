# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.17
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
sha256sums=('53af239b86c6b554da3711e3686d7d3036d33b2e561bfb00e195b6c8a06918c8'
            'f68cba127a9db82f2ee1f36a47bd8076d2192b925982da03339f75b53601e326'
            '7639c8b37eeb2bc14c3814579f20fb2e23975f44e3e3ea32426d29975776b742'
            'b5007048a796fd59ec70f290cdac17e602e18aefa35de90cadab012e4a9b09d6')
