# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
# Contributor: Beat Jäckle <beat@git.jdmweb2.ch>

_pkgname=audiveris
pkgname="$_pkgname"
pkgver=5.7.1
_tag=5.7.1
_gitcommit=85cdc9e
_name="${_pkgname}-${_tag/_/-}"
pkgrel=1
pkgdesc="Music score OMR engine"
arch=('any')
url="https://github.com/Audiveris/$_pkgname"
license=('AGPL3')
depends=(
  'java-runtime>=24'
  'tesseract'
  'freetype2'
  'hicolor-icon-theme'
)
makedepends=(
  'java-environment>=21'
  'gradle'
)
optdepends=(
  'tesseract-data: For languages other than english'
  'audiveris-doc: Documentation for Audiveris'
)
source=(
  "${_name}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz"
  "$_pkgname"
  "$_pkgname.desktop"
)
sha256sums=(
  '0c6e3e1907ff630764ec2b4dc9f3e2638477067b1cb0c6d08be07eb35e3cb0b6'
  '3f5f7b788f32f74f3ae97b4c0e43d66a7664a94e2fcf262ea2b049c03265403a'
  'a3c48eeac63cfdf0b0e3fdf788d48d51d4bc32291fdeb159c2244178604a28aa'
)


build() {
  cd "$srcdir/${_name}"
  gradle build jar
}

package() {
  # Extracting libraries
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$_pkgname" --strip-components=2 \
    -xf "$srcdir/$_name/app/build/distributions/app-${_tag}.tar" \
    app-${_tag}/lib/*
  
  # Creating starter script
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install desktopfile
  install -Dm755 "$srcdir/$_name/app/res/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_name/app/res/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
