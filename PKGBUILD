# Maintainer: StPauliFan

pkgname=efisc2026-bin
_pkgname=efisc2026
pkgver=1.0.0.76
_debver=1.0.0-76
pkgrel=1
pkgdesc="Steuererklärungssoftware des Kantons Thurgau für das Steuerjahr 2025 (eFisc2026)"
arch=('x86_64')
url="https://efisc.tg.ch/"
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("https://efisc.kttg.ch/update/eFisc/2026/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('fec5baf9d3e58d9b2846ff2f317e7281bc8f167cc198f318493d9a9f03003b8b')
noextract=("${_pkgname}_${_debver}_amd64.deb")

prepare() {
  mkdir -p data
  bsdtar -xOf "${_pkgname}_${_debver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C data
}

package() {
  cd data

  install -dm755 "$pkgdir/usr/share"
  cp -a usr/share/$_pkgname "$pkgdir/usr/share/"

  # Bundled Windows remote-support tool, useless on Linux
  rm -f "$pkgdir/usr/share/$_pkgname/TeamViewerQS.exe"
  # Only needed by the Debian postinst
  rm -f "$pkgdir/usr/share/$_pkgname/$_pkgname.sharedmimeinfo"

  # Jars and config files ship with +x; only the launcher and JRE need it
  find "$pkgdir/usr/share/$_pkgname" -maxdepth 1 -type f ! -name "$_pkgname.sh" -exec chmod 644 {} +

  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/$_pkgname/$_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  sed -i -e "s|^Icon=.*|Icon=$_pkgname|" -e "s|^Exec=.*|Exec=$_pkgname %U|" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 usr/share/mime/packages/$_pkgname.xml -t "$pkgdir/usr/share/mime/packages"

  install -Dm644 usr/share/$_pkgname/$_pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"
  install -Dm644 usr/share/$_pkgname/$_pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/mimetypes/application-$_pkgname.png"
}
