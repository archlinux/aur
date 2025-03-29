# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub
pkgbase="${pkgname}"
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/opt/"${pkgname%-*}"
_tag=0.5.2
pkgver=0.5.2
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Latest Release - source]"
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
	"${pkgname%-*}::git+https://github.com/jurkovic-nikola/${_upstreamname}.git#tag=${_tag}"
	"${pkgname%-*}".install
	"${pkgname%-*}".sysusers
	"${pkgname%-*}".service
)
noextract=()			
sha256sums=('4d7de9c8be4545095c577a7fad094c707406187694337102b30eb8b7e21d3c7e'
            '1a023584de46d7c8c7bb353ceec762f837ae96fe7c41fac4e49f7da86e1e1d1c'
            '5aab700df0d7791722c2723ece369df916e07184407e4778d25a2dd934f12681'
            '430d8196074127257b6b823d7ae72eaa9fedf90f55c70bc121a9467e7648dcc5')

pkgver() {
	cd "${pkgname%-*}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/[-].*$//g')"
}	

build() {
	cd "${pkgname%-*}"
	go build .
}

package() {
	## Install users
	install -bDm 644 "${pkgname%-*}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-*}.conf"

	## Install folders
	install -d -m 755 "${pkgdir}$_applocation/"{database,static,web}

	## Install systemd service unit
	install -bDm 644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-*}.service"

	## Install udev rules
	install -bDm 644 "${pkgname%-*}/99-${pkgname%-*}.rules" "$pkgdir/etc/udev/rules.d/99-${pkgname%-*}.rules"

	## Install package executable
	install -bDm 755 "${pkgname%-*}/$_upstreamname" "$pkgdir$_binlocation"

	## Install package data
	cp -r "${pkgname%-*}"/database/* "${pkgdir}"$_applocation/database/
	cp -r "${pkgname%-*}"/static/* "${pkgdir}"$_applocation/static/
	cp -r "${pkgname%-*}"/web/* "${pkgdir}"$_applocation/web/

	## Update permissions
	chmod 755 "${pkgdir}"$_binlocation
	chmod -R 755 "${pkgdir}"$_applocation
	chown -R 473:473 "${pkgdir}"$_applocation
}
