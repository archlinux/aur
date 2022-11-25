# Maintainer: bipin Kumar <bipin@ccmb.res.in>
pkgname=subread
pkgver=2.0.3
pkgrel=2
pkgdesc="a general-purpose read aligner which can align both genomic DNA-seq and RNA-seq reads, https://doi.org/10.1093/nar/gkt214"
arch=(x86_64)
url="https://subread.sourceforge.net/"
license=('GPL')
depends=('glibc' 'zlib')
source=($pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/subread/files/subread-$pkgver/subread-$pkgver-source.tar.gz)
sha256sums=('56cef3a2f914d432713069d5c282f48831c3a1ecc89432ad5580caa322a5f56b')

prepare() {
	cd "$pkgname-$pkgver-source/src"
	sed -i 's/-mtune=core2/-mtune=generic/g' Makefile.Linux
	cd longread-one
	sed -i 's/-mtune=core2/-mtune=generic/g' Makefile
}

build() {
	cd "$pkgname-$pkgver-source/src"
	make -f Makefile.Linux PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/bin
	cd ..
}

package() {
	  install -d  "$pkgdir"/usr/lib/subread
	  mv -f "${srcdir}/$pkgname-$pkgver-source/bin/utilities/"  "${pkgdir}/usr/lib/subread"
	  rm -Rf "${srcdir}/$pkgname-$pkgver-source/bin/utilities/"
	  mv -f "${srcdir}/$pkgname-$pkgver-source/bin/" "${pkgdir}/usr/"
	  install -D -m644 "${srcdir}/$pkgname-$pkgver-source/doc/SubreadUsersGuide.pdf" -t "$pkgdir/usr/share/doc/subread/"
	  install -D -m644 "${srcdir}/$pkgname-$pkgver-source/LICENSE" -t "$pkgdir/usr/share/licenses/subread/"
}
