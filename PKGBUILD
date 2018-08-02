# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
pkgname=audiveris
pkgver=5.1.0_rc
pkgrel=1
pkgdesc="Music score OMR engine"
arch=('x86_64')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'java-runtime>=7'
  'java-runtime<=8'
  'tesseract-data-eng'
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
sha256sums=(
  '1ea51e880c1bb867708ac917801056dd25686389d354d4683eb7ee972811ee1d'
  'c697bdc3ff8b6c6e0efc273778f470e26971f250eeab89208688cf2dd2ef0517'
)

prepare() {
  sed -i "s/git rev-parse --short HEAD/echo '0bf68268962228f6993c52e77349fc44e7c17162'/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
}

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  gradle build javadoc
}

package() {
  # extract libraries
  install -dm755 "$pkgdir/usr/share/java/$pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname-${pkgver/_/-}/build/distributions/Audiveris.tar" \
    Audiveris/lib/*
  
  # start script
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Javadoc
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/$pkgname-${pkgver/_/-}/build/docs/javadoc" "$pkgdir/usr/share/doc/$pkgname"
}
