# Package build for a patched PHP version containing pthreads support (https://homegear.eu/doc/en-US/html/sect-Homegear-Homegear_0.6_Documentation-Compiling-from-Source_Manual.html)
# Maintainer: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=('php7-homegear')
pkgdesc='Patched version of PHP for homegear'
pkgver=7.0.3
_pthreadversion=3.1.5
_pgkbase=php
pkgrel=1
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=()
depends=('gmp' 'enchant' 'libmcrypt' 'libedit openssl' 'libxml2')
source=("http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        "https://github.com/krakjoe/pthreads/archive/v${_pthreadversion}.tar.gz"
       )
sha256sums=('3af2b62617a0e46214500fc3e7f4a421067224913070844d3665d6cc925a1cca'
            'SKIP'
            'c6cf9457e9b7524a77b7767e59a918da1f63cc17428fa0d6f7fdab55fa5f37ed'
            )

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

        cd ext
	if [ ! -d "pthreads" ]; then
		mv ${srcdir}/pthreads-${_pthreadversion} ./pthreads
		sed -i 's/{ZEND_STRL("cli")}/{ZEND_STRL("homegear")}/g' pthreads/php_pthreads.c
	fi

	cd ..
	./buildconf --force
}

build() {
	local _phpconfig=" \
            --prefix /usr/share/homegear/php \
            --enable-embed=static --with-config-file-path=/etc/homegear --with-config-file-scan-dir=/etc/homegear/php.conf.d --includedir=/usr/include/php7-homegear --libdir=/usr/share/homegear/php --libexecdir=/usr/share/homegear/php/lib --datadir=/usr/share/homegear/php/share --program-suffix=-homegear --sysconfdir=/etc/homegear --localstatedir=/var --mandir=/usr/share/homegear/php/man --disable-debug --disable-rpath --with-pic --with-layout=GNU --enable-bcmath --enable-calendar --enable-ctype --without-gdbm --enable-inifile --enable-flatfile --enable-dom --with-enchant=/usr --enable-exif --with-gettext=/usr --with-gmp=/usr/include/ --enable-fileinfo --enable-filter --enable-ftp --enable-hash --enable-json --enable-pdo --enable-mbregex --enable-mbregex-backtrack --enable-mbstring --disable-opcache --enable-phar --enable-posix --with-mcrypt --enable-mysqlnd --enable-mysqlnd-compression-support --with-zlib-dir=/usr --with-openssl --with-libedit=/usr --enable-libxml --enable-session --enable-simplexml --enable-pthreads --with-xmlrpc --enable-soap --enable-sockets --enable-tokenizer --enable-xml --enable-xmlreader --enable-xmlwriter --with-mhash=yes --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-zip --disable-cli --disable-cgi --enable-pcntl --enable-maintainer-zts \
            "

	cd ${srcdir}/${_pkgbase}-${pkgver}
	./configure ${_phpconfig} \

	make

}



package() {

	cd ${srcdir}/${_pkgbase}-${pkgver}
	make -j1 INSTALL_ROOT=${pkgdir} install
	#install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/php/php.ini
	#install -d -m755 ${pkgdir}/etc/php/conf.d/


	mv ${pkgdir}/usr/include/php7-homegear/php/* ${pkgdir}/usr/include/php7-homegear/
	mkdir -p ${pkgdir}/usr/lib
	mv ${pkgdir}/usr/share/homegear/php/lib/libphp7.a ${pkgdir}/usr/lib/libphp7-homegear.a

	# remove empty directory
	rmdir ${pkgdir}/usr/include/php7-homegear/include
	rmdir ${pkgdir}/var/run
	rmdir ${pkgdir}/var/log
	rmdir ${pkgdir}/var
}
