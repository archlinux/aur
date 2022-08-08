# Maintainer: Chinmay Dalal <00foahcd7@mozmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=autoconf2.69
pkgver=2.69
pkgrel=8
pkgdesc="A GNU tool for automatically configuring source code (Legacy 2.69 version)"
arch=('any')
license=('GPL2' 'GPL3' 'custom')
url="https://www.gnu.org/software/autoconf"
groups=('base-devel')
depends=('awk' 'm4' 'diffutils' 'perl' 'sh')
makedepends=('help2man')  # needed while perl patch is present
checkdepends=('gcc-fortran')
source=("https://ftp.gnu.org/pub/gnu/autoconf/autoconf-${pkgver}.tar.xz"
        '0001-autoconf-2.69-perl-5.22-autoscan.patch'
        '0002-autoconf-2.69-perl-5.28.patch'
        '0003-autoconf-2.69-libtool-compatibility.patch'
        '0004-Port-tests-to-Bash-5.patch')
md5sums=('50f97f4159805e374639a73e2636f22e'
         'aa07afe5a671df25bf1878831702d5b9'
         'f450ce6001458d800907e5d4ad8023fb'
         '87bceda7922ebc2a453568b2ae179e1b'
         'd656c3a43462f678cf72848ca16ad6e2')
conflicts=('autoconf')


prepare() {
	cd autoconf-"${pkgver}"

	# fix incompatibility with recent perl
	patch -p1 -i "$srcdir"/0001-autoconf-2.69-perl-5.22-autoscan.patch
	patch -p1 -i "$srcdir"/0002-autoconf-2.69-perl-5.28.patch

	# fix tesetsuite failures with recent libtool
	patch -p1 -i "$srcdir"/0003-autoconf-2.69-libtool-compatibility.patch

	patch -p1 -i "$srcdir"/0004-Port-tests-to-Bash-5.patch
}

build() {
	cd autoconf-"${pkgver}"
	./configure --prefix=/usr --program-suffix=-2.69
	make
}

check() {
	cd "${srcdir}/autoconf-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/autoconf-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# license exception
	install -Dm644 COPYING.EXCEPTION "$pkgdir"/usr/share/licenses/autoconf/COPYING.EXCEPTION

	# remove unwanted file
	rm -f "$pkgdir"/usr/share/info/standards.info

	mv "${pkgdir}"/usr/share/info/autoconf{,-2.69}.info
}
