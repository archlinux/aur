# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui
pkgver=1.2.0
pkgrel=1
pkgdesc='A standalone graphical utility that displays Java source codes of .class files'
arch=('any')
url='http://jd.benow.ca/'
license=('GPL3')
depends=('java-runtime')
makedepends=('gradle')
provides=('jd-gui')
conflicts=('jd-gui-bin')
source=("https://github.com/java-decompiler/jd-gui/archive/v${pkgver}.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
  # for https://github.com/java-decompiler/jd-gui/pull/32
  sed --in-place 's/, HyperlinkData/, HyperlinkPage.HyperlinkData/' services/src/main/groovy/jd/gui/view/component/WebXmlFilePage.groovy
  sed --in-place 's/(HyperlinkData/(HyperlinkPage.HyperlinkData/' services/src/main/groovy/jd/gui/view/component/WebXmlFilePage.groovy
  gradle -DgradleUserHomeDir=../.gradle build --stacktrace
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build/libs"
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}

md5sums=('1ef1bc18eb6d69dbf8108dc042914750')
sha1sums=('56523462ad870c7cd384b64c5c7c9ec263ce524c')
sha256sums=('50dd66ed3a81b009af1296ed05d6c77dd7df74e0535734a856e7bbfd31b1fb68')
