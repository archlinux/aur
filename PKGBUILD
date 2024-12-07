# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-git
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/opt/"${pkgname%-*}"
pkgver=0.3.8.r0.gd6cedff
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Latest Commit - source]"
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd')
makedepends=('go' 'git' 'base-devel') 
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=(
	'opt/openlinkhub/database.json'
	'opt/openlinkhub/config.json'
)
options=()
install=$_pkgnamesrc.install
source=(
	"${pkgname%-*}::git+https://github.com/jurkovic-nikola/${_upstreamname}.git#branch=main"
	"${pkgname%-*}".install
	"${pkgname%-*}".sysusers
	"${pkgname%-*}".tmpfiles
	"${pkgname%-*}".service
)
noextract=()
sha256sums=('SKIP'
            'a541e655f649d43250481394549ef8dc0192fdd1c6b155866f57adce9f172d7c'
            '1222f0ea7dc963f3e09db814bacc71d2179232ad582fab8ad0e36cb8a9e69141'
            '18f1759e8642b2be24a11337eca16f148f80bee88b3270a3bb62c7376b428090'
            'cc4c09d90f3c26db239ed159b4b65ddf3ec7b68c044e61ee42c77a1a5fb659de')
			
pkgver() {
	cd "${pkgname%-*}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}	

prepare() {
	cd "$srcdir"

	## Look for CORSAIR Controller Device and create UDEV rule file
	## Copied nearly verbatim from upstream ./install.sh

	lsusb -d 1b1c: | while read -r line; do
		ids=$(echo "$line" | awk '{print $6}')
		vendor_id=$(echo "$ids" | cut -d':' -f1)
		device_id=$(echo "$ids" | cut -d':' -f2)
		cat > "${pkgname%-*}"-udev.rules <<- EOM
		KERNEL=="hidraw*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="$vendor_id", ATTRS{idProduct}=="$device_id", MODE="0666"
		EOM
	done
}

build() {
	cd "${pkgname%-*}"
	go build .
}

package() {
	## Install users
	install -Dm 644 "${pkgname%-*}".sysusers "${pkgdir}"/usr/lib/sysusers.d/"${pkgname%-*}".conf

	## Install folders
	install -Dm 644 "${pkgname%-*}".tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/"${pkgname%-*}".conf
	install -dm 755 "${pkgdir}"/opt/"${pkgname%-*}"

	## Install systemd service unit
	install -Dm 644 "${pkgname%-*}.service" "${pkgdir}"/usr/lib/systemd/system/"${pkgname%-*}".service

	## Install udev rules
	install -Dm 644 "$srcdir/${pkgname%-*}-udev.rules" "${pkgdir}"/etc/udev/rules.d/99-"${pkgname%-*}".rules

	## Install package executable
	install -Dm 755 "${pkgname%-*}/$_upstreamname" "${pkgdir}"$_binlocation

	## Install package data
	cp -r "${pkgname%-*}"/database/ "${pkgdir}"$_applocation/database/
	cp -r "${pkgname%-*}"/static/ "${pkgdir}"$_applocation/static/
	cp -r "${pkgname%-*}"/web/ "${pkgdir}"$_applocation/web/

	## Update permissions
	chown root:root "${pkgdir}"$_binlocation
	chmod -R 755 "${pkgdir}"$_applocation
	chown -R openlinkhub:openlinkhub "${pkgdir}"$_applocation
}