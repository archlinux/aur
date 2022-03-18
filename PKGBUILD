# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.23
pkgrel=1
pkgdesc="Use the CrowdSec API to create a dynamic blocklist used by supported firewalls."
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
	'ipset'
)
optdepends=(
	'iptables: Linux kernel packet control tool'
	'nftables: netfilter tables userspace tools'
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
	sed -Ei "s/(BUILD_TAG\?=\")[^\"]+(\")/\1arch\2/" Makefile
	make -s release 
	cd ${_altpkgname}-${pkgver}
	# Add archlinux to allowed platforms
        patch install.sh < ${srcdir}/install.sh.patch
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/${pkgname}
	cp -R ${srcdir}/${pkgname}-${pkgver}/${_altpkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/${pkgname}
}
sha256sums=('303c202e8877af7cf72eb59e67ad206547e71965b8b23d478f1ee2291f4a0190'
            'c312a49e55b9fc1d4c5f70db9e666695e2db18d848191d5c714a93020b290dc9'
            '7639c8b37eeb2bc14c3814579f20fb2e23975f44e3e3ea32426d29975776b742')
