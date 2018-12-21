################################################################################
# Encoding: UTF-8                                                  Tab size: 4 #
#                                                                              #
#                  ARCH LINUX PACKAGE BUILD DESCRIPTION FILE                   #
#                                                                              #
# Ordnung muss sein!                             Copyleft (Ɔ) 2018, Arch Linux #
################################################################################
# Maintainer: Sébastien "Seblu" Luttringer <seblu@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Jack Black <ezamlinsky@gmail.com>

#==============================================================================#
#       Package information                                                    #
#==============================================================================#
pkgname=('less-ebuild')
pkgoname=('less')
pkgver=530
pkgrel=1
pkgdesc='A terminal based program for viewing text files'
url='http://www.greenwoodsoftware.com/less'
license=('GPL3')
arch=('x86_64')
groups=('base')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=(

	# Mandatory
	'glibc' 'ncurses'

	# Optional
	'+pcre'
)

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('less')
conflicts=('less')
replaces=('less')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
source=(
	"http://www.greenwoodsoftware.com/less/less-$pkgver.tar.gz"
	"less-$pkgver.tar.gz::http://www.greenwoodsoftware.com/less/less-$pkgver.sig"
)
md5sums=(
	'6a39bccf420c946b0fd7ffc64961315b'
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
		'--with-secure'
	)

	# FORMAT: 'package_name ? enabled_features : disabled_features' is similar
	# to bash shell operator 'let expr ? val1 : val2' and supports &, |, ^, !
	# operations with package names to make complex package rules.
	# Use space, tab or new line to distinguish multiple options.
	# Use keyword 'null' for empty set.
	custom_opts=(
		'pcre ? --with-regex=pcre : --with-regex=gnu'
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
}

################################################################################
#                                 END OF FILE                                  #
################################################################################
