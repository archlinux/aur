# Contributor: johnnybash <georgpfahler@wachenzell.org>
# Contributor: r20d20 <r20d20@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Square252 <square@0xfc.de>

pkgname=jameica-nightly
pkgver=2.11.0
pkgrel=1
pkgdesc="Jameica is a free Java application platform"
arch=('any')
url="http://www.willuhn.de/products/jameica/"
license=('GPL')
depends=('java-runtime>=1.6' 'bash' 'swt')
makedepends=('zip' 'unzip')
conflicts=('jameica')
source=("http://www.willuhn.de/products/jameica/releases/nightly/jameica-linux64-$pkgver-nightly.zip" "jameica.desktop")
sha256sums=('SKIP'
            'b0221e7463407243d2922107d0de4c437e2037ab0639e2961c443db4f15725fc')

package() {
  install -d "$pkgdir"/usr/share/{java/jameica,applications}
  cp -R "$srcdir"/jameica "$pkgdir"/usr/share/java
  # remove local swt lib
  rm -rf "$pkgdir"/usr/share/java/jameica/lib/swt/linux64

  # adjust classpath in order to use system swt
  unzip "$pkgdir"/usr/share/java/jameica/jameica-linux64.jar \
	  -d "$pkgdir"/usr/share/java/jameica/unzipped
  sed -i 's|lib/swt/linux64/swt.jar|/usr/share/java/swt.jar|g' \
	  "$pkgdir"/usr/share/java/jameica/unzipped/META-INF/MANIFEST.MF

  pushd "$pkgdir"/usr/share/java/jameica/unzipped
  zip -r ../jameica-linux64.jar *
  popd

  # remove dead bodies
  rm -rf "$pkgdir"/usr/share/java/jameica/unzipped
  # link jameica-linux64.jar to jameica-linux.jar
  ln -s /usr/share/java/jameica/jameica-linux64.jar \
    "$pkgdir"/usr/share/java/jameica/jameica-linux.jar

  install -m 644 "$srcdir"/jameica.desktop "$pkgdir"/usr/share/applications
}
