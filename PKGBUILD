# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexandre Boily <alexandreboily@gmail.com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>
# Contributor: totoloco <totoloco at gmail _dot_com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=mysql-workbench-git
pkgver=8.0.12.r0.g7d05cc5df
pkgrel=1
# mysql from git
_connector_version=8.0.12
_gdal_version=2.3.1
_boost_version=1.67.0
pkgdesc='A cross-platform, visual database design tool developed by MySQL - git checkout'
arch=('x86_64')
url='https://www.mysql.com/products/workbench/'
license=('GPL2')
depends=('cairo' 'ctemplate' 'desktop-file-utils' 'freetype2' 'gtkmm3'
	'hicolor-icon-theme' 'libgl' 'libsecret' 'libiodbc' 'libxml2'
	'libzip' 'mysql-python' 'pcre' 'python2' 'python2-cairo' 'libssh'
	'python2-pexpect' 'tinyxml' 'unixodbc' 'vsqlite++' 'proj' 'json-c'
	'antlr4-runtime')
optdepends=('python2-pyodbc: database migration')
provides=('mysql-workbench')
conflicts=('mysql-workbench')
makedepends=('git' 'cmake' 'boost' 'mesa' 'swig' 'java-runtime' 'imagemagick' 'antlr4')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5') # MySQL Release Engineering <mysql-build@oss.oracle.com>
source=('git://github.com/mysql/mysql-workbench.git'
	'git://github.com/mysql/mysql-server.git'
	"https://cdn.mysql.com/Downloads/Connector-C++/mysql-connector-c++-${_connector_version}-src.tar.gz"{,.asc}
	"http://download.osgeo.org/gdal/${_gdal_version}/gdal-${_gdal_version}.tar.xz"
	"https://downloads.sourceforge.net/project/boost/boost/${_boost_version}/boost_${_boost_version//./_}.tar.bz2"
	'0001-mysql-workbench-no-check-for-updates.patch'
	'0002-disable-unsupported-operating-system-warning.patch'
	'arch_linux_profile.xml')
sha256sums=('SKIP'
            'SKIP'
            '47d9f152988fe205350a6d31d032692a6777f838a886c3b3dc7af3b0652fdd50'
            'SKIP'
	    '9c4625c45a3ee7e49a604ef221778983dd9fd8104922a87f20b99d9bedb7725a'
	    '2684c972994ee57fc5632e03bf044746f6eb45d4920c343937a465fd67a5adba'
	    'cdf687f23bc6e8d52dbee9fa02b23d755e80f88476f0fc2e7c4c71cdfed3792f'
	    '2d0f6dcf38f22e49ef7ab9de0230484f1ffac41b7ac40feaf5ef4538ae2f7a18'
            '2ade582ca25f6d6d748bc84a913de39b34dcaa6e621a77740fe143007f2833af')

pkgver() {
	cd mysql-workbench/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd "${srcdir}/mysql-workbench/"

	# Disable 'Help' -> 'Check for Updates'
	# Updates are provided via Arch Linux packages
	patch -Np1 < "${srcdir}"/0001-mysql-workbench-no-check-for-updates.patch

	# disable unsupported operating system warning
	patch -Np1 < "${srcdir}"/0002-disable-unsupported-operating-system-warning.patch

	# GCC 7.x introduced some new warnings, remove '-Werror' for the build to complete
	sed -i '/^set/s|-Werror -Wall|-Wall|' CMakeLists.txt

	# GCC 7.x complains about unsupported flag
	sed -i 's|-Wno-deprecated-register||' ext/scintilla/gtk/CMakeLists.txt

	# disable stringop-truncation for GCC 8.x
	sed -i '/^set/s|-Wall|-Wall -Wno-stringop-truncation|' CMakeLists.txt

	# make sure to link against bundled libraries
	sed -i "/target_link_libraries/s|\\$|-L${srcdir}/install-bundle/usr/lib/ \\$|" backend/wbpublic/CMakeLists.txt
}

build() {
	# Build mysql
	mkdir "${srcdir}/mysql-build"
	cd "${srcdir}/mysql-build"
	msg "Configure mysql"
	cmake "${srcdir}/mysql-server" \
		-DWITHOUT_SERVER=ON \
		-DBUILD_CONFIG=mysql_release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSCONFDIR=/etc/mysql \
		-DMYSQL_DATADIR=/var/lib/mysql \
		-DWITH_BOOST="${srcdir}/boost_${_boost_version//./_}"
	msg "Build mysql"
	make
	msg "Install mysql"
	make DESTDIR="${srcdir}/install-bundle/" install

	# Build mysql-connector-c++
	mkdir "${srcdir}/mysql-connector-c++-${_connector_version}-src-build"
	cd "${srcdir}/mysql-connector-c++-${_connector_version}-src-build"
	msg "Configure mysql-connector-c++"
	cmake "${srcdir}/mysql-connector-c++-${_connector_version}-src" \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DINSTALL_LIB_DIR=lib \
		-DMYSQL_DIR="${srcdir}/install-bundle/" \
		-DMYSQL_CONFIG_EXECUTABLE="${srcdir}/install-bundle/usr/bin/mysql_config" \
		-DWITH_JDBC=ON
	msg "Build mysql-connector-c++"
	make
	msg "Install mysql-connector-c++"
	make DESTDIR="${srcdir}/install-bundle/" install

	# Build gdal
	cd "${srcdir}/gdal-${_gdal_version}"
	msg "Configure gdal"
	./configure \
		--prefix=/usr \
		--includedir=/usr/include/gdal \
		--with-sqlite3 \
		--with-mysql="${srcdir}/install-bundle/usr/bin/mysql_config" \
		--with-curl \
		--without-jasper
	msg "Build gdal"
	make LD_LIBRARY_PATH="${srcdir}/install-bundle/usr/lib/"
	msg "Install gdal"
	make LD_LIBRARY_PATH="${srcdir}/install-bundle/usr/lib/" DESTDIR="${srcdir}/install-bundle/" install

	# Build MySQL Workbench itself with bundled libs
	mkdir "${srcdir}/mysql-workbench-build"
	cd "${srcdir}/mysql-workbench-build"
	msg "Configure mysql-workbench"
	cmake "${srcdir}/mysql-workbench" \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_CXX_FLAGS="-std=c++14" \
		-DCMAKE_BUILD_TYPE=Release \
		-DMySQL_CONFIG_PATH="${srcdir}/install-bundle/usr/bin/mysql_config" \
		-DMySQLCppConn_LIBRARY="${srcdir}/install-bundle/usr/lib/libmysqlcppconn.so" \
		-DMySQLCppConn_INCLUDE_DIR="${srcdir}/install-bundle/usr/include/jdbc" \
		-DGDAL_INCLUDE_DIR="${srcdir}/install-bundle/usr/include" \
		-DGDAL_LIBRARY="${srcdir}/install-bundle/usr/lib/libgdal.so" \
		-DWITH_ANTLR_JAR='/usr/share/java/antlr-complete.jar' \
		-DUSE_BUNDLED_MYSQLDUMP=1
	msg "Build mysql-workbench"
	make
}

package() {
	# install bundled libraries
	for LIBRARY in $(find "${srcdir}/install-bundle/usr/lib/" -type f -regex '.*/lib\(gdal\|mysql\(client\|cppconn\)\)\.so\..*'); do
		BASENAME="$(basename "${LIBRARY}")"
		SONAME="$(readelf -d "${LIBRARY}" | grep -Po '(?<=(Library soname: \[)).*(?=\])')"
		install -D -m0755 "${LIBRARY}" "${pkgdir}"/usr/lib/mysql-workbench/"${BASENAME}"
		ln -s "${BASENAME}" "${pkgdir}"/usr/lib/mysql-workbench/"${SONAME}"
	done

	# install bundled mysql and mysqldump
	install -m0755 "${srcdir}/install-bundle/usr/bin/mysql"{,dump} "${pkgdir}"/usr/lib/mysql-workbench/

	# install MySQL Workbench itself
	cd "${srcdir}/mysql-workbench-build/"

	# where should these file be generated!?
	touch "${srcdir}"/mysql-workbench/build/mysql-workbench-commercial.{mime,sharedmimeinfo}
	make DESTDIR="${pkgdir}" install

	# icons
	for SIZE in 16 24 32 48 64 96 128; do
		convert -scale ${SIZE} \
			"${srcdir}/mysql-workbench/images/icons/MySQLWorkbench-128.png" \
			"${srcdir}/mysql-workbench.png"
		install -D -m0644 "${srcdir}/mysql-workbench.png" "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/mysql-workbench.png"
	done

	install -D -m 0644 "${srcdir}"/arch_linux_profile.xml \
		"${pkgdir}"/usr/share/mysql-workbench/mysql.profiles/Arch_Linux_\(MariaDB\).xml
}

