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
pkgname=('acl-ebuild')
pkgoname=('acl')
pkgver=2.2.53
pkgrel=1
pkgdesc='Access control list utilities, libraries and headers'
url='http://savannah.nongnu.org/projects/acl'
license=('LGPL')
arch=('x86_64')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=('attr' 'glibc')
makedepends=('gettext')

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('xfsacl' 'acl')
conflicts=('xfsacl' 'acl')
replaces=('xfsacl' 'acl')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
source=(
	"https://download.savannah.gnu.org/releases/$pkgoname/$pkgoname-$pkgver.tar.gz"
	"https://download.savannah.gnu.org/releases/$pkgoname/$pkgoname-$pkgver.tar.gz.sig"
)
sha256sums=(
	'06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7'
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
