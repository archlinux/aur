# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
# Contributor: Beat Jäckle <bjaeckle@student.ethz.ch>
pkgname=audiveris
pkgver=5.3.1
_gitcommit=f0bdbe6
_tag=5.3.1
pkgrel=2
pkgdesc="Music score OMR engine"
arch=('any')
url="https://github.com/Audiveris/audiveris"
license=('AGPL3')
depends=(
  'java-runtime>=17'
  'tesseract'
  'freetype2'
  'hicolor-icon-theme'
)
makedepends=(
  'java-environment>=17'
  'gradle'
)
optdepends=('tesseract-data: For languages other than english')
source=(
  "$pkgname-${pkgver/_/-}.tar.gz::https://github.com/Audiveris/$pkgname/archive/${pkgver/_/-}.tar.gz"
  "$pkgname"
  "$pkgname.desktop"
)
sha256sums=(
  'b81ef95ea87cfb73ff718ff3a33acddc4a275f94d1d25134bdc43b813d28d6d6'
  '3f5f7b788f32f74f3ae97b4c0e43d66a7664a94e2fcf262ea2b049c03265403a'
  'a3c48eeac63cfdf0b0e3fdf788d48d51d4bc32291fdeb159c2244178604a28aa'
)

prepare() {
  # Replacing git commit request with static commit hash
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/$pkgname-${pkgver/_/-}/build.gradle"
}

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"
  # Failing tests are not our concern. Ignore them.
  sed 's/src\/test/src\/main/' -i build.gradle
  gradle build jar --stacktrace
}

package() {
  # Extracting libraries
  install -dm755 "$pkgdir/usr/share/java/$pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname-${pkgver/_/-}/build/distributions/Audiveris-${_tag}.tar" \
    Audiveris-${_tag}/lib/*
  
  # Creating starter script
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install desktopfile
  install -Dm755 "$srcdir/$pkgname-${pkgver/_/-}/res/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname-${pkgver/_/-}/res/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

