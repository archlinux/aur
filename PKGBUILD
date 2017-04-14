# Maintainer: Pablo Lezaeta Reyes <prflr88 arro'a gmail puntocom>
# Contributor: izmntuk

pkgname=ufsutils
pkgver=8.2
pkgrel=1
pkgdesc='FFS/UFS/UFS2 filesystem utilities from FreeBSD'
license=('BSD')
arch=('i686' 'x86_64')
depends=('libbsd' 'libedit')
conflicts=('ufs-tools')
url='https://packages.debian.org/sid/ufsutils'
source=('https://mirrors.kernel.org/debian/pool/main/u/ufsutils/ufsutils_8.2.orig.tar.gz'
	'https://mirrors.kernel.org/debian/pool/main/u/ufsutils/ufsutils_8.2-3.debian.tar.gz')
sha1sums=('ee80e5bc295bdc7d6f84b8daba7891e85c6c4f15'
	  '82aec62e649e458e72a59edf564db71c9e604adf')

prepare() {
	cd "${pkgname}-${pkgver}"
	for i in ../debian/patches/*.patch;do patch -p1 -i ${i};done

	sed -e "s:^\(prefix = \)\(.*\):\1${EPREFIX}usr:" \
	    -e "s:^\(libdir = \$(exec_prefix)\/\)\(.*\):\1$(get_libdir):" \
	    -i "Makefile.common"
}

build() {
	make DESTDIR="${pkgdir}" prefix="/usr" \
		sbindir="/usr/bin" bindir="/usr/bin" \
		libdir="/usr/lib" libexecdir="/usr/lib/${pkgname}" \
		-C "${pkgname}-${pkgver}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib"
	install -d "${pkgdir}/usr/share/man/man8"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	make DESTDIR="${pkgdir}" prefix="/usr" \
		sbindir="/usr/bin" \
		bindir="/usr/bin" \
		libdir="/usr/lib" \
		libexecdir="/usr/lib/${pkgname}" \
		install
	install -Dm644 ../debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	install -m644 ../debian/TODO "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 ../debian/changelog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog"
}
