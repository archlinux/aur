# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
_pkgname=audiveris
pkgname="${_pkgname}-git"
pkgver=5.1.0.rc.r0.g0bf682689
pkgrel=1
pkgdesc="Music score OMR engine - current"
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
conflicts=("$_pkgname")
source=(
  "$pkgname::git+$url.git"
  "$_pkgname"
)
sha256sums=(
  'SKIP'
  '1c0ee49fc9ba9aa5d3dc260e649f0914d68ed8b18b40af2326763842e8d5ff46'
)

pkgver() {
  cd "$pkgname"
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  gradle build javadoc
}

package() {
  # extract libraries
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$_pkgname" --strip-components=2 \
    -xf "$srcdir/$pkgname/build/distributions/Audiveris.tar" \
    Audiveris/lib/*
  
  # start script
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Javadoc
  install -dm755 "$pkgdir/usr/share/doc"
  cp -r "$srcdir/$pkgname/build/docs/javadoc" "$pkgdir/usr/share/doc/$_pkgname"
}
