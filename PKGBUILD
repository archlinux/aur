# Maintainer: Raphael Emberger(raember) <raphael.emberger@hotmail.ch>
# Contributor: Hervé Bitteur <herve.bitteur@audiveris.com>
# Contributor: Beat Jäckle <beat@git.jdmweb2.ch>

_pkgname=audiveris
pkgname="$_pkgname"
pkgver=5.10.2
_tag=5.10.2
_gitcommit=1b7cf44088c68f4168801822a613751d1bb1b584
_name="${_pkgname}-${_tag/_/-}"
pkgrel=1
pkgdesc="Music score OMR engine"
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
  'fontconfig'
  'ttf-dejavu'
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
  '2d03731fe08145175f857bb84d74ec82a7bc2a8b5a93bb2e28544b0d8a952016'
  '3f5f7b788f32f74f3ae97b4c0e43d66a7664a94e2fcf262ea2b049c03265403a'
  '61dc56cd82fa5c547419916c0585e645693f2b5a2fa08e19ef7dfc45d2116b3b'
)


prepare() {
  # The source tarball is not a git repository, so the gradle task "getCommit"
  # (which runs `git log`) fails in a clean build environment. Replace the git
  # call with the static commit hash of this release (quickfix, as done for
  # earlier releases).
  sed -i "s|git log -n1 --pretty=%H -- :^../flatpak/flathub|echo ${_gitcommit}|" \
    "$srcdir/${_name}/app/build.gradle"
}

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
