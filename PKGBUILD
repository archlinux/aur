# Maintainer: StPauliFan

pkgname=efisc2024-bin
_pkgname=efisc2024
pkgver=1.0.10.69
_debver=1.0.10-69
pkgrel=1
pkgdesc="Steuererklärungssoftware des Kantons Thurgau für das Steuerjahr 2023 (eFisc2024)"
arch=('x86_64')
url="https://efisc.tg.ch/"
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("https://efisc.kttg.ch/update/eFisc/2024/${_pkgname}_${_debver}_amd64.deb")
sha256sums=('74ce534d5c4c9c25b057563bbe27244c1145a3f5bfa6587d09906f959ac3ed3b')
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
