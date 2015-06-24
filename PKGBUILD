# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Felix Kauselmann <licorn@gmail.com>

pkgname=yacreader-backend-p7zip
pkgver=9.20.1
pkgrel=2
pkgdesc='a subset of shared object files from p7zip 9.20.1 for use with YACReader'
url='http://p7zip.sourceforge.net/'
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'bash')
makedepends=('yasm' 'nasm' 'wxgtk2.8')
source=("http://downloads.sourceforge.net/project/p7zip/p7zip/${pkgver}/p7zip_${pkgver}_src_all.tar.bz2")
sha256sums=('49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782')

options=('!makeflags')

prepare() {
	cd "${srcdir}/p7zip_${pkgver}"
	rm GUI/kde4/p7zip_compress.desktop
	[[ $CARCH = x86_64 ]] \
	&& cp makefile.linux_amd64_asm makefile.machine \
	|| cp makefile.linux_x86_asm_gcc_4.X makefile.machine

	sed -i 's/wx-config/wx-config-2.8/g' CPP/7zip/TEST/TestUI/makefile \
		CPP/7zip/UI/{FileManager,GUI,P7ZIP}/makefile
}

build() {
	cd "${srcdir}/p7zip_${pkgver}"
	make all4 OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}/p7zip_${pkgver}"
	install -d "${pkgdir}"/usr/lib/yacreader
	install -d "${pkgdir}"/usr/lib/yacreader/Codecs
	install -m555 bin/7z.so "${pkgdir}"/usr/lib/yacreader
	install -m555 bin/Codecs/Rar29.so "${pkgdir}"/usr/lib/yacreader/Codecs
}
