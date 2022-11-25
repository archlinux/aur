# Maintainer: bipin Kumar <bipin@ccmb.res.in>
pkgname=subread
pkgver=2.0.3
pkgrel=1
pkgdesc="a general-purpose read aligner which can align both genomic DNA-seq and RNA-seq reads, https://doi.org/10.1093/nar/gkt214"
arch=(x86_64)
url="https://subread.sourceforge.net/"
license=('GPL')
depends=('glibc' 'zlib')
source=($pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/subread/files/subread-$pkgver/subread-$pkgver-source.tar.gz)
sha256sums=('56CEF3A2F914D432713069D5C282F48831C3A1ECC89432AD5580CAA322A5F56B')


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
	  mkdir "$pkgdir"/usr/	  
	  mkdir "$pkgdir"/usr/bin
	  mkdir "$pkgdir"/usr/lib/
	  mkdir "$pkgdir"/usr/lib/subread
	  mv -f "${srcdir}/$pkgname-$pkgver-source/bin/utilities/"  "${pkgdir}/usr/lib/subread"
	  rm -Rf "${srcdir}/$pkgname-$pkgver-source/bin/utilities/"
	  mv -f "${srcdir}/$pkgname-$pkgver-source/bin/" "${pkgdir}/usr/bin"
	  install -D -m644 "${srcdir}/$pkgname-$pkgver-source/doc/SubreadUsersGuide.pdf" -t "$pkgdir/usr/share/doc/subread/"
	  install -D -m644 "${srcdir}/$pkgname-$pkgver-source/LICENSE" -t "$pkgdir/usr/share/licenses/subread/"
}
