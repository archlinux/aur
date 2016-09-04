# Contributor: Jochen Schalanda <jochen+aur (at) schalanda.name>
# Contributor: C. Dominik Bódi <dominik.bodi@gmx.de>
# Contributor: Pierre Carrier <pierre@spotify.com>
# Contributor: Thomas Dziedzic <gostrc (at) gmail>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: seblu <seblu+arch (at) seblu.net>
# Contributor: squiddo <squiddo (at) intheocean.net>
# Contributor: dront78 <dront78 (at) gmail.com>
# Contributor: hugelgupf <ckoch (at) cs.nmt.edu>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#
pkgname=dpkg-jessie
pkgver=1.17.27
pkgrel=2
pkgdesc="The Debian Package Manager.  Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="http://packages.debian.org/${pkgname//-jessie/}"
license=('GPL')
depends=('bzip2' 'xz' 'zlib' 'ncurses')
makedepends=('gcc' 'make' 'perl' 'pkg-config' 'perl-io-string' 'perl-timedate')
optdepends=('fakeroot')
replaces=(dpkg-ubuntu dpkg)
conflicts=(dpkg-ubuntu dpkg)
source=(
	http://ftp.debian.org/debian/pool/main/d/${pkgname//-jessie/}/${pkgname//-jessie/}_${pkgver}.tar.xz
	dpkg-gzip-rsyncable.patch
)
md5sums=('6e2d761a3c4a9a9e1856337557ec1f9e'
         '71fd0c244ca1fc7132c708022ca50ef0')

build() {
	cd "${pkgname//-jessie/}-${pkgver}"

	patch -p0 -i "${startdir}/dpkg-gzip-rsyncable.patch"

	# Build
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--disable-start-stop-daemon --disable-install-info --with-zlib --with-bz2 --with-liblzma
	make
}

package() {
	cd "${pkgname//-jessie/}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Variables
	install -d "${pkgdir}/var/${pkgname//-jessie/}/updates/"
	touch ${pkgdir}/var/lib/${pkgname//-jessie/}/{status,available}
}
