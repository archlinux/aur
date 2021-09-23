# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
pkgname=audiveris
pkgver=5.2.4
_gitcommit=3353f40
pkgrel=1
pkgdesc="Music score OMR engine"
arch=('x86_64')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'java-runtime>=7'
  'java-runtime<=8'
  'tesseract-data-eng'
  'freetype2'
)
makedepends=(
  'java-environment>=7'
  'java-environment<=8'
  'gradle'
)
optdepends=('tesseract-data: For languages other than english')
source=(
  "$pkgname-${pkgver/_/-}.tar.gz::https://github.com/Audiveris/$pkgname/archive/${pkgver/_/-}.tar.gz"
  "$pkgname"
)
sha256sums=('ab7f686484c87640dfa67777b4392bf3aa1809d08f6ea2370d6fcc6ea3298aff'
            '12223d402f4f6719051df7ab4776a82c7326c41f49403d4d1868c5b041678743')

prepare() {
  msg2 'Replacing git commit request with static commit hash'
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"

  msg2 'Updating gradle build config for newest gradle version'
  sed -i "s/compile(/implementation(/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
  sed -i "s/runtime(/runtimeOnly(/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
  sed -i "s/testCompile(/testImplementation(/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
  
  msg2 'Quickfix for javadoc'
  sed -i "s/XmlJavaTypeAdapter;/XmlJavaTypeAdapter;\nimport org.audiveris.omr.sig.relation.Containment;/g" "$srcdir/$pkgname-${pkgver/_/-}/src/main/org/audiveris/omr/sig/inter/SentenceInter.java"
}

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  gradle build javadoc
}

package() {
  msg2 'Extracting libraries'
  install -dm755 "$pkgdir/usr/share/java/$pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname-${pkgver/_/-}/build/distributions/Audiveris.tar" \
    Audiveris/lib/*
  
  msg2 'Creating starter script'
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  msg2 'Installing JavaDoc'
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/$pkgname-${pkgver/_/-}/build/docs/javadoc" "$pkgdir/usr/share/doc/$pkgname"
}

