# Maintainer: Ludvig Hozman <ludvig.hozman@gmail.com>

pkgname=plex-htpc
pkgver=1.19.1
pkgrel=1
_snapid=81OP06hEXlwmMrpMAhe5hyLy5bQ9q6Kz
_snaprev=10
pkgdesc="Plex HTPC application for linux"
arch=('x86_64')
url='http://plex.tv'
license=('unknown')
makedepends=('squashfs-tools')
depends=('qt5-base' 'qt5-svg' 'qt5-webengine' 'qt5-quickcontrols' 'mpv')
optdepends=('qt5-wayland: Wayland support' 'libva: GPU accelerated decoding')
source=("https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap" "qt.conf")
sha256sums=('daca30100ca03b3ec73a3ea91247fc591e64e1e0a4cb53ec4e740ae5d184325b'
            '40d1b22236d9d2312d16563493b8c6d69134c5aa54ff6d1531243133fb46f083')

prepare() {
  unsquashfs -q -f -d "${srcdir}/${pkgname}" "${_snapid}_${_snaprev}.snap"
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/${pkgname}/." "${pkgdir}/opt/${pkgname}"

  sed -i 's|${SNAP}/meta/gui/icon.png|plex-htpc|g' "${pkgdir}/opt/${pkgname}/meta/gui/plex-htpc.desktop"

  sed -e "/export LD_LIBRARY_PATH=/ c\export LD_LIBRARY_PATH=\"/usr/lib/${pkgname}:\$LD_LIBRARY_PATH\"" -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e '/export LC_ALL/ s/^#*/#/' -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e '/export QML/ s/^#*/#/' -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e '/export QT_/ s/^#*/#/' -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e '/export QTDIR/ s/^#*/#/' -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e '/export QT_QPA_PLATFORM/ i export FONTCONFIG_PATH="$BASE_DIR/etc/fonts"' -i "${pkgdir}/opt/${pkgname}/Plex.sh"
  sed -e "/LIBVA_DRIVERS_PATH/c\export LIBVA_DRIVERS_PATH=/usr/lib/dri" -i "${pkgdir}/opt/${pkgname}/Plex.sh"

  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/plex-htpc.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/${pkgname}/meta/gui/icon.png" "${pkgdir}/usr/share/pixmaps/plex-htpc.png"
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libcec.so.4" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libPlexMediaServer.so" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libicudata.so.66" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libicui18n.so.66" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libicuuc.so.66" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libavutil.so.56" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname}/lib/libavformat.so.58" -t "${pkgdir}/usr/lib/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}/usr/lib/x86_64-linux-gnu/libvpx.so.6.2.0" "${pkgdir}/usr/lib/${pkgname}/libvpx.so.6"
  install -Dm644 "${srcdir}/${pkgname}/usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2" "${pkgdir}/usr/lib/${pkgname}/libwebp.so.6"
  install -Dm644 "${srcdir}/${pkgname}/usr/lib/x86_64-linux-gnu/libre2.so.5.0.0" "${pkgdir}/usr/lib/${pkgname}/libre2.so.5"

  rm -rf "$pkgdir/opt/$pkgname"/{lib,gnome-platform,meta,data-dir,snap,usr}

  install -Dm644 "${srcdir}/qt.conf" -t "${pkgdir}/opt/${pkgname}/bin"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Plex.sh" "${pkgdir}/usr/bin/plex-htpc"
}
