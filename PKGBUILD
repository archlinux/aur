# Maintainer: Herbert Knapp Name <herbert.knapp edu.uni-graz.at>
pkgname=winamp2
pkgver=2.95
pkgrel=1
pkgdesc='Winamp 2.95 audio player with Milkdrop v1.04, FLAC v1.1.2, APE v3.99, MPC v0.99f'
arch=('any')
url="http://www.nullsoft.com"
source=('winamp295rc_full_milkdrop_flac_ape_mpc.zip::https://a.pomf.cat/wmyhzm.zip')
sha512sums=('7dd253b9aa0a6066ffd1332f01ca2620ad2f9951769aaf8fec07264ea7214f2718e8aa9dd780cb20d7d0e996f6a31b025ec66930e4e4ad78de54e4d9bdeec58d')
license=('unknown')
depends=('wine')
makedepends=('imagemagick' 'p7zip')

# Download magnet:?xt=urn:btih:C478450B2506D7FE312A4AD920837321AD18F771 with aria2 if link has died

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
  echo '#!/bin/sh' > "${_launcher}"
  echo "cd /opt/Winamp2/" >> "${_launcher}"
  echo "WINEDEBUG=-all WINEPREFIX=~/.winamp2 wine winamp.exe" >> "${_launcher}"
  chmod +x "${_launcher}"
  
  _desktop="${pkgdir}/usr/share/applications/winamp2.desktop"
  echo '[Desktop Entry]' > ${_desktop}
  echo 'Type=Application' >> ${_desktop}
  echo "Name=Winamp ${pkgver}" >> ${_desktop}
  echo "Comment=${pkgdesc}" >> ${_desktop}
  echo "Path=/opt/Winamp2" >> ${_desktop}
  echo 'Exec=/usr/bin/winamp2' >> ${_desktop}
  echo "Icon=/opt/Winamp2/winamp.ico.18.png" >> ${_desktop}
  echo 'Terminal=false' >> ${_desktop}
  echo 'Categories=AudioVideo;Audio;' >> ${_desktop}
}

