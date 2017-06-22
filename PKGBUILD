# Maintainer: Loic Blot <https://www.unix-experience.fr>
pkgname=luasandbox-extensions
pkgver=2017.06.11
pkgrel=2
pkgdesc="Extension packages (sandboxes and modules) for the lua_sandbox project"
_pkgver="sprint_May29_Jun11"
source=("https://github.com/mozilla-services/lua_sandbox_extensions/archive/${_pkgver}.tar.gz")
sha256sums=('2ddd1015ca828c6e771a0100cf03aa7bc887674dd2d532113fcf0003ef216df5')
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('cmake' 'parquet-cpp')
depends=("libluasandbox" "parquet-cpp")

_buildroot="release"
build() {
	cd lua_sandbox_extensions-${_pkgver}
	for _module in geoip postgres snappy socket struct systemd; do
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
		-DEXT_cuckoo_filter=true \
		-DEXT_geoip=true \
		-DEXT_heka=true \
		-DEXT_lsb=true \
		-DEXT_moz_pioneer=true \
		-DEXT_moz_telemetry=true \
		-DEXT_postgres=true \
		-DEXT_snappy=true \
		-DEXT_socket=true \
		-DEXT_struct=true \
		-DEXT_syslog=true \
		-DEXT_systemd=true
# Build/Dep problem
#		-DEXT_parquet=true
#		-DEXT_kafka=true
#		-DEXT_jose=true
#		-DEXT_hyperloglog=true
#		-DEXT_lpeg=true
#		-DEXT_openssl=true
# Install dir problem on build
#		-DEXT_cjson=true \
#		-DEXT_lfs=true
#		-DEXT_rjson=true
#		-DEXT_sax=true
#		-DEXT_ssl=true
	make
}

package() {
	cd lua_sandbox_extensions-${_pkgver}/${_buildroot}
	make install
	for _module in geoip postgres snappy socket struct systemd; do
		cd ${_module}/ep_${_module}-prefix/src/ep_${_module}-build && make install && cd ../../../..
	done
}
