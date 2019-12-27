# Maintainer: Eduardo Machado <mawcomw at gmail dot com>
# Maintainer: Carlos Loio <carlosloio.cl.30 at gmail dot com>

pkgname=maxscale
pkgver=2.4.2
pkgrel=1
pkgdesc="An intelligent database proxy."
arch=('x86_64')
url="https://mariadb.com"
license=('MariaDB Business Source License (BSL)')
groups=('')

#makedepends=(gcc-c++ ncurses-devel bison flex glibc-devel cmake libgcc perl make libtool
#		openssl-devel libaio libaio-devel librabbitmq-devel libcurl-devel pcre-devel)
makedepends=('cmake' 'make' 'librabbitmq-c' 'jansson' 'avro-c' 'nodejs' 'npm' 'sqlite')
#depends=('aarch64-linux-gnu-gcc' 'curl' 'gnutls' 'libedit' 'libgcrypt' 'libutil-linux' 'openssl' 'pam' 'sqlite' 'systemd-libs' 'xz' 'zlib')
depends=('logrotate')

#options=('!strip' '!emptydirs')

#install=${pkgname}.install

#source=("https://github.com/mariadb-corporation/MaxScale/archive/maxscale-2.4.2.tar.gz"
source=("https://github.com/mariadb-corporation/MaxScale/archive/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}.install"
	"maxscale.service"
	"maxscale.logrotate")

sha512sums=('098c66e74c707f2dda84e6a4b61d97c1b3fd654415e8c6bb787528f7306da89cb470a615bdf4bc4e7d2c4570fb0978b76ecaf7f409fdb19f9cdd09eb5fabe4e5'
	'2f5a6cd9c59b1c60f1f2f88795ee6b951aaf76e2ac94719d72de099027bf51a76e9685a69244deb1c0ad6f4af3dad5567f345b5c5da7341281273d0bfbdfc363'
	'102976553dbc65a91c81eef78f05796a9306c374360207b711c59da7dc63a35545c2e62fd05d0d1ef8bb1d973302d7e3d787e3a8358fb04591066a09df9a69b9'
	'36f3b50850eaa1ed37fb3002264f5cd2be0f3a5382c3ed245ffe9977c637c27191114dff418ba241eb553722aed3ff5316fc9335f4185b55dfda1a77fdc7f769')

build(){
	if [[ ! -d "MaxScale-${pkgname}-${pkgver}" ]]; then
		mv MaxScale-${pkgname}-${pkgver} ${pkgname}-${pkgver}
	fi
	#find -type d -name MaxScale-${pkgname}-${pkgver} -exec mv {} ${pkgname}-${pkgver} \;
	mkdir -p $srcdir/build
	cd $srcdir/build
	# Install deps (not needed in Arch =)
	#../MaxScale/BUILD/install_build_deps.sh
	
	cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr \
		  -DAVRO_LIBRARIES=/usr/lib/libavro.so -DAVRO_INCLUDE_DIR=/usr/include/avro \
		  -DRABBITMQ_LIBRARIES=/usr/lib/librabbitmq.so -DRABBITMQ_HEADERS=/usr/include \
		  -DWITH_MAXSCALE_CNF=N \
		  -DBUILD_CDC=Y \
		  -DWITH_SCRIPTS=N
	make
}

package(){
	echo "PACKAGE ---> START!"
	
	# Create directories
	install -dm755 "${pkgdir}"/etc/"${pkgname}"
	install -dm755 "${pkgdir}"/usr/lib/"${pkgname}"
	install -dm755 "${pkgdir}"/usr/share/"${pkgname}"
	install -dm755 "${pkgdir}"/usr/share/doc/"${pkgname}"
	#mkdir -p $pkgdir/usr/share/${pkgname}
	#mkdir -p $pkgdir/usr/share/doc/${pkgname}
	
	#Enter the SRC directory
	#cd $srcdir/${pkgname}-${pkgver}
	cd "${srcdir}"/build
	# BUILD!	
	make DESTDIR="${pkgdir}" install -C .
	
	cp -R "${srcdir}"/"${pkgname}"-"${pkgver}"/Documentation/* "${pkgdir}"/usr/share/doc/"${pkgname}"
	rm "${pkgdir}"/usr/share/"${pkgname}"/maxscale_logrotate
	mv "${pkgdir}"/usr/share/"${pkgname}"/maxscale.cnf.template "${pkgdir}"/etc/"${pkgname}"/maxscale.cnf
	mv "${pkgdir}"/usr/share/"${pkgname}"/lsyncd_example.conf "${pkgdir}"/etc/"${pkgname}"/lsyncd_example.conf
	mv "${pkgdir}"/usr/share/"${pkgname}"/maxscale_binlogserver_template.cnf "${pkgdir}"/etc/"${pkgname}"/maxscale_binlogserver_template.cnf
	
	# MAXSCALE_VARDIR is an absolute path to /var by default
	mkdir -p "${pkgdir}"/var/cache/maxscale
	mkdir -p "${pkgdir}"/var/lib/maxscale
	mkdir -p "${pkgdir}"/var/log/maxscale
	mkdir -p "${pkgdir}"/var/run/maxscale
	
	# INSTALL aditional scripts
	install -D -m644 "${srcdir}/maxscale.service" "${pkgdir}/usr/lib/systemd/system/maxscale.service"
	install -D -m644 "${srcdir}/maxscale.logrotate" "${pkgdir}/etc/logrotate.d/maxscale"
	
	install -D -m644 "${srcdir}/${pkgname}"-"${pkgver}/LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${srcdir}/${pkgname}"-"${pkgver}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	echo "PACKAGE ---> END!"
}
