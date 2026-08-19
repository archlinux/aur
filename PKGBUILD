# Maintainer: Your Name <your.email@example.com>
pkgname=livechess-bin
pkgver=2.2
pkgrel=2
pkgdesc="DGT LiveChess software for DGT e-Boards"
arch=('x86_64')
url="https://www.livechesscloud.com/software/"
license=('custom')
depends=('alsa-lib' 'cairo' 'fontconfig' 'freetype2' 'gcc-libs' 'gdk-pixbuf2' 'glib2'
         'gtk2' 'libxi' 'libxrender' 'libxtst' 'libx11' 'libxext' 'pango')
provides=('livechess')
conflicts=('livechess')
options=('!strip')
noextract=("DGT-LiveChess-${pkgver}-x86_64.deb")
source=("https://download.livechesscloud.com/installer/${pkgver}/DGT-LiveChess-${pkgver}-x86_64.deb")
sha256sums=('456abb65819bdb56cf0918b523b32cf3ea53a3c5ba6be933e666895279ecfe2f')

prepare() {
  bsdtar xf "DGT-LiveChess-${pkgver}-x86_64.deb"
}

package() {
  bsdtar xf data.tar.xz -C "${pkgdir}"

  find "${pkgdir}" -type d -exec chmod 755 {} +

  if [ -f "${pkgdir}/usr/share/doc/DGT-LiveChess/copyright" ]; then
    install -Dm644 "${pkgdir}/usr/share/doc/DGT-LiveChess/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/livechess" << 'EOF'
#!/bin/sh
exec /opt/DGTLiveChess/DGTLiveChess "$@"
EOF
}
