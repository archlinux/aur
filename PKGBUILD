################################################################################
# Encoding: UTF-8                                                  Tab size: 4 #
#                                                                              #
#                  ARCH LINUX PACKAGE BUILD DESCRIPTION FILE                   #
#                                                                              #
# Ordnung muss sein!                             Copyleft (Ɔ) 2018, Arch Linux #
################################################################################
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jack Black <ezamlinsky@gmail.com>

#==============================================================================#
#       Package information                                                    #
#==============================================================================#
pkgname=('curl-ebuild')
pkgoname=('curl')
pkgver=7.63.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
url='https://curl.haxx.se'
license=('MIT')
arch=('x86_64')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=(

	# Mandatory
	'glibc'

	# Optional
	'-axtls' '-brotli' '-c-ares' '+ca-certificates' '-gnutls' '+krb5' '+libidn2'
	'-libldap' '-libmetalink' '+libnghttp2' '+libpsl' '-librtmp.so' '-libssh'
	'+libssh2' '-mbedtls' '-nettle' '-nspr' '-nss' '+openssl' '-polarssl'
	'-wolfssl' '+zlib'
)

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('libcurl.so')
conflicts=('curl')
replaces=('curl')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
source=(
	"https://curl.haxx.se/download/$pkgoname-$pkgver.tar.gz"
	"https://curl.haxx.se/download/$pkgoname-$pkgver.tar.gz.asc"
)
sha512sums=(
	'25ad69a1978de2178ac7a456e72152907203931ad895234c14781c27681ea2c5d6669794880c4ebae6e38b8014c6538bc88a6afec2c192210b6d491d60b8f691'
	'SKIP'
)

#==============================================================================#
#       Package preparation sequence                                           #
#==============================================================================#
prepare() {

	# Change directory to source directory
	cd $pkgoname-$pkgver

	# Run autogen script if exists
	if [ -x autogen.sh ]; then
		NOCONFIGURE=1 ./autogen.sh
	fi
}

#==============================================================================#
#       Package building sequence                                              #
#==============================================================================#
build() {

	# Change directory to source directory
	cd $pkgoname-$pkgver

	# Default configure options
	config_opts=(
		'--prefix=/usr'
		'--bindir=/usr/bin'
		'--sbindir=/usr/bin'
		'--libdir=/usr/lib'
		'--libexecdir=/usr/lib'
		'--sysconfdir=/etc'
		'--localstatedir=/var'
		'--enable-silent-rules'
		'--enable-shared'
		'--disable-static'
		'--enable-optimize'
		'--enable-symbol-hiding'
		'--disable-debug'
		'--disable-curldebug'
		'--enable-http'
		'--enable-ftp'
		'--enable-file'
		'--enable-proxy'
		'--enable-dict'
		'--enable-telnet'
		'--enable-tftp'
		'--enable-pop3'
		'--enable-imap'
		'--enable-smb'
		'--enable-smtp'
		'--enable-gopher'
		'--disable-manual'
		'--enable-libcurl-option'
		'--enable-ipv6'
		'--enable-versioned-symbols'
		'--enable-threaded-resolver'
		'--enable-pthreads'
		'--enable-verbose'
		'--enable-crypto-auth'
		'--enable-ntlm-wb'
		'--enable-unix-sockets'
		'--enable-cookies'
	)

	# FORMAT: 'package_name ? enabled_features : disabled_features' is similar
	# to bash shell operator 'let expr ? val1 : val2' and supports &, |, ^, !
	# operations with package names to make complex package rules.
	# Use space, tab or new line to distinguish multiple options.
	# Use keyword 'null' for empty set.
	custom_opts=(
		'axtls ? --with-axtls : --without-axtls'
		'brotli ? --with-brotli : --without-brotli'
		'c-ares ? --enable-ares : --disable-ares'
		'ca-certificates : --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt: --without-ca-bundle'
		'gnutls & nettle ? --enable-tls-srp --with-gnutls : --disable-tls-srp --without-gnutls'
		'krb5 ? --with-gssapi : --without-gssapi'
		'libidn2 ? --with-libidn2 : --without-libidn2'
		'libldap ? --enable-ldap --enable-ldaps --with-ldap-lib --with-lber-lib : --disable-ldap --disable-ldaps --without-ldap-lib --without-lber-lib'
		'libmetalink ? --with-libmetalink : --without-libmetalink'
		'libnghttp2 ? --with-nghttp2 : --without-nghttp2'
		'libpsl ? --with-libpsl : --without-libpsl'
		'librtmp.so ? --enable-rtsp --with-librtmp : --disable-rtsp --without-librtmp'
		'libssh ? --with-libssh : --without-libssh'
		'libssh2 ? --with-libssh2 : --without-libssh2'
		'mbedtls ? --with-mbedtls : --without-mbedtls'
		'nss & nspr ? --with-nss : --without-nss'
		'openssl ? --with-ssl --enable-openssl-auto-load-config : --without-ssl --disable-openssl-auto-load-config'
		'polarssl ? --with-polarssl : --without-polarssl'
		'wolfssl ? --with-wolfssl --with-cyassl : --without-wolfssl --without-cyassl'
		'zlib ? --with-zlib :--without-zlib'
	)

	# Modify package configuration
	modify "${custom_opts[@]}"

	# Run package configuration script
	./configure "${config_opts[@]}"

	# Set correct LDFLAGS to build a shared archive
	if [ -f libtool ]; then
		sed -e "s/ -shared / $LDFLAGS\0/g" -i libtool
	fi

	# Build package
	make
}

#==============================================================================#
#       Package installation sequence                                          #
#==============================================================================#
package() {

	# Change directory to source directory
	cd $pkgoname-$pkgver

	# Install files
	make DESTDIR=$pkgdir install
	make DESTDIR=$pkgdir install -C scripts

	# Install license file
	install -Dm644 COPYING $pkgdir/usr/share/licenses/curl/COPYING
}

################################################################################
#                                 END OF FILE                                  #
################################################################################
