# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=teamviewer-quicksupport
pkgver=10.0.46203
_pkgver_major=${pkgver%%.*}
pkgrel=2
pkgdesc='Teamviewer Quicksupport - All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64')
url='http://www.teamviewer.com/'
depends=('bash')
options=('!strip')
depends_i686=('gcc-libs' 'alsa-lib' 'freetype2' 'libxdamage' 'libxrandr' 'libxtst' 'zlib')
depends_x86_64=('lib32-gcc-libs' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-libxdamage' 'lib32-libxrandr' 'lib32-libxtst' 'lib32-zlib')
conflicts=('teamviewer')
license=('custom')
source=("teamviewer_qs-${pkgver}.tar.gz::http://download.teamviewer.com/download/version_${_pkgver_major}x/teamviewer_qs.tar.gz")
sha256sums=('9d112d3dcb8056115fc2dabeaaab729ec19bdea5352ea7a2ca3858d6e26e1c96')

prepare() {
	cd teamviewerqs/

	if ! grep -q "^TV_VERSION=\"${pkgver}\"\$" tv_bin/script/tvw_config; then
		msg "Version does not match!"
		exit 1
	fi

	rmdir config
	rmdir logfiles

	cd tv_bin/

	bsdtar xf archive.tar.xz

	rm -rf RTlib/
	rm -f xdg-utils/xdg-email
	rm -f archive.tar.xz
}

build() {
	cd teamviewerqs/

	# duh?!
	sed -i '/UpdateBinaries/s/^/#/' tv_bin/script/tvw_main

	# Yes, this is QuickSupport... But we want to use user's home directory.
	sed -i '/function isInstalledTV/,/^}$/c function isInstalledTV() { return 0; }' tv_bin/script/tvw_aux
}

package() {
	cd teamviewerqs/

	install -d -m0755 "${pkgdir}"/opt/teamviewer/
	cp -a --no-preserve=ownership * "${pkgdir}"/opt/teamviewer/

	install -d -m0755 "${pkgdir}"/usr/{bin,share/applications,share/licenses/${pkgname}}
	ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}"/usr/bin/teamviewer
	ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}"/usr/bin/quicksupport
	ln -s /opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer${_pkgver_major}.desktop \
		"${pkgdir}"/usr/share/applications/teamviewer.desktop
	ln -s /opt/teamviewer/doc/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	install -d -m1777 "${pkgdir}"/var/lib/teamviewer
	ln -s /var/lib/teamviewer "${pkgdir}"/opt/teamviewer/config
	install -d -m1777 "${pkgdir}"/var/log/teamviewer
	ln -s /var/log/teamviewer "${pkgdir}"/opt/teamviewer/logfiles
}

