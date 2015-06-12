# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=jd-gui
pkgver=1.1.0
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

md5sums=('0309bb3aaf57b734a4f6d67d2ecfe4df')
sha1sums=('e6ffeb063d668c66c8a490345291139091d642e9')
sha256sums=('1463e736da3d2f4c7b2cf7a8d0374f3956f770ca1254069510efcb7a60409826')
