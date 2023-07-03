# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-imap
pkgver=8.2.7
pkgrel=2
pkgdesc="PHP extension for imap (excluded from official php packages)"
arch=('x86_64')
license=('PHP')
url='https://www.php.net/'
makedepends=('apache' 'aspell' 'gdbm' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre2' 'libnsl'
             'oniguruma' 'patchelf')
checkdepends=('procps-ng')
source=(
  "https://php.net/distributions/php-${pkgver}.tar.xz"
)
sha256sums=('4b9fb3dcd7184fe7582d7e44544ec7c5153852a2528de3b6754791258ffbdfa0')
_interpreter=${pkgver%.*}

prepare() {
	cd "${srcdir}/php-${pkgver}"

	autoconf

	# Disable failing tests
	rm tests/output/stream_isatty_*.phpt
	rm Zend/tests/arginfo_zpp_mismatch*.phpt
}

build() {
	local _phpconfig="--srcdir=../php-${pkgver} \
		--config-cache \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/php \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php \
		--with-config-file-scan-dir=/etc/php/conf.d \
		--disable-rpath \
		--mandir=/usr/share/man \
		--libdir=/usr/lib/php \
		--datarootdir=/usr/share/php \
		--datadir=/usr/share/php \
		--includedir=/usr/include/php \
		--disable-gcc-global-regs \
		"

	local _phpextensions="\
		--with-imap-ssl \
		--with-imap=shared
		--with-kerberos
		"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR

	mkdir "${srcdir}/build"
	cd "${srcdir}/build"
	ln -s "../php-${pkgver}/configure"
	./configure ${_phpconfig} \
		--enable-embed=shared \
		${_phpextensions}
	make
}

package() {
	pkgdesc='imap module for PHP'
	depends=('php' 'c-client' 'libxcrypt')

	install -D -m755 "${srcdir}/build/modules/imap.so" "${pkgdir}/usr/lib/php/modules/imap.so"
}
