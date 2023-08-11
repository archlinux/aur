# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-imap
pkgver=8.2.9
pkgrel=1
pkgdesc="PHP extension for imap (excluded from official php packages)"
arch=('x86_64')
license=('PHP')
url='https://www.php.net/'
depends=('php' 'c-client' 'libxcrypt')
source=(
  "https://php.net/distributions/php-${pkgver}.tar.xz"
)
sha256sums=('1e6cb77f997613864ab3127fbfc6a8c7fdaa89a95e8ed6167617b913b4de4765')
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
	install -D -m755 "${srcdir}/build/modules/imap.so" "${pkgdir}/usr/lib/php/modules/imap.so"
}
