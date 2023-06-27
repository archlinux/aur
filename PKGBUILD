# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier@gmail.com>

pkgname=ossia-score-appimage
pkgver=3.1.11
_pkgver=3.1.11
pkgrel=1
pkgdesc="an interactive sequencer for the intermedia arts."
arch=('x86_64')
url="https://ossia.io/"
license=('GPLv3')
depends=('glib2' 'jack' 'avahi')
source=("score.AppImage::https://github.com/ossia/score/releases/download/v${_pkgver}/ossia.score-${_pkgver}-linux-amd64.AppImage"
        "ossia-score")
sha512sums=('3093ef7561dcab08bd5ff54d54ad556ccb4398734f11a57529ed2e9e69597cecea12e0b571fbdef33a6219268e207cc21bc08a30ae2d85db895cde02a3409244'
            '2a78deed52bf1bcb1abad9b0319c483aef91c16648e45a96a58162f536fb79ce06f92c5f622b547e9cef63e4cf751ce2142fc1f29ae29e470944d35b3d192ba2')

package() {
  # Extract AppImage
  chmod +x score.AppImage
  ./score.AppImage --appimage-extract

  root="${srcdir}/squashfs-root"
  sed -i "/^Exec=/cExec=ossia-score" "${root}/ossia-score.desktop"

  # Copy libraries
  install -d "${pkgdir}/usr/lib/ossia-score"
  install -D "${root}/usr/lib/"* "${pkgdir}/usr/lib/ossia-score/"

  # Copy binaries
  install -d "${pkgdir}/usr/bin"
  install -D "${root}/usr/bin/ossia-score" "${pkgdir}/usr/bin/ossia-score-bin"
  install -D "${root}/usr/bin/ossia-score-vstpuppet" "${pkgdir}/usr/bin/"
  install -D "${root}/usr/bin/ossia-score-vst3puppet" "${pkgdir}/usr/bin/"
  install -D "${srcdir}/ossia-score" "${pkgdir}/usr/bin/"

  # Copy faust
  install -d "${pkgdir}/usr/share/ossia-score"
  find "${root}/usr/share/faust" -type f -exec install -Dm 755 "{}" "${pkgdir}/usr/share/ossia-score/faust" \;

  # Copy metadata
  install -D "${root}/ossia-score.desktop" "${pkgdir}/usr/share/applications/ossia-score.desktop"
  install -D "${srcdir}/squashfs-root/usr/share/pixmaps/ossia-score.png" "${pkgdir}/usr/share/pixmaps/ossia-score.png"
}
