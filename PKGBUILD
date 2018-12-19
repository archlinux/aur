################################################################################
# Encoding: UTF-8                                                  Tab size: 4 #
#                                                                              #
#                  ARCH LINUX PACKAGE BUILD DESCRIPTION FILE                   #
#                                                                              #
# Ordnung muss sein!                             Copyleft (Ɔ) 2018, Arch Linux #
################################################################################
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# Contributor: Jack Black <ezamlinsky@gmail.com>

#==============================================================================#
#       Package information                                                    #
#==============================================================================#
pkgname=('attr-ebuild')
pkgoname=('attr')
pkgver=2.4.48
pkgrel=1
pkgdesc='Extended attribute support library for ACL support'
url='http://savannah.nongnu.org/projects/attr'
license=('LGPL')
arch=('x86_64')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=('glibc')
makedepends=('gettext')

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('xfsattr' 'attr')
conflicts=('xfsattr' 'attr')
replaces=('xfsattr' 'attr')

#==============================================================================#
#       Package miscellaneous options                                          #
#==============================================================================#
backup=('etc/xattr.conf')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
source=(
	"https://download.savannah.gnu.org/releases/$pkgoname/$pkgoname-$pkgver.tar.gz"
	"https://download.savannah.gnu.org/releases/$pkgoname/$pkgoname-$pkgver.tar.gz.sig"
)
sha256sums=(
	'5ead72b358ec709ed00bbf7a9eaef1654baad937c001c044fe8b74c57f5324e7'
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
	)

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
