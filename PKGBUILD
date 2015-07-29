# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexandre Boily <alexandreboily@gmail.com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>
# Contributor: totoloco <totoloco at gmail _dot_com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mysql-workbench-dev
pkgver=6.3.4
pkgrel=4
pkgdesc='A cross-platform, visual database design tool developed by MySQL - development version'
arch=('i686' 'x86_64')
url='https://www.mysql.com/products/workbench/'
license=('GPL2')
depends=('python2' 'libzip' 'libmariadbclient' 'gtkmm' 'ctemplate'
	'libgnome-keyring' 'libgl' 'python2-paramiko' 'python2-pexpect' 'gdal'
	'pcre' 'tinyxml' 'libxml2' 'mysql-python' 'cairo'
	'python2-cairo' 'hicolor-icon-theme' 'desktop-file-utils' 'libiodbc'
	'mysql-connector-c++' 'vsqlite++' 'unixodbc' 'freetype2'
	'libantlr3c')
optdepends=('gnome-keyring: store SSH/MySQL passwords in GNOME password manager'
	'python2-pyodbc: database migration')
makedepends=('cmake' 'boost' 'curl' 'mesa' 'swig' 'java-runtime' 'imagemagick')
install=mysql-workbench.install
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=("http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-${pkgver}-src.tar.gz"{,.asc}
	'http://www.antlr3.org/download/antlr-3.4-complete.jar'
	'0001-mysql-workbench-no-check-for-updates.patch'
	'0007-mysql-workbench-no-set-gtid-purged.patch'
	'0009-mysql-workbench-gnome-keyring.patch'
	'0010-mysql-workbench-object.patch'
	'arch_linux_profile.xml')
sha256sums=('be47f30c48c04f951a1be9b6496e4d94d5b975d6c693933ba2fa6e96718179d3'
            'SKIP'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7'
            'b189e15c6b6f5a707357d9a9297f39ee3a33264fd28b44d5de6f537f851f82cf'
            'b49d4ea352d2c2013b9c5834668c44521a0a2c5f9c7e3fe746ad94ce0d2bb865'
            '9c2ae2fe7a4f59502bdcf591a07353c350b0ba29c3935c8242d97848cc0e50d3'
            'c8bbaee5d601333730bd200baa9514e880e4c5277b1241a67e267b602b400ded'
            '28724c4b4cec29ce19aada08279df1b086381cd788fef7ae07c1860f7d17af7e')

prepare() {
	cd "${srcdir}/mysql-workbench-community-${pkgver}-src/"

	# Disable 'Help' -> 'Check for Updates'
	# Updates are provided via Arch Linux packages
	patch -Np1 < "${srcdir}"/0001-mysql-workbench-no-check-for-updates.patch

	# mysqldump from mariadb (currently 1.0.16) does not support --set-gtid-purged
	patch -Np1 < "${srcdir}"/0007-mysql-workbench-no-set-gtid-purged.patch

	# fix gnome-keyring
	patch -Np1 < "${srcdir}"/0009-mysql-workbench-gnome-keyring.patch

	# fix cannot call member function without object
	patch -Np1 < "${srcdir}"/0010-mysql-workbench-object.patch

	# fix GDAL
	sed -i '/#include/s|gdal/||' backend/wbpublic/grtui/geom_draw_box.h backend/wbpublic/grt/spatial_handler.h

	# put antlr into place
	install -D ${srcdir}/antlr-3.4-complete.jar ${srcdir}/linux-res/bin/antlr-3.4-complete.jar
}

build() {
	cd "${srcdir}/mysql-workbench-community-${pkgver}-src/"

	cmake . \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr

	make
}

package() {
	cd "${srcdir}/mysql-workbench-community-${pkgver}-src"

	make DESTDIR="${pkgdir}" install

	# icons
	for SIZE in 16 24 32 48 64 96 128; do
		convert -scale ${SIZE} \
			images/icons/linux/128x128/apps/mysql-workbench.png \
			${srcdir}/mysql-workbench.png
		install -D -m0644 ${srcdir}/mysql-workbench.png "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/mysql-workbench.png"
	done

	install -D -m 0644 "${srcdir}"/arch_linux_profile.xml \
		"${pkgdir}"/usr/share/mysql-workbench/mysql.profiles/Arch_Linux_\(MariaDB_5.5_Package\).xml
}

