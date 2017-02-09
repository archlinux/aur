# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexandre Boily <alexandreboily@gmail.com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>
# Contributor: totoloco <totoloco at gmail _dot_com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mysql-workbench-git
pkgver=6.3.9.r0.g1972008
pkgrel=1
# mysql & mysql-connector-c++ from git
_gdal_version=2.1.3
_boost_version=1.59.0
pkgdesc='A cross-platform, visual database design tool developed by MySQL - git checkout'
arch=('i686' 'x86_64')
url='https://www.mysql.com/products/workbench/'
license=('GPL2')
depends=('cairo' 'ctemplate' 'desktop-file-utils' 'freetype2' 'gtkmm3'
	'hicolor-icon-theme' 'libgl' 'libgnome-keyring' 'libiodbc' 'libxml2'
	'libzip' 'mysql-python' 'pcre' 'python2' 'python2-cairo' 'python2-paramiko'
	'python2-pexpect' 'tinyxml' 'unixodbc' 'vsqlite++')
optdepends=('gnome-keyring: store SSH/MySQL passwords in GNOME password manager'
	'python2-pyodbc: database migration')
provides=('mysql-workbench')
conflicts=('mysql-workbench')
makedepends=('git' 'cmake' 'boost' 'mesa' 'swig' 'java-runtime' 'imagemagick')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
source=('git://github.com/mysql/mysql-workbench.git'
	'git://github.com/mysql/mysql-server.git'
	'git://github.com/mysql/mysql-connector-cpp.git'
	"http://download.osgeo.org/gdal/${_gdal_version}/gdal-${_gdal_version}.tar.xz"
	"https://downloads.sourceforge.net/project/boost/boost/${_boost_version}/boost_${_boost_version//./_}.tar.bz2"
	'http://www.antlr3.org/download/antlr-3.4-complete.jar'
	'0001-mysql-workbench-no-check-for-updates.patch'
	'0002-disable-unsupported-operating-system-warning.patch'
	'0003-add-option-to-hide-nonstandard-server-warning.patch'
	'0004-fix-build-for-i686.patch'
	'arch_linux_profile.xml')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'b489793627e6cb8d2ff8d7737b61daf58382fe189fae4c581ddfd48c04b49005'
            '727a932322d94287b62abb1bd2d41723eec4356a7728909e38adb65ca25241ca'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7'
            'b189e15c6b6f5a707357d9a9297f39ee3a33264fd28b44d5de6f537f851f82cf'
            '0d65832bc5a73d4cfecef4b552bb78a30ce6020a5fabe5558dcf2ade8341b593'
            '3c9097af599f08388c471d6fd02f40ea72e5759eaa89f731e662852a5e67feea'
            '68295716c55e5f7b07b3ec1162b512b33a0563952a0eb4ef6fd71d852c61de11'
            '2ade582ca25f6d6d748bc84a913de39b34dcaa6e621a77740fe143007f2833af')

pkgver() {
	cd mysql-workbench/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd "${srcdir}/mysql-workbench/"

	# Disable 'Help' -> 'Check for Updates'
	# Updates are provided via Arch Linux packages
	patch -Np1 < "${srcdir}"/0001-mysql-workbench-no-check-for-updates.patch

	# disable unsupported operating system warning
	patch -Np1 < "${srcdir}"/0002-disable-unsupported-operating-system-warning.patch

	# add option to hide nonstandard server warning
	patch -Np1 < "${srcdir}"/0003-add-option-to-hide-nonstandard-server-warning.patch

	# fix build for i686
	patch -Np1 < "${srcdir}"/0004-fix-build-for-i686.patch

	# we need python 2.x
	sed -i '/^FIND_PROGRAM(PYTHON_EXEC /c FIND_PROGRAM(PYTHON_EXEC "python2")' \
		CMakeLists.txt

	# put antlr into place
	install -D ${srcdir}/antlr-3.4-complete.jar ${srcdir}/linux-res/bin/antlr-3.4-complete.jar
}

build() {
	# this uses deprecated auto_ptr...
	# we known that, so do not flood the logs
	CXXFLAGS="${CXXFLAGS} -Wno-deprecated-declarations"

	# Build mysql
	cd "${srcdir}/mysql-server/"
	cmake . \
		-DBUILD_CONFIG=mysql_release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DSYSCONFDIR=/etc/mysql \
		-DMYSQL_DATADIR=/var/lib/mysql \
		-DWITH_BOOST="${srcdir}/boost_${_boost_version//./_}"
	make
	make DESTDIR="${srcdir}/install-bundle/" install

	# Build mysql-connector-c++
	cd "${srcdir}/mysql-connector-cpp/"
	cmake . \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DMYSQLCPPCONN_BUILD_EXAMPLES=OFF \
		-DMYSQL_DIR="${srcdir}/install-bundle/" \
		-DMYSQL_CONFIG_EXECUTABLE="${srcdir}/install-bundle/usr/bin/mysql_config" \
		-DBOOST_ROOT:STRING="${srcdir}/boost_${_boost_version//./_}"

	make DESTDIR="${srcdir}/install-bundle/" install

	# Build gdal
	cd "${srcdir}/gdal-${_gdal_version}/"
	./configure \
		--prefix=/usr \
		--includedir=/usr/include/gdal \
		--with-sqlite3 \
		--with-mysql="${srcdir}/install-bundle/usr/bin/mysql_config" \
		--with-curl \
		--without-jasper
	make
	make DESTDIR="${srcdir}/install-bundle/" install

	# Build MySQL Workbench itself with bundled libs
	cd "${srcdir}/mysql-workbench/"
	cmake . \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_CXX_FLAGS="-std=c++11" \
		-DCMAKE_BUILD_TYPE=Release \
		-DMySQL_CONFIG_PATH="${srcdir}/install-bundle/usr/bin/mysql_config" \
		-DMySQLCppConn_LIBRARY="${srcdir}/install-bundle/usr/lib/libmysqlcppconn.so" \
		-DMySQLCppConn_INCLUDE_DIR="${srcdir}/install-bundle/usr/include" \
		-DGDAL_INCLUDE_DIR="${srcdir}/install-bundle/usr/include" \
		-DGDAL_LIBRARY="${srcdir}/install-bundle/usr/lib/libgdal.so" \
		-DUSE_BUNDLED_MYSQLDUMP=1
	make
}

package() {
	# install bundled libraries files and files
	for LIBRARY in $(find "${srcdir}/install-bundle/usr/lib/" -type f -regex '.*/lib\(gdal\|mysql\(client\|cppconn\)\)\.so\..*'); do
		install -D -m0755 "${LIBRARY}" "${pkgdir}"/usr/lib/mysql-workbench/"$(basename "${LIBRARY}")"
	done
	for SYMLINK in $(find "${srcdir}/install-bundle/usr/lib/" -type l -regex '.*/lib\(gdal\|mysql\(client\|cppconn\)\)\.so\..*'); do
		ln -s "$(readlink "${SYMLINK}")" "${pkgdir}"/usr/lib/mysql-workbench/"$(basename "${SYMLINK}")"
	done
	install -m0755 "${srcdir}/install-bundle/usr/bin/mysql"{,dump} "${pkgdir}"/usr/lib/mysql-workbench/

	# install MySQL Workbench itself
	cd "${srcdir}/mysql-workbench/"

	make DESTDIR="${pkgdir}" install

	# icons
	for SIZE in 16 24 32 48 64 96 128; do
		convert -scale ${SIZE} \
			images/icons/linux/128x128/apps/mysql-workbench.png \
			${srcdir}/mysql-workbench.png
		install -D -m0644 ${srcdir}/mysql-workbench.png "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/mysql-workbench.png"
	done

	install -D -m 0644 "${srcdir}"/arch_linux_profile.xml \
		"${pkgdir}"/usr/share/mysql-workbench/mysql.profiles/Arch_Linux_\(MariaDB\).xml
}

