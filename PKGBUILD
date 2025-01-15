# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-git
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/opt/"${pkgname%-*}"
pkgver=0.4.8.r1.g7108bb5
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Latest Commit - source]"
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd' 'i2c-tools')
makedepends=('go' 'git' 'base-devel' 'systemd') 
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=(
	"etc/udev/rules.d/99-openlinkhub.rules"
	)
options=()
install="${pkgname%-*}".install
source=(
	"${pkgname%-*}::git+https://github.com/jurkovic-nikola/${_upstreamname}.git#branch=main"
	"${pkgname%-*}".install
	"${pkgname%-*}".sysusers
	"${pkgname%-*}".service
)
noextract=()
sha256sums=('SKIP'
            'eb4d6d32e69feeb6892ea2f5c0beb12a5abec06383d79fbe308c19c7c9287c85'
            '5aab700df0d7791722c2723ece369df916e07184407e4778d25a2dd934f12681'
            '430d8196074127257b6b823d7ae72eaa9fedf90f55c70bc121a9467e7648dcc5')
			
pkgver() {
	cd "${pkgname%-*}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}	


build() {
	cd "${pkgname%-*}"
	go build .
}

package() {
	## Install users
	install -Dm 644 "${pkgname%-*}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-*}.conf"

	## Install folders
	install -d -m 755 "${pkgdir}$_applocation/"{database,static,web}

	## Install systemd service unit
	install -Dm 644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-*}.service"

	## Install udev rules
	install -bDm 644 "${pkgname%-*}/99-${pkgname%-*}.rules" "$pkgdir/etc/udev/rules.d/99-${pkgname%-*}.rules"

	## Install package executable
	install -Dm 755 "${pkgname%-*}/$_upstreamname" "$pkgdir$_binlocation"

	## Install package data
	cp -r "${pkgname%-*}"/database/* "${pkgdir}"$_applocation/database/
	cp -r "${pkgname%-*}"/static/* "${pkgdir}"$_applocation/static/
	cp -r "${pkgname%-*}"/web/* "${pkgdir}"$_applocation/web/

	## Update permissions
	chmod 755 "${pkgdir}"$_binlocation
	chmod -R 755 "${pkgdir}"$_applocation
	chown -R 473:473 "${pkgdir}"$_applocation
}
