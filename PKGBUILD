# Maintainer: Herbert Knapp
pkgname=winamp2
pkgver=2.95
pkgrel=4
pkgdesc='Winamp 2.95 audio player with Milkdrop 1.04, FLAC 1.1.2, APE 3.99, MPC 0.99f plugins'
arch=('any')
url="http://www.nullsoft.com"
source=('winamp295rc_full_milkdrop_flac_ape_mpc.zip::https://gateway.ipfs.io/ipfs/QmT2VSVUDCRWmaDfHnUfnRx9rw27dZufvHTgtuf5rzT4yb')
sha512sums=('7dd253b9aa0a6066ffd1332f01ca2620ad2f9951769aaf8fec07264ea7214f2718e8aa9dd780cb20d7d0e996f6a31b025ec66930e4e4ad78de54e4d9bdeec58d')
license=('unknown')
depends=('wine')
makedepends=('imagemagick' 'p7zip')

prepare() {
  _tmp=$(mktemp -d)
  cd ${_tmp}
  7z x "$srcdir/Winamp/winamp.exe"
  convert .rsrc/ICON/18.ico -thumbnail 32x32 -alpha on -background none -flatten "$srcdir/Winamp/winamp.ico.18.png"
  rm -r ${_tmp}
}

package() {

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/opt"
  mv "$srcdir/Winamp" "$pkgdir/opt/Winamp2"

  _launcher="$pkgdir/usr/bin/winamp2"
  {
    echo '#!/bin/sh'
    echo 'mkdir -p ~/.winamp2'
    echo '[[ -d ~/.winamp2/winamp ]] || cp -r /opt/Winamp2 ~/.winamp2/winamp'
    echo "cd ~/.winamp2/winamp/"
    echo "WINEDEBUG=-all WINEPREFIX=~/.winamp2 wine winamp.exe"
  } > "${_launcher}"
  chmod +x "${_launcher}"
  
  _desktop="${pkgdir}/usr/share/applications/winamp2.desktop"
  {
    echo '[Desktop Entry]'
    echo 'Type=Application'
    echo "Name=Winamp ${pkgver}"
    echo "Comment=${pkgdesc}"
    echo 'Path=/opt/Winamp2'
    echo 'Exec=/usr/bin/winamp2'
    echo 'Icon=/opt/Winamp2/winamp.ico.18.png'
    echo 'Terminal=false'
    echo 'Categories=AudioVideo;Audio;'
  } > ${_desktop}
}

