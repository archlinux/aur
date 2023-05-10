# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=cs-firewall-bouncer
_altpkgname=crowdsec-firewall-bouncer
pkgver=0.0.26
pkgrel=2
_gitpkgrel=0.0.26
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
        mkdir scripts
        cp -r ../scripts/_bouncer.sh scripts
	# Add archlinux to allowed platforms
        patch install.sh < ${srcdir}/install.sh.patch
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/${pkgname}
	cp -R ${srcdir}/${pkgname}-${_gitpkgrel}/${_altpkgname}-${_gitpkgrel}/* ${pkgdir}/usr/local/installers/${pkgname}
}
sha256sums=('2325df3f8d01e2c9b52db212a796b15b4992a135d5d278441277e97db353b2a7'
            'c312a49e55b9fc1d4c5f70db9e666695e2db18d848191d5c714a93020b290dc9'
            'af3bad2dc1912dc30d04301e4d921a4f5b84c860f8889abcdfef1e904947fedc')
