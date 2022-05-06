# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=teamviewer-quicksupport
pkgver=15.30.2
pkgrel=1
pkgdesc='Teamviewer Quicksupport - All-In-One Software for Remote Support and Online Meetings'
arch=('x86_64')
url='http://www.teamviewer.com/'
options=('!strip')
depends=(
	'bash'
	'dbus'
	'gcc-libs'
	'glib2'
	'glibc'
	'hicolor-icon-theme'
	'libcap'
	'libgcrypt'
	'libgpg-error'
	'libglvnd'
	'libx11'
	'libxcb'
	'lz4'
	'qt5-quickcontrols'
	'qt5-x11extras'
	'pcre'
	'systemd-libs'
	'xz'
	'zlib'
	'zstd')
conflicts=('teamviewer')
license=('custom')
source=("teamviewer_qs-${pkgver}.tar.gz::https://download.teamviewer.com/download/teamviewer_qs.tar.gz")
sha256sums=('e0b810574190301e16461e6cac2f97d48c5ff57926f0dc6b4e3c1be13606496a')

prepare() {
	cd teamviewerqs/

	if ! grep -q "^TV_VERSION='${pkgver}'\$" tv_bin/script/tvw_config; then
		echo "Source version does not match pkgver!"
		exit 1
	fi

	# Delete unneeded empty dirs
	rmdir config
	rmdir logfiles

	cd tv_bin/

	# Extract embedded archive
	tar -xf archive.tar.xz

	# set correct pathes in desktop file
	sed -e "/^Exec=/c Exec=/opt/teamviewer/tv_bin/script/teamviewer" \
		-e "/^Icon=/c Icon=teamviewer.png" \
		< desktop/teamviewer.desktop.template \
		> "${srcdir}"/teamviewer.desktop

	# Don't try to extract tar archive during application runtime
	sed -i '/ExtractBinaries/s/^/#/' script/tvw_main

	# Don't clear LD_PRELOAD before running application
	sed -i '/  CheckEnvironment/s/^/#/' script/tvw_main

	# Yes, this is QuickSupport... But we want to use user's home directory.
	sed -i '/function isInstalledTV/,/^}$/c function isInstalledTV() { return 0; }' script/tvw_aux

	# Fix check for Qt5 XCB in libcheck script
	sed -i '/local -r qtxcb/c local -r qtxcb="/usr/lib/qt/plugins/platforms/libqxcb.so"' script/tvw_libcheck

	# Fix check for Qt5 QuckControls in setup script
	sed -e '/CheckQtQuickControls()/{N' \
		-e 'a ls /usr/lib/qt/qml/QtQuick/Controls/qmldir &>/dev/null && return # ArchLinux' \
		-e '}' \
		-i script/teamviewer_setup

	# Delete unneeded files
	rm -rf RTlib/
	rm -f desktop/teamviewer.desktop.template
	rm -f xdg-utils/xdg-email
	rm -f archive.tar.xz
}

package() {
	cd teamviewerqs/

	install -d -m0755 "${pkgdir}"/opt/teamviewer/
	cp -a --no-preserve=ownership * "${pkgdir}"/opt/teamviewer/

	install -d -m0755 "${pkgdir}"/usr/{bin,share/applications,share/icons/hicolor,share/licenses/${pkgname}}
	ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}"/usr/bin/teamviewer
	ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}"/usr/bin/quicksupport
	ln -s /opt/teamviewer/doc/License.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /opt/teamviewer/doc/{EULA_en.txt,DPA_en.txt} "${pkgdir}"/usr/share/licenses/${pkgname}/

	install -D -m0755 "${srcdir}"/teamviewer.desktop "${pkgdir}"/usr/share/applications/teamviewer.desktop
	
	for iconsize in 16 20 24 32 48 256; do
		install -Dm644 "tv_bin/desktop/teamviewer_${iconsize}.png" "${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/teamviewer.png"
	done

	install -d -m1777 "${pkgdir}"/var/lib/teamviewer
	ln -s /var/lib/teamviewer "${pkgdir}"/opt/teamviewer/config
	install -d -m1777 "${pkgdir}"/var/log/teamviewer
	ln -s /var/log/teamviewer "${pkgdir}"/opt/teamviewer/logfiles
}
