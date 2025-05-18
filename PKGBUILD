# Maintainer: Herbert Knapp Name <herbert.knapp edu.uni-graz.at>
pkgname=exact-audio-copy
pkgver=1.8
pkgrel=3
pkgdesc='A precise CD audio grabber for creating perfect quality rips using CD and DVD drives'
arch=('any')
url='https://www.exactaudiocopy.de/en/'
source=('eac.exe::https://www.exactaudiocopy.de/eac-1.8.exe')
sha512sums=('89822966d57f5f89d40cb8b4bf5c1e1e169983d5b4dfdfa4559dd2b69a49dc6234e3e336452ec9220530e5ed228f656a58c346950cd2ce84d8edc200e38bad4b')
license=('unknown')
depends=('wine')
makedepends=('imagemagick' 'p7zip')

prepare() {
  _tmp=$(mktemp -d)
  cd ${_tmp}
  mkdir eac "$srcdir/eac/"
  cd eac
  7z x -aoa "$srcdir/eac.exe"
  chmod -R 755 .
  CYG_LATEST='https://web.archive.org/web/20240925225100if_/https://cygwin.com/snapshots/x86/cygwin1-20220301.dll.xz'
  curl -s ${CYG_LATEST} > cygwin1.dll.xz
  xz --decompress cygwin1.dll.xz
  mv cygwin1.dll CDRDAO/
  cp -r * "$srcdir/eac/"
  7z x EAC.exe
  convert .rsrc/1033/ICON/29.ico -thumbnail 128x128 -alpha on -background none -flatten "$srcdir/eac/eac.ico.128.png"
  rm -r ${_tmp}
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/opt"
  mv "$srcdir/eac" "$pkgdir/opt/exact-audio-copy"

  _launcher="$pkgdir/usr/bin/eac"
  {
    echo '#!/bin/sh'
    echo 'mkdir -p ~/.exact-audio-copy'
    echo '[[ -d ~/.exact-audio-copy/eac ]] || cp -r /opt/exact-audio-copy ~/.exact-audio-copy/eac'
    echo 'cd ~/.exact-audio-copy/eac'
    echo 'if [[ ! -f ~/.exact-audio-copy/dotnet48_installed ]]; then date > ~/.exact-audio-copy/dotnet48_installed && WINEDLLOVERRIDES="mscoree=" WINEDEBUG=-all WINEPREFIX=~/.exact-audio-copy winetricks -q dotnet48 & fi'
    echo 'WINEDLLOVERRIDES="mscoree=" WINEDEBUG=-all WINEPREFIX=~/.exact-audio-copy wine EAC.exe; wait'
  } > "${_launcher}"
  chmod +x "${_launcher}"
  ln -s "/usr/bin/eac" "$pkgdir/usr/bin/exact-audio-copy"
  
  _desktop="${pkgdir}/usr/share/applications/eac.desktop"
  {
    echo '[Desktop Entry]'
    echo 'Type=Application'
    echo "Name=Exact Audio Copy ${pkgver}"
    echo "Comment=${pkgdesc}"
    echo 'Path=/opt/exact-audio-copy'
    echo 'Exec=/usr/bin/eac'
    echo 'Icon=/opt/exact-audio-copy/eac.ico.128.png'
    echo 'Terminal=false'
    echo 'Categories=AudioVideo;Audio;'
  } > ${_desktop}
}

