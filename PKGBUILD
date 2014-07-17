# Maintainer: Jochen Schalanda <jochen+aur (at) schalanda.name>
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
pkgname=dpkg
pkgver=1.16.15
pkgrel=1
pkgdesc="The Debian Package Manager.  Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="http://packages.debian.org/${pkgname}"
license=('GPL')
depends=('bzip2' 'xz' 'zlib' 'ncurses')
makedepends=('gcc' 'make' 'perl' 'pkg-config' 'perl-io-string' 'perl-timedate')
optdepends=('fakeroot')
replaces=(dpkg-ubuntu)
conflicts=(dpkg-ubuntu)
source=(
	http://ftp.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
	dpkg-gzip-rsyncable.patch
)
md5sums=('0e7d105a57839cdab2b0bf5e3612442f'
         '5ab63758999e9bb10f84bce79a0307b2')

build() {
	cd "${pkgname}-${pkgver}"

	patch -p0 -i "${startdir}/dpkg-gzip-rsyncable.patch"

	# Build
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin \
		--disable-start-stop-daemon --disable-install-info --with-zlib --with-bz2 --with-liblzma
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Variables
	install -d "${pkgdir}/var/${pkgname}/updates/"
	touch ${pkgdir}/var/lib/${pkgname}/{status,available}
}
