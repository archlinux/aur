# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=p7zip
pkgver=9.20.1
pkgrel=1
pkgdesc='Command-line version of the 7zip compressed file archiver'
arch=('i686' 'x86_64')
license=('GPL')
url='http://p7zip.sourceforge.net/'
makedepends=('yasm' 'nasm')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}_src_all.tar.bz2")
sha1sums=('1cd567e043ee054bf08244ce15f32cb3258306b7')

build() {
	cd "${srcdir}/${pkgname}_${pkgver}"

	[[ $CARCH = x86_64 ]] \
	&& cp makefile.linux_amd64_asm makefile.machine \
	|| cp makefile.linux_x86_asm_gcc_4.X makefile.machine
	sed -i "s|usr/local|usr|g" makefile

	make all3 OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}/${pkgname}_${pkgver}"

	make install \
		DEST_HOME="${pkgdir}/usr" \
		DEST_MAN="${pkgdir}/usr/share/man" \
		DEST_SHARE_DOC="http://www.bugaco.com/7zip"

	sed "s|${pkgdir}/usr|/usr|g" -i "${pkgdir}"/usr/bin/7z{,a,r}
	install -Dm755 contrib/VirtualFileSystemForMidnightCommander/u7z "${pkgdir}"/usr/lib/mc/extfs.d/u7z
}
