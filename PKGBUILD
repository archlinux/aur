# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
# Contributor: Beat Jäckle <beat@git.jdmweb2.ch>

_pkgname=audiveris
pkgname="${_pkgname}-git"
pkgver=5.11.0.r1.g7a36078
_name="${_pkgname}-git"
pkgrel=1
pkgdesc="Music score OMR engine - current"
arch=('any')
url="https://github.com/Audiveris/$_pkgname"
license=('AGPL3')
depends=(
  'java-runtime>=25'
  'tesseract'
  'freetype2'
  'hicolor-icon-theme'
)
makedepends=(
  'java-environment>=25'
  'gradle'
  'git'
  'fontconfig'
  'ttf-dejavu'
)
optdepends=(
  'tesseract-data: For languages other than english'
  'audiveris-doc: Documentation for Audiveris'
)
conflicts=("$_pkgname")
source=(
  "$_name::git+$url.git"
  "$_pkgname"
  "$_pkgname.desktop"
)
sha256sums=(
  'SKIP'
  '12223d402f4f6719051df7ab4776a82c7326c41f49403d4d1868c5b041678743'
  'a3c48eeac63cfdf0b0e3fdf788d48d51d4bc32291fdeb159c2244178604a28aa'
)

pkgver() {
  cd "$_name"
  git describe --tags --match '5.*' --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_name}"
  gradle build jar
}

package() {
  # The distribution tar carries the upstream version in its name, which
  # changes as HEAD advances - so it must not be hardcoded. The distTar task
  # produces exactly one 'app-*.tar' in the distributions directory.
  local _dist
  _dist=$(find "$srcdir/${_name}/app/build/distributions" -maxdepth 1 \
    -name 'app-*.tar' -print -quit)
  if [[ ! -f "$_dist" ]]; then
    printf '%s\n' "ERROR: no app-*.tar found in $srcdir/${_name}/app/build/distributions" >&2
    return 1
  fi

  # Extracting libraries
  install -dm755 "$pkgdir/usr/share/java/$_pkgname"
  bsdtar -C "$pkgdir/usr/share/java/$_pkgname" --strip-components=2 \
    -xf "$_dist" 'app-*/lib/*'

  # Creating starter script
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # Install desktopfile
  install -Dm755 "$srcdir/$_name/app/res/icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_name/app/res/icon-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm755 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
