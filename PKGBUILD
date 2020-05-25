# Maintainer: Alex Taber & liberodark

pkgname=teamviewer11
pkgver=11.0.256402
pkgrel=1
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('x86_64')
url='http://www.teamviewer.com'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer' 'teamviewer-beta' 'teamviewer10' 'teamviewer9' 'teamviewer8')

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
install=teamviewer11.install
source_x86_64=("http://download.teamviewer.com/download/version_11x/teamviewer_amd64.deb"
                "https://archive.archlinux.org/packages/l/lib32-freetype2/lib32-freetype2-2.8-2-x86_64.pkg.tar.xz")
sha256sums_x86_64=('f2c7258283696651b459699c6e0401781e223eb61f492c149188c82b3c485cfd'
                   '4f39c9bd52579ac5d13980d760a5434fdb0f0638df07d2abca9ea44a779185e3')

prepare() {
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
  mkdir data
  cd data
	tar -xf ../data.tar.bz2
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
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer11}
	mv "${srcdir}"/data/opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer11.desktop "${pkgdir}"/usr/share/applications/teamviewer11.desktop
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer11/LICENSE
}
