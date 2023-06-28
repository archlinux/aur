# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
_pkgname=audiveris
pkgname="${_pkgname}-git"
pkgver=5.2.5.r259.g0eabc0405
_tag=5.3
pkgrel=1
pkgdesc="Music score OMR engine - current"
arch=('x86_64')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'java-runtime>=17'
  'archlinux-java-run>=7'
  'tesseract-data-eng'
  'freetype2'
)
makedepends=(
  'java-environment>=17'
  'gradle'
)
optdepends=('tesseract-data: For languages other than english')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=(
  "$pkgname::git+$url.git"
  "$_pkgname"
)
sha256sums=('SKIP'
            '12223d402f4f6719051df7ab4776a82c7326c41f49403d4d1868c5b041678743')

pkgver() {
  cd "$pkgname"
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg2 'Updating gradle build config for newest gradle version'
  sed -i "s/compile(/implementation(/g" "$srcdir/$pkgname/build.gradle"
  sed -i "s/runtime(/runtimeOnly(/g" "$srcdir/$pkgname/build.gradle"
  sed -i "s/testCompile(/testImplementation(/g" "$srcdir/$pkgname/build.gradle"

  msg2 'Quickfix for javadoc'
  sed -i "s/XmlJavaTypeAdapter;/XmlJavaTypeAdapter;\nimport org.audiveris.omr.sig.relation.Containment;/g" "$srcdir/$pkgname/src/main/org/audiveris/omr/sig/inter/SentenceInter.java"
}

build() {
  cd "$srcdir/$pkgname"
  export JAVA_HOME=$(archlinux-java-run -a 17 -b 18 -f jdk -j)
  gradle build javadoc
}

package() {
  msg2 'Extracting libraries'
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$_pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname/build/distributions/Audiveris-${_tag}.tar" \
    "Audiveris-${_tag}/lib/"*
  
  msg2 'Creating starter script'
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  msg2 'Installing JavaDoc'
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/$pkgname/build/docs/javadoc" "$pkgdir/usr/share/doc/$_pkgname"
}

