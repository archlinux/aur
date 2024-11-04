# Maintainer: bipin Kumar <kbipinkumar@pm.me>
pkgname=subread
pkgver=2.0.8
pkgrel=1
pkgdesc="a general-purpose read aligner which can align both genomic DNA-seq and RNA-seq reads, https://doi.org/10.1093/nar/gkt214"
arch=(x86_64)
url="https://subread.sourceforge.net/"
license=('GPL')
depends=('glibc' 'zlib')
source=($pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/subread/files/subread-$pkgver/subread-$pkgver-source.tar.gz)
sha256sums=('cb5dadf71c850f128a8347223fe0ce19e1c17e3959e9f3eba90e8090671f8570')

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
