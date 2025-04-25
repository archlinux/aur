# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier@gmail.com>

pkgname=ossia-score-appimage
pkgver=3.5.1
_pkgver=3.5.1
pkgrel=2
pkgdesc="an interactive sequencer for the intermedia arts."
arch=('x86_64')
url="https://ossia.io/"
license=('GPLv3')
depends=('glib2' 'jack' 'avahi')
optdepends=('pipewire' 'ultraleap-hand-tracking-service' 'gpsd' 'bluez' 'ndi-sdk')
source=("score.AppImage::https://github.com/ossia/score/releases/download/v${_pkgver}/ossia.score-${_pkgver}-linux-x86_64.AppImage"
        "ossia-score")
sha512sums=('acea11a113d5d7c960ad50a1af1a1db85fbcb9d5b8b624ae6eac1170ad64f9547bff3477acb972c5b2619f9df1201298586669d8c326fd0dc42801c97a71e5d4'
            '2a78deed52bf1bcb1abad9b0319c483aef91c16648e45a96a58162f536fb79ce06f92c5f622b547e9cef63e4cf751ce2142fc1f29ae29e470944d35b3d192ba2')
package() {
  # Extract AppImage
  chmod +x score.AppImage
  ./score.AppImage --appimage-extract

  root="${srcdir}/squashfs-root"
  sed -i "/^Exec=/cExec=ossia-score" "${root}/ossia-score.desktop"

  # Copy libraries
  ls ${root}/usr/lib/
  rm "${root}/usr/lib/libxcb"*
  rm "${root}/usr/lib/libudev"*
  install -d "${pkgdir}/usr/lib/ossia-score/suil-0"
  install -D "${root}/usr/lib/"*.so* "${pkgdir}/usr/lib/ossia-score/"
  install -D "${root}/usr/lib/suil-0"/* "${pkgdir}/usr/lib/ossia-score/lib"

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
