# Contributor: gilcu3
# Maintainer: gilcu3

pkgname=cgsuite
pkgver=2.2
_pkgver=$pkgver-beta2
pkgrel=1
pkgdesc='A computer algebra system for research in combinatorial game theory'
arch=('x86_64')
url="https://www.cgsuite.org/"
_repourl="https://github.com/aaron-siegel/cgsuite"
license=('GPL-3')
depends=('java-runtime')
makedepends=('netbeans' 'ant' 'jdk17-openjdk' 'maven' 'ttf-dejavu' 'fontconfig' 'unzip')
options=('!strip')
source=("$pkgname-$_pkgver.tar.gz::$_repourl/archive/refs/tags/v$_pkgver.tar.gz"
        "fix-build.patch"
        "cgsuite-gui.sh"
        "cgsuite-gui.desktop")
sha256sums=('92fefcbb34873f27c68d7ba52f9a46045cb09b3172b018cd65e3e46da119b5b3'
            '17f0fd02b3525d4edc72c4f33b275d7ace9d0884ec47b01aaafebaae1fd9579a'
            '4358002d16fce0bdbcd02210bf0b3c54e1a35afc27ce68746f32fc3e709609eb'
            '9b6c9108da854c42acdc9eaff09bf5e585d0b90d193583442559f4c73beab7df')

prepare() {
  cd "$pkgname-$_pkgver"
  patch -Np1 -t -i "$srcdir/fix-build.patch" || true
}

build() {
  cd $pkgname-$_pkgver
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
  cd lib/core
  mvn package -DskipTests
  cd ../jfx-bundle
  mvn package -DskipTests -Djfx.classifier=linux
  cd ../../desktop-app
  ant -Dnbplatform.default.netbeans.dest.dir=/usr/lib/netbeans \
      -Dnbplatform.default.harness.dir=/usr/lib/netbeans/harness \
      build-zip
  mv dist/CGSuite.zip $srcdir/
}
package() {
  install -d "$pkgdir/opt/$pkgname"

  unzip -o "$srcdir/CGSuite.zip" -d "$pkgdir/opt/$pkgname"
  mv "$pkgdir/opt/$pkgname/CGSuite" "$pkgdir/opt/$pkgname/CGSuite.tmp"
  mv "$pkgdir/opt/$pkgname/CGSuite.tmp/"* "$pkgdir/opt/$pkgname/"
  rmdir "$pkgdir/opt/$pkgname/CGSuite.tmp"
  rm "$pkgdir/opt/$pkgname/bin/"*.exe

  install -Dm755 "$srcdir/$pkgname-gui.sh" "$pkgdir/usr/bin/$pkgname-gui"
  install -Dm644 "$srcdir/$pkgname-gui.desktop" "$pkgdir/usr/share/applications/$pkgname-gui.desktop"
  install -Dm644 "$srcdir/$pkgname-$_pkgver/desktop-app/etc/thermograph-256x256.png" "$pkgdir/usr/share/pixmaps/$pkgname-gui.png"
}
