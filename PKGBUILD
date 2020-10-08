# Maintainer: Daniel Berjón <asuranceturix@gmail.com>
pkgname=adobe-reader-11
pkgver=11.0.23
pkgrel=1
pkgdesc="The reference software for viewing, printing, annotating and digitally signing PDF files"
arch=(i686 x86_64)
url="https://acrobat.adobe.com/us/en/acrobat/pdf-reader.html"
license=('freeware')
depends=(wine winetricks)
makedepends=()
source=(
  "ftp://ftp.adobe.com/pub/adobe/reader/win/11.x/11.0.00/en_US/AdbeRdr11000_en_US.msi"
  "ftp://ftp.adobe.com/pub/adobe/reader/win/11.x/11.0.23/misc/AdbeRdrUpd11023.msp"
  "adobe-reader-11.sh"
  "adobe-reader-11.desktop"
)
sha256sums=('1f15c76c6dd92d8e87d379b70c70154fd130a534fe91c693f239160c8104ac68'
            'ad11346cd51f9509a875c2df8fd2fdfdb16b2dd555705471a178f0ba1151f655'
            '48b98ceec9a8ae31b9a87e904dc29eca023fcb9353783fccd985cb773ffeca73'
            '01e00f48292a1afa6c9a59e84b319fe8e8d911c4c15bef0810e9334a7bb4e182')

noextract=()
options=(!strip)

build() {
  install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
  export WINEPREFIX="$srcdir"/tmp/env
  export WINEARCH=win32
  export XDG_DATA_HOME="$srcdir"/tmp/local
  winetricks winxp mspatcha
  wineserver -w
  msiexec /i AdbeRdr11000_en_US.msi /q
  # For some reason, the update patch fails if the previous wine instance has not exited yet
  wineserver -w
  msiexec /p AdbeRdrUpd11023.msp /q
  wineserver -w
}

package() {
  install -m755 -d "$pkgdir"/usr/share/adobe-reader-11 "$pkgdir"/usr/share/adobe-reader-11/Program\ Files "$pkgdir"/usr/share/adobe-reader-11/Program\ Files/Common\ Files "$pkgdir"/usr/share/adobe-reader-11/ProgramData
  cp -r "$srcdir"/tmp/env/drive_c/Program\ Files/Adobe "$pkgdir"/usr/share/adobe-reader-11/Program\ Files
  cp -r "$srcdir"/tmp/env/drive_c/Program\ Files/Common\ Files/Adobe "$pkgdir"/usr/share/adobe-reader-11/Program\ Files/Common\ Files
  cp -r "$srcdir"/tmp/env/drive_c/ProgramData/Adobe "$pkgdir"/usr/share/adobe-reader-11/ProgramData
  cp -r "$srcdir"/tmp/env/system.reg "$pkgdir"/usr/share/adobe-reader-11
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 adobe-reader-11.sh "$pkgdir"/usr/bin/adobe-reader-11
  install -m755 -d "$pkgdir"/usr/share/applications
  install -m644 adobe-reader-11.desktop "$pkgdir"/usr/share/applications/adobe-reader-11.desktop
  install -m755 -d "$pkgdir"/usr/share/icons/hicolor/16x16/apps
  install -m644 "$srcdir"/tmp/local/icons/hicolor/16x16/apps/F449_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/adobe-reader-11.png
  install -m755 -d "$pkgdir"/usr/share/icons/hicolor/32x32/apps
  install -m644 "$srcdir"/tmp/local/icons/hicolor/32x32/apps/F449_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/adobe-reader-11.png
  install -m755 -d "$pkgdir"/usr/share/icons/hicolor/48x48/apps
  install -m644 "$srcdir"/tmp/local/icons/hicolor/48x48/apps/F449_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/adobe-reader-11.png
  install -m755 -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  install -m644 "$srcdir"/tmp/local/icons/hicolor/256x256/apps/F449_SC_Reader.0.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/adobe-reader-11.png
}
