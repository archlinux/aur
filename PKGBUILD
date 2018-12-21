################################################################################
# Encoding: UTF-8                                                  Tab size: 4 #
#                                                                              #
#                  ARCH LINUX PACKAGE BUILD DESCRIPTION FILE                   #
#                                                                              #
# Ordnung muss sein!                             Copyleft (Ɔ) 2018, Arch Linux #
################################################################################
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jack Black <ezamlinsky@gmail.com>

#==============================================================================#
#       Package information                                                    #
#==============================================================================#
pkgname=('openssl-ebuild')
pkgoname=('openssl')
pkgver=1.1.1.a
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
url='https://www.openssl.org'
license=('custom:BSD')
arch=('x86_64')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=(

	# Mandatory
	'glibc' 'perl'

	# Optional
	'-lksctp-tools' '+zlib'
)
optdepends=('ca-certificates')

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('openssl')
conflicts=('openssl')
replaces=('openssl')

#==============================================================================#
#       Package miscellaneous options                                          #
#==============================================================================#
backup=('etc/ssl/openssl.cnf')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
_ver=1.1.1a
source=(
	"https://www.openssl.org/source/$pkgoname-$_ver.tar.gz"
	"https://www.openssl.org/source/$pkgoname-$_ver.tar.gz.asc"
	'ca-dir.patch'
)
sha256sums=(
	'fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5d71d9ffed3f9f41'
	'SKIP'
	'0938c8d68110768db4f350a7ec641070686904f2fe7ba630ac94399d7dc8cc5e'
)

#==============================================================================#
#       Package preparation sequence                                           #
#==============================================================================#
prepare() {

	# Change directory to source directory
	cd $pkgoname-$_ver

	# Apply patches
	patch -p0 -i $srcdir/ca-dir.patch
}

#==============================================================================#
#       Package building sequence                                              #
#==============================================================================#
build() {

	# Change directory to source directory
	cd $pkgoname-$_ver

	# Default configure options
	config_opts=(
		'--prefix=/usr'
		'--libdir=lib'
		'--openssldir=/etc/ssl'
		'--release'
		'threads'
		'shared'
		'enable-ec_nistp_64_gcc_128'
		'enable-heartbeats'
		'no-ssl3-method'
	)

	# FORMAT: 'package_name ? enabled_features : disabled_features' is similar
	# to bash shell operator 'let expr ? val1 : val2' and supports &, |, ^, !
	# operations with package names to make complex package rules.
	# Use space, tab or new line to distinguish multiple options.
	# Use keyword 'null' for empty set.
	custom_opts=(
		'zlib ? zlib-dynamic : no-zlib'
		'lksctp-tools ? sctp : no-sctp'
	)

	# Modify package configuration
	modify "${custom_opts[@]}"

	# Run package configuration script
	./config "${config_opts[@]}"

	# Build package
	make
}

#==============================================================================#
#       Package self testing sequence                                          #
#==============================================================================#
check() {

	# Change directory to source directory
	cd $pkgoname-$_ver

	# The test fails due to missing write permissions in /etc/ssl
	# Revert this patch for make test
	patch -p0 -R -i $srcdir/ca-dir.patch

	# Run internal checks
	make -k test

	# Apply patches again
	patch -p0 -i $srcdir/ca-dir.patch
}

#==============================================================================#
#       Package installation sequence                                          #
#==============================================================================#
package() {

	# Change directory to source directory
	cd $pkgoname-$_ver

	# Install files
	make DESTDIR=$pkgdir MANSUFFIX=ssl install

	# Install license file
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/openssl/LICENSE
}

################################################################################
#                                 END OF FILE                                  #
################################################################################
