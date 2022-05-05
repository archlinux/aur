# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=teamviewer-quicksupport
pkgver=15.29.4
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
sha256sums=('f90eb384e8e2b040cc3c93fcdc130688b5b41127b3857b344e9c937ccf381807')

prepare() {
	cd teamviewerqs/

	if ! grep -q "^TV_VERSION='${pkgver}'\$" tv_bin/script/tvw_config; then
		msg "Version does not match!"
		exit 1
	fi

	rmdir config
	rmdir logfiles

	cd tv_bin/

	tar -xf archive.tar.xz

	rm -rf RTlib/
	rm -f xdg-utils/xdg-email
	rm -f archive.tar.xz
}

build() {
	cd teamviewerqs/

	# set correct pathes in desktop file
	sed -e "/^Exec=/c Exec=/opt/teamviewer/tv_bin/script/teamviewer" \
		-e "/^Icon=/c Icon=teamviewer.png" \
		< tv_bin/desktop/teamviewer.desktop.template \
		> "${srcdir}"/teamviewer.desktop
	rm -f tv_bin/desktop/teamviewer.desktop.template

	# Don't try to extract tar archive during application runtime
	sed -i '/ExtractBinaries/s/^/#/' tv_bin/script/tvw_main

	# Don't clear LD_PRELOAD before running application
	sed -i '/  CheckEnvironment/s/^/#/' tv_bin/script/tvw_main

	# Yes, this is QuickSupport... But we want to use user's home directory.
	sed -i '/function isInstalledTV/,/^}$/c function isInstalledTV() { return 0; }' tv_bin/script/tvw_aux

	# Fix check for Qt5 XCB in libcheck script
	sed -i '/local -r qtxcb/c local -r qtxcb="/usr/lib/qt/plugins/platforms/libqxcb.so"' tv_bin/script/tvw_libcheck
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
