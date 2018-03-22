# Maintainer: Dominic Meiser <dosm dot mail at gmail dot com>
# Old Maintainer: Alex Taber <aft dot pokemon at gmail dot com>

pkgname=teamviewer13
pkgver=13.1.3026
pkgrel=1
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('x86_64' 'i686')
url='http://www.teamviewer.com'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer-beta')
depends_x86_64=(
	'lib32-fontconfig'
	'lib32-libpng12'
	'lib32-libsm'
	'lib32-libxinerama'
	'lib32-libxrender'
	'lib32-libjpeg6-turbo'
  'lib32-libxtst'
  'lib32-freetype2'
  'lib32-dbus'
  'libxtst')
depends_i686=(
	'fontconfig'
	'libpng12'
	'libsm'
	'libxinerama'
	'libxrender'
	'libjpeg6-turbo'
  'freetype2'
  'libxtst')
install=teamviewer.install
source_x86_64=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb"
               "https://archive.archlinux.org/packages/l/lib32-freetype2/lib32-freetype2-2.8-2-x86_64.pkg.tar.xz")
source_i686=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb"
             "https://archive.archlinux.org/packages/f/freetype2/freetype2-2.8-2-i686.pkg.tar.xz")
sha256sums_x86_64=('33eacc8ebeaf34aea5fa932e3d80553f358629ad454740f05aafba267b50ea93'
                   '4f39c9bd52579ac5d13980d760a5434fdb0f0638df07d2abca9ea44a779185e3')
sha256sums_i686=('46f1b697a113f304ff8e5792f9893319c0de6b802355e7e5fdf7dba6f4b415c8'
                 'd33cf8be0c4be1c602d368fb363c9029d87f2bc4fdfcae5063595ac482ca39e8')

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

  # freetype workaround
  [ -e "${srcdir}/usr/lib32/libfreetype.so.6.14.0" ] && install -D -m0755 "${srcdir}/usr/lib32/libfreetype.so.6.14.0" "${pkgdir}/opt/teamviewer/tv_bin/wine/lib/libfreetype.so.6"
  [ -e "${srcdir}/usr/lib/libfreetype.so.6.14.0" ] && install -D -m0755 "${srcdir}/usr/lib/libfreetype.so.6.14.0" "${pkgdir}/opt/teamviewer/tv_bin/wine/lib/libfreetype.so.6"

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}
