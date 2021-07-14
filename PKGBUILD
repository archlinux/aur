# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool
_pkgname=MapTool
pkgver=1.9.3
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
depends=('jre-openjdk')
makedepends=('git' 'dpkg' 'jdk-openjdk' 'gradle' 'xdg-utils' 'rpm-tools')
optdepends=('gvfs: access virtual filesystem')
source=("git+https://github.com/RPTools/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')
install='maptool.install'

build() {
	cd "${pkgname}"
	gradle --parallel jpackage
}

check() {
	cd "${pkgname}"
	gradle --parallel check
}

package() {
	cd "${pkgdir}"
	
	dpkg-deb -x "${srcdir}/${pkgname}/releases/${pkgname}_${pkgver}-${pkgrel}_amd64.deb" .
	mkdir -p "usr/share/licenses/${pkgname}"
	mv "opt/${pkgname}/share/doc/copyright" "usr/share/licenses/${pkgname}/"
	rm -rf "opt/${pkgname}/share"
	
	#rpmextract.sh "${srcdir}/${pkgname}/releases/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm"
	#mv "usr/share/licenses/maptool-${pkgver}" "usr/share/licenses/${pkgname}"
	
	install -Dm644 "opt/${pkgname}/lib/${pkgname}-${_pkgname}.desktop" -t "usr/share/applications/"
	
	install -dm755 'usr/bin'
	echo "#!/bin/bash" > "usr/bin/${pkgname}"
	echo "/opt/${pkgname}/bin/MapTool \"\$@\"" >> "usr/bin/${pkgname}"
	chmod 755 "usr/bin/${pkgname}"
}
