# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-legacy-imap
pkgver=8.2.29
pkgrel=1
pkgdesc="PHP legacy extension for imap (excluded from official php packages)"
arch=('x86_64')
license=('PHP-3.01')
url='https://www.php.net/'
depends=('php-legacy' 'c-client' 'libxcrypt')
source=(
  "https://php.net/distributions/php-${pkgver}.tar.xz"
)
sha256sums=('475f991afd2d5b901fb410be407d929bc00c46285d3f439a02c59e8b6fe3589c')
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
		--sysconfdir=/etc/php-legacy \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php-legacy \
		--with-config-file-scan-dir=/etc/php-legacy/conf.d \
		--disable-rpath \
		--mandir=/usr/share/man \
		--libdir=/usr/lib/php-legacy \
		--datarootdir=/usr/share/php-legacy \
		--datadir=/usr/share/php-legacy \
		--program-suffix=-legacy \
		--includedir=/usr/include/php-legacy \
		--disable-gcc-global-regs \
		"

	local _phpextensions="\
		--with-imap-ssl \
		--with-imap=shared
		--with-kerberos
		"

	EXTENSION_DIR=/usr/lib/php-legacy/modules
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
	install -D -m755 "${srcdir}/build/modules/imap.so" "${pkgdir}/usr/lib/php-legacy/modules/imap.so"
}
