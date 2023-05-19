# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.27
pkgrel=7
_gitpkgrel=0.0.27
pkgdesc="Use the CrowdSec API to create a dynamic blocklist used by supported firewalls."
arch=('any')
url="https://hub.crowdsec.net/author/crowdsecurity/bouncers/cs-firewall-bouncer"
license=('MIT')
install=${pkgname}.install
source=(
	"$pkgname-${pkgver}-source.tgz"::"https://github.com/crowdsecurity/cs-firewall-bouncer/archive/refs/tags/v${_gitpkgrel}.tar.gz" 
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
	cd "${srcdir}/${pkgname}-${_gitpkgrel}"
	go mod download github.com/mattn/go-sqlite3 ## Needed due to something broken in the make command
	# Patch makefile to support build version
	# sed -Ei "s/(BUILD_VERSION\?=\")[^\"]+(\")/\1${_gitpkgrel}\2/" Makefile
	# sed -Ei "s/(BUILD_TAG\?=\")[^\"]+(\")/\1arch\2/" Makefile
	sed -Ei "s/^BUILD_TAG.*$/BUILD_TAG=arch/" Makefile           
	sed -Ei "s/^BUILD_VERSION.*$/BUILD_VERSION=${pkgver}/" Makefile   
	make -s release 
	cd ${_altpkgname}-${_gitpkgrel}
	# This appears to be needed with the 0.0.26 release
        cp -r ../scripts/_bouncer.sh scripts
	# Add archlinux to allowed platforms
        patch install.sh < ${srcdir}/install.sh.patch
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/${pkgname}
	cp -R ${srcdir}/${pkgname}-${_gitpkgrel}/${_altpkgname}-${_gitpkgrel}/* ${pkgdir}/usr/local/installers/${pkgname}
}
sha256sums=('2516e700c88e46e6aa58100ff6f343257cc1befdb555d6ab9e124f217ec46ca0'
            'f5354b4e609355af90738bc02a905ed95d69c11877a8b20f5935c6f58700fc27'
            'ba497cc11b456853604dcf38492580369f9557550944acaa56b0a99fc3028800')
