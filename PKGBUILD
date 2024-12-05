# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-git
_pkgnamesrc=OpenLinkHub
_location=/opt/$_pkgnamesrc
_tag=0.3.8
pkgver=0.3.8
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs."
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd')
makedepends=('go' 'git' 'base-devel') 
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
backup=()
options=()
install=OpenLinkHub.install
source=(
	git+https://github.com/jurkovic-nikola/${_pkgnamesrc}.git#tag=${_tag}
	OpenLinkHub.install
	OpenLinkHub.sysusers
	OpenLinkHub.tmpfiles
	package.patch
)
noextract=()
sha256sums=('ed3caea0908b13a87a8c3b7b7af624f51078645423d22bd8982a1c4d826f9bc5'
            'a541e655f649d43250481394549ef8dc0192fdd1c6b155866f57adce9f172d7c'
            '1222f0ea7dc963f3e09db814bacc71d2179232ad582fab8ad0e36cb8a9e69141'
            '5bf73a8aefaa0edd6c73ef6d9042545c9a366c536d8664e2389433fd3e201419'
            '8fdf0e806651bce4cc3241b2ca10320dba9cc5db80673b2253e8e30be36ea00d')

pkgver() {
	cd "$srcdir/${_pkgnamesrc}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/[-].*$//g')"
}	

prepare() {
	cd "$srcdir/${_pkgnamesrc}"

	## Look for CORSAIR Controller Device and create UDEV rule file
	## Copied nearly verbatim from upstream ./install.sh

	patch -Np1 -i ../package.patch

	lsusb -d 1b1c: | while read -r line; do
		ids=$(echo "$line" | awk '{print $6}')
		vendor_id=$(echo "$ids" | cut -d':' -f1)
		device_id=$(echo "$ids" | cut -d':' -f2)
		cat > $_pkgnamesrc-udev.rules <<- EOM
		KERNEL=="hidraw*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="$vendor_id", ATTRS{idProduct}=="$device_id", MODE="0666"
		EOM
	done
}

build() {
	cd "$srcdir/${_pkgnamesrc}"
	go build .
}

package() {

	## Install package README and LICENSE files
	install -vDm 644 $_pkgnamesrc.sysusers "${pkgdir}"/usr/lib/sysusers.d/$_pkgnamesrc.conf

	## Install parent folders
	install -vDm 644 $_pkgnamesrc.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/$_pkgnamesrc.conf

	## Install systemd service unit
	install -vDm 644 "$srcdir/${_pkgnamesrc}/${_pkgnamesrc}.service" "${pkgdir}"/usr/lib/systemd/system/$_pkgnamesrc.service

	## Install systemd service unit
	install -vDm 644 "$srcdir/${_pkgnamesrc}/${_pkgnamesrc}-udev.rules" "${pkgdir}"/etc/udev/rules.d/99-$_pkgnamesrc.rules

	## Install package executable
	install -vDm 755 "$srcdir/${_pkgnamesrc}/${_pkgnamesrc}" "${pkgdir}"/opt/OpenLinkHub/$_pkgnamesrc

	## Install package README and LICENSE files
	cp "$srcdir/${_pkgnamesrc}"/README.md "${pkgdir}"/opt/OpenLinkHub/README.md
	cp "$srcdir/${_pkgnamesrc}"/LICENSE "${pkgdir}"/opt/OpenLinkHub/LICENSE

	## Install program data
	cp -r "$srcdir/${_pkgnamesrc}"/api/ "${pkgdir}"/opt/OpenLinkHub/api/
	cp -r "$srcdir/${_pkgnamesrc}"/database/ "${pkgdir}"/opt/OpenLinkHub/database/
	cp -r "$srcdir/${_pkgnamesrc}"/static/ "${pkgdir}"/opt/OpenLinkHub/static/
	cp -r "$srcdir/${_pkgnamesrc}"/web/ "${pkgdir}"/opt/OpenLinkHub/web/

	chmod -R 755 "${pkgdir}"/opt/OpenLinkHub
	chown -R openlinkhub:root "${pkgdir}"/opt/OpenLinkHub

}