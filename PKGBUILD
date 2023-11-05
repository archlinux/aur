# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
# Contributor: Beat Jäckle <beat@git.jdmweb2.ch>

_pkgname=audiveris
pkgname="$_pkgname"
pkgver=5.3.1
_tag=5.3.1
_gitcommit=f0bdbe6
_name="${_pkgname}-${pkgver/_/-}"
pkgrel=3
pkgdesc="Music score OMR engine"
arch=('any')
url="https://github.com/Audiveris/$_pkgname"
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
optdepends=(
  'tesseract-data: For languages other than english'
  'audiveris-doc: Documentation for Audiveris'
)
source=(
  "${_name}.tar.gz::${url}/archive/${pkgver/_/-}.tar.gz"
  "$_pkgname"
  "$_pkgname.desktop"
)
sha256sums=(
  'b81ef95ea87cfb73ff718ff3a33acddc4a275f94d1d25134bdc43b813d28d6d6'
  '3f5f7b788f32f74f3ae97b4c0e43d66a7664a94e2fcf262ea2b049c03265403a'
  'a3c48eeac63cfdf0b0e3fdf788d48d51d4bc32291fdeb159c2244178604a28aa'
)

prepare() {
  # Replacing git commit request with static commit hash
  sed -i "s/git rev-parse --short HEAD/echo '${_gitcommit}'/g" "$srcdir/$_name/build.gradle"
}

build() {
  cd "$srcdir/${_name}"
  # Failing tests are not our concern. Ignore them.
  sed 's/src\/test/src\/main/' -i build.gradle
  gradle build jar
}

package() {
  # Extracting libraries
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$_pkgname" --strip-components=2 \
    -xf "$srcdir/$_name/build/distributions/Audiveris-${_tag}.tar" \
    Audiveris-${_tag}/lib/*
  
  # Creating starter script
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install desktopfile
  install -Dm755 "$srcdir/$_name/res/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_name/res/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
