# Maintainer: Ivan Avdonin <avdonin@yahoo.com>

pkgname=teamviewer-latest
pkgver=15.0.8397
pkgrel=1
pkgdesc="All-In-One Software for Remote Support and Online Meetings"
arch=('x86_64' 'x86')
url="http://www.teamviewer.com"
license=('custom')
depends=('hicolor-icon-theme'  'qt5-webkit'  'qt5-x11extras'  'qt5-quickcontrols')
conflicts=('teamviewer-beta' 'teamviewer' 'teamviewer8' 'teamviewer9' 'teamviewer10' 'teamviewer11' 'teamviewer12')
replaces=('teamviewer-beta' 'teamviewer' 'teamviewer8' 'teamviewer9' 'teamviewer10' 'teamviewer11' 'teamviewer12')
install=teamviewer.install
source_x86_64=("https://download.teamviewer.com/download/linux/teamviewer_amd64.deb")
source_x86=("https://download.teamviewer.com/download/linux/teamviewer_i386.deb")
md5sums_x86_64=('1ab9f03323f3bb4a7d03f47c2aae44c5')
md5sums_x86=('c53f6f90039bf97213fd5e9bce7878c6')

prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
	#sed -i '/function CheckQtQuickControls()/{N;a ls /usr/lib/qt/qml/QtQuick/Controls/qmldir &>/dev/null && return # ArchLinux}'\
	#./opt/teamviewer/tv_bin/script/teamviewer_setup || msg2 "teamviewer_setup failed"
	#msg2 "Running teamviewer_setup checklibs"
	#./opt/teamviewer/tv_bin/script/teamviewer_setup checklibs \
    #|| msg2 "teamviewer_setup checklibs failed" 
}

package() {
	# Install
	cp -dr --no-preserve=ownership ./data/{etc,opt,usr,var} "${pkgdir}"/

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	rm -rf "${pkgdir}"/etc/apt
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
	if [ "$CARCH" = "x86_64" ] && [ -f "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend" ]; then
		msg2 "Removing libdepend to ditch lib32 dependencies"
		rm "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend"
	fi
}