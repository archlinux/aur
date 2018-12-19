################################################################################
# Encoding: UTF-8                                                  Tab size: 4 #
#                                                                              #
#                  ARCH LINUX PACKAGE BUILD DESCRIPTION FILE                   #
#                                                                              #
# Ordnung muss sein!                             Copyleft (Ɔ) 2018, Arch Linux #
################################################################################
# Maintainer: Dan McGee <dan@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Jack Black <ezamlinsky@gmail.com>

#==============================================================================#
#       Package information                                                    #
#==============================================================================#
pkgname=('pacman-test')
pkgver=5.1.1
pkgrel=1
pkgdesc='A library-based package manager with dependency support (new features testing)'
url='http://www.archlinux.org/pacman/'
license=('GPL')
arch=('x86_64')
groups=('base' 'base-devel')

#==============================================================================#
#       Package dependencies                                                   #
#==============================================================================#
depends=('archlinux-keyring' 'bash' 'glibc' 'libarchive' 'pacman-mirrorlist' 'curl' 'gpgme' 'openssl')
makedepends=('asciidoc')
checkdepends=('python2' 'fakechroot')
optdepends=('perl-locale-gettext: translation support in makepkg-template')

#==============================================================================#
#        Package relations                                                     #
#==============================================================================#
provides=('pacman')
conflicts=('pacman')

#==============================================================================#
#       Package miscellaneous options                                          #
#==============================================================================#
backup=('etc/pacman.conf' 'etc/makepkg.conf')

#==============================================================================#
#       Package sources and integrity                                          #
#==============================================================================#
source=(
	"git://github.com/ezamlinsky/pacman.git"
	'pacman.conf'
	'makepkg.conf'
)
validpgpkeys=(
	'6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'	# Allan McRae <allan@archlinux.org>
	'B8151B117037781095514CA7BBDFFC92306B1121'	# Andrew Gregory (pacman) <andrew@archlinux.org>
)
sha256sums=(
	'SKIP'
	'b82e9c1073292766c2f49b5c771dddf37383f1151117ef9cd5e0c11047b4f3eb'
	'650ddad24cad6afc4aecb4829cb8f06b9acb70c10a44f756fe8bd279949b518e'
)

#==============================================================================#
#       Package preparation sequence                                           #
#==============================================================================#
prepare() {

	# Change directory to source directory
	cd pacman

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
	cd pacman

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
		'--enable-git-version'
		'--disable-static'
		'--disable-debug'
		'--enable-doc'
		'--disable-doxygen'
		'--with-scriptlet-shell=/usr/bin/bash'
		'--with-ldconfig=/usr/bin/ldconfig'
		'--with-libcurl'
		'--with-gpgme'
		'--with-crypto=openssl'
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
#       Package self testing sequence                                          #
#==============================================================================#
check() {

	# Change directory to source directory
	cd pacman

	# Run internal checks
	make -k check
}

#==============================================================================#
#       Package installation sequence                                          #
#==============================================================================#
package() {

	# Change directory to source directory
	cd pacman

	# Install files
	make DESTDIR=$pkgdir install

	# Change directory to target directory
	cd $pkgdir

	# Install Arch specific stuff
	install -Dm644 $srcdir/pacman.conf etc/pacman.conf
	install -Dm644 $srcdir/makepkg.conf etc/makepkg.conf
}

################################################################################
#                                 END OF FILE                                  #
################################################################################
