# Maintainer: Dominic Meiser <dosm dot mail at gmail dot com>
# Old Maintainer: Alex Taber <aft dot pokemon at gmail dot com>

pkgname=teamviewer13
pkgver=13.1.3026
pkgrel=3
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('x86_64' 'i686')
url='http://www.teamviewer.com'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer-beta')
depends=(
	'hicolor-icon-theme'
	'qt5-base'
	'qt5-declarative'
	'qt5-quickcontrols'
	'qt5-webkit'
	'qt5-x11extras'
)
install=teamviewer.install
source_x86_64=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
sha256sums_x86_64=('33eacc8ebeaf34aea5fa932e3d80553f358629ad454740f05aafba267b50ea93')
sha256sums_i686=('46f1b697a113f304ff8e5792f9893319c0de6b802355e7e5fdf7dba6f4b415c8')

prepare() {
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	mkdir data
	cd data
	tar -xf ../data.tar.xz
}

package() {
	# Install
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	cp -dr --no-preserve=ownership ./data/{etc,opt,usr,var} "${pkgdir}"/
	
	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}
