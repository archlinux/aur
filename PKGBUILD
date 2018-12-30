# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
pkgname=audiveris
pkgver=5.1.0
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
sha256sums=('1303e2deaef16a06c7ac21ae6b2d7f1409a2f80365777100d8927ebf90c48939'
            '12223d402f4f6719051df7ab4776a82c7326c41f49403d4d1868c5b041678743')

prepare() {
  msg2 'Replacing git commit request with static commit hash'
  sed -i "s/git rev-parse --short HEAD/echo '4f234fefb8a5e004f3b82fee11e68b57c004b20a'/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
  # Quickfix for javadoc
  sed -i "s/XmlRootElement;/XmlRootElement;\nimport org.audiveris.omr.sig.inter.AbstractInter;/g" "$srcdir/$pkgname-${pkgver/_/-}/src/main/org/audiveris/omr/sig/relation/MirrorRelation.java"

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
