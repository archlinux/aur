# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=teamviewer-quicksupport-beta
pkgver=11.0.51386
_pkgver_major=${pkgver%%.*}
pkgrel=1
pkgdesc='Teamviewer Quicksupport - All-In-One Software for Remote Support and Online Meetings - beta version'
arch=('i686' 'x86_64')
url='http://www.teamviewer.com/'
depends=('bash')
options=('!strip')
depends_i686=('gcc-libs' 'alsa-lib' 'freetype2' 'libxdamage' 'libxrandr' 'libxtst' 'zlib')
depends_x86_64=('lib32-gcc-libs' 'lib32-alsa-lib' 'lib32-freetype2' 'lib32-libxdamage' 'lib32-libxrandr' 'lib32-libxtst' 'lib32-zlib')
conflicts=('teamviewer' 'teamviewer-quicksupport')
provides=('teamviewer-quicksupport')
license=('custom')
source=("teamviewer_qs-${pkgver}.tar.gz::http://download.teamviewer.com/download/version_${_pkgver_major}x/teamviewer_qs.tar.gz")
sha256sums=('166ea627e8530dc5cbf490a6b87a7ae5ceee48a3164a66cebb8f643b421c2959')

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

	# set correct pathes in desktop file
	sed -e "/^Exec=/c Exec=/opt/teamviewer/tv_bin/script/teamviewer" \
		-e "/^Icon=/c Icon=/opt/teamviewer/tv_bin/desktop/teamviewer.png" \
		< tv_bin/desktop/teamviewer.desktop.template \
		> "${srcdir}"/teamviewer.desktop

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
	ln -s /opt/teamviewer/doc/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

	install -D -m0755 "${srcdir}"/teamviewer.desktop "${pkgdir}"/usr/share/applications/teamviewer.desktop

	install -d -m1777 "${pkgdir}"/var/lib/teamviewer
	ln -s /var/lib/teamviewer "${pkgdir}"/opt/teamviewer/config
	install -d -m1777 "${pkgdir}"/var/log/teamviewer
	ln -s /var/log/teamviewer "${pkgdir}"/opt/teamviewer/logfiles
}

