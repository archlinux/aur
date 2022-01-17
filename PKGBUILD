# Maintainer: Daniel Berjón <asuranceturix@gmail.com>
pkgname=adobe-reader-11
pkgver=11.0.23
pkgrel=2
pkgdesc="The reference software for viewing, printing, annotating and digitally signing PDF files"
arch=(i686 x86_64)
url="https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html"
license=('custom')
depends=(wine winetricks)
source=(
  "ftp://ftp.adobe.com/pub/adobe/reader/win/11.x/11.0.00/en_US/AdbeRdr11000_en_US.msi"
  "ftp://ftp.adobe.com/pub/adobe/reader/win/11.x/11.0.23/misc/AdbeRdrUpd11023.msp"
  "launcher.sh"
  "launcher.desktop"
)
sha256sums=('1f15c76c6dd92d8e87d379b70c70154fd130a534fe91c693f239160c8104ac68'
            'ad11346cd51f9509a875c2df8fd2fdfdb16b2dd555705471a178f0ba1151f655'
            'dafdfc4b7611c3663690588ec53c3b9a111b2507f78f6c7b24882d445aa81845'
            'e207602d3bf35f078fc2bd2163a6e213c5be451a333e95c8c4fbfcc6b2958287')

noextract=()
options=(!strip)

build() {
  install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
  export WINEPREFIX="$srcdir"/tmp/env
  export WINEARCH=win32
  export XDG_DATA_HOME="$srcdir"/tmp/local
  winetricks -q winxp mspatcha
  wineserver -w
  msiexec /i AdbeRdr11000_en_US.msi /q
  # For some reason, the update patch fails if the previous wine instance has not exited yet
  wineserver -w
  msiexec /p AdbeRdrUpd11023.msp /q
  wineserver -w
}

package() {
  install -m755 -d "$pkgdir"/usr/share/$pkgname "$pkgdir"/usr/share/$pkgname/Program\ Files "$pkgdir"/usr/share/$pkgname/Program\ Files/Common\ Files "$pkgdir"/usr/share/$pkgname/ProgramData
  cp -a "$srcdir"/tmp/env/drive_c/Program\ Files/Adobe "$pkgdir"/usr/share/$pkgname/Program\ Files
  cp -a "$srcdir"/tmp/env/drive_c/Program\ Files/Common\ Files/Adobe "$pkgdir"/usr/share/$pkgname/Program\ Files/Common\ Files
  cp -a "$srcdir"/tmp/env/drive_c/ProgramData/Adobe "$pkgdir"/usr/share/$pkgname/ProgramData
  cp -a "$srcdir"/tmp/env/system.reg "$pkgdir"/usr/share/$pkgname
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/$pkgname
  sed -i "s/pkgname/$pkgname/g" "$pkgdir"/usr/bin/$pkgname
  install -Dm644 launcher.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  sed -i "s/pkgname/$pkgname/g" "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/tmp/local/icons/hicolor/16x16/apps/*_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/$pkgname.png
  install -Dm644 "$srcdir"/tmp/local/icons/hicolor/32x32/apps/*_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -Dm644 "$srcdir"/tmp/local/icons/hicolor/48x48/apps/*_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/$pkgname.png
  install -Dm644 "$srcdir"/tmp/local/icons/hicolor/256x256/apps/*_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -Dm644 "$srcdir"/tmp/env/drive_c/Program\ Files/Adobe/Reader\ 11.0/Reader/Legal/ENU/license.html "$pkgdir"/usr/share/licenses/$pkgname/license.html
}
