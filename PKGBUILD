# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=teamviewer-quicksupport-beta
pkgver=10.0.35509
_pkgver_major=${pkgver%%.*}
pkgrel=2
pkgdesc='Teamviewer Quicksupport - All-In-One Software for Remote Support and Online Meetings - beta version'
arch=('i686' 'x86_64')
url='http://www.teamviewer.com/'
depends=('bash')
options=('!strip')
depends_i686=('alsa-lib' 'gcc-libs' 'freetype2' 'libxdamage' 'libxdamage' 'libxrandr' 'libxtst' 'zlib')
depends_x86_64=('lib32-alsa-lib' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-libxdamage' 'lib32-libxrandr' 'lib32-libxtst' 'lib32-zlib')
conflicts=('teamviewer' 'teamviewer-quicksupport')
provides=('teamviewer-quicksupport')
license=('custom')
source=("teamviewer_qs-${pkgver}.tar.gz::http://download.teamviewer.com/download/version_10x/teamviewer_qs.tar.gz")
sha256sums=('a69c32f27eec8cf38f4cab799dedb392910cea4fd38a3d377913d1126baeef53')

prepare() {
	cd teamviewerqs/

	if ! grep -q "^TV_VERSION=\"${pkgver}\"\$" tv_bin/script/tvw_config; then
		msg "Version does not match!"
		exit 1
	fi

	# remove some trash
	rm -rf tv_bin/RTlib/
	rm -f tv_bin/xdg-utils/xdg-email
	rmdir config
	rmdir logfiles
}

build() {
	cd teamviewerqs/

	# set correct path in desktop file
	sed -i 's|/opt/teamviewer/|/opt/teamviewer10/|g' tv_bin/desktop/teamviewer-teamviewer${_pkgver_major}.desktop

	# duh?!
	sed -i '/UpdateBinaries/s/^/#/' tv_bin/script/tvw_main

	# Yes, this is QuickSupport... But we want to use user's home directory.
	sed -i '/function isInstalledTV/,/^}$/c function isInstalledTV() { return 0; }' tv_bin/script/tvw_aux
}

package() {
	cd teamviewerqs/

	install -d -m0755 "${pkgdir}"/opt/teamviewer${_pkgver_major}/
	cp -a --no-preserve=ownership * "${pkgdir}"/opt/teamviewer${_pkgver_major}/

	install -d -m0755 ${pkgdir}/usr/{bin,share/applications,share/licenses/${pkgname}}
	ln -s /opt/teamviewer${_pkgver_major}/tv_bin/script/teamviewer ${pkgdir}/usr/bin/teamviewer
	ln -s /opt/teamviewer${_pkgver_major}/tv_bin/script/teamviewer ${pkgdir}/usr/bin/quicksupport
	ln -s /opt/teamviewer${_pkgver_major}/tv_bin/desktop/teamviewer-teamviewer${_pkgver_major}.desktop \
		"${pkgdir}"/usr/share/applications/teamviewer.desktop
	ln -s /opt/teamviewer${_pkgver_major}/doc/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	install -d -m1777 "${pkgdir}"/var/lib/teamviewer
	ln -s /var/lib/teamviewer "${pkgdir}"/opt/teamviewer${_pkgver_major}/config
	install -d -m1777 "${pkgdir}"/var/log/teamviewer
	ln -s /var/log/teamviewer "${pkgdir}"/opt/teamviewer${_pkgver_major}/logfiles
}

