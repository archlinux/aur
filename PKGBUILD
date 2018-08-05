# Maintainer: Loic Blot <https://www.unix-experience.fr>
pkgname=luasandbox-extensions
pkgver=2018.06.01
pkgrel=1
pkgdesc="Extension packages (sandboxes and modules) for the lua_sandbox project"
_pkgver="sprint2018-6"
source=("https://github.com/mozilla-services/lua_sandbox_extensions/archive/${_pkgver}.tar.gz")
sha256sums=('a4122ae9244c213f7324645ad0b4f15d18423c0960dc86deb032c03f237f570d')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake' 'parquet-cpp')
depends=("libluasandbox>=1.3.0" "parquet-cpp")

_buildroot="release"
build() {
	cd lua_sandbox_extensions-${_pkgver}
	for _module in cjson geoip lfs postgres rjson sax snappy socket ssl struct systemd; do
		sed "/UPDATE_COMMAND/a\\
INSTALL_COMMAND \"\"" -i ${_module}/CMakeLists.txt
	done
	mkdir $_buildroot
	cd $_buildroot
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
		-DCMAKE_INSTALL_LIBDIR=${pkgdir}/usr/lib \
		-DINSTALL_IOMODULE_PATH_FIXED=${_tmp_io_modules_installdir} \
		-DCMAKE_INSTALL_DATAROOTDIR=${pkgdir}/usr/lib \
		-DEXT_bloom_filter=true \
		-DEXT_circular_buffer=true \
		-DEXT_cjson=true \
		-DEXT_cuckoo_filter=true \
		-DEXT_geoip=true \
		-DEXT_heka=true \
		-DEXT_lfs=true \
		-DEXT_lsb=true \
		-DEXT_moz_pioneer=true \
		-DEXT_moz_telemetry=true \
		-DEXT_postgres=true \
		-DEXT_sax=true \
		-DEXT_snappy=true \
		-DEXT_socket=true \
		-DEXT_struct=true \
		-DEXT_ssl=true \
		-DEXT_syslog=true \
		-DEXT_systemd=true
# Build/Dep problem
#		-DEXT_parquet=true
#		-DEXT_kafka=true
#		-DEXT_jose=true
#		-DEXT_hyperloglog=true
#		-DEXT_lpeg=true
#		-DEXT_openssl=true
#		-DEXT_rjson=true \
# Install dir problem on build
	make
}

package() {
	cd lua_sandbox_extensions-${_pkgver}/${_buildroot}
	make install
	for _module in cjson geoip lfs sax postgres rjson snappy socket ssl struct systemd; do
		cd ${_module}/ep_${_module}-prefix/src/ep_${_module}-build && make install && cd ../../../..
	done
}
