# Maintainer: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
pkgname=jameica-nightly
pkgver=2.7.0
pkgrel=1
pkgdesc="Jameica Plattform"
arch=(armv6h armv7h aarch64 i686 x86_64)
url="http://www.willuhn.de/products/jameica/"
license=('GPL')
depends=('java-runtime>=1.6')
makedepends=('unzip')
conflicts=(jameica)
source=("http://www.willuhn.de/products/jameica/releases/nightly/jameica-$pkgver-nightly-linux64.zip" "jameica.desktop")
md5sums=('SKIP'
         'c5915975edcf2ef695f57e93983ebbe6')

if [ "$CARCH" = "armv6h" ] || [ "$CARCH" = "armv7h" ] || [ "$CARCH" = "aarch64" ]; then
	depends+=(swt)
fi

package() {
	mkdir -p ${pkgdir}/usr/share/{java/jameica,applications}
	cp -R "${srcdir}/jameica" "${pkgdir}/usr/share/java"
	
	if [ "$CARCH" = "armv6h" ] || [ "$CARCH" = "armv7h" ] || [ "$CARCH" = "aarch64" ]; then

		# remove local swt lib
		rm -rf ${pkgdir}/usr/share/java/jameica/lib/swt/linux64

		# adjust classpath in order to use system swt
		unzip ${pkgdir}/usr/share/java/jameica/jameica-linux64.jar -d ${pkgdir}/usr/share/java/jameica/unzipped
		sed -i 's|lib/swt/linux64/swt.jar|/usr/share/java/swt.jar|g' ${pkgdir}/usr/share/java/jameica/unzipped/META-INF/MANIFEST.MF

		pushd ${pkgdir}/usr/share/java/jameica/unzipped
		zip -r ../jameica-linux64.jar *
		popd

		# remove dead bodies
		rm -rf ${pkgdir}/usr/share/java/jameica/unzipped

		# link jameica-linux64.jar to jameica-linux.jar 
		ln -s /usr/share/java/jameica/jameica-linux64.jar ${pkgdir}/usr/share/java/jameica/jameica-linux.jar

	fi
	
	install -m 644 ${srcdir}/jameica.desktop ${pkgdir}/usr/share/applications
}