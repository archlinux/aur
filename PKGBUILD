# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi (Canmi21)

pkgname="lan-share-bin"
pkgver="1.2.1"
pkgrel=1
pkgdesc="Cross platform LAN File transfer application built with Qt C++ framework"
arch=("x86_64")
url="https://github.com/abdularis/LAN-Share/releases"
license=("GPL-3.0")
depends=("qt5-base" "gcc-libs" "imagemagick")
options=('!strip')
source=(
  "https://github.com/abdularis/LAN-Share/releases/download/${pkgver}/lanshare_${pkgver}-${pkgrel}_amd64.deb"
  "lanshare.sh::https://raw.githubusercontent.com/abdularis/LAN-Share/refs/heads/master/packaging/linux/debian/LANShare.sh"
  "logo.png::https://raw.githubusercontent.com/abdularis/LAN-Share/refs/heads/master/packaging/linux/debian/lanshare-icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  ar x "${srcdir}/lanshare_${pkgver}-${pkgrel}_amd64.deb"
  tar -xf data.tar.xz -C "${pkgdir}"

  find "${pkgdir}" -type d -exec chmod 755 {} +

  install -Dm755 "${srcdir}/lanshare.sh" "${pkgdir}/usr/bin/lanshare"
  sed -i 's|^./LANShare|/usr/bin/lanshare|' "${pkgdir}/usr/bin/lanshare"
  sed -i 's|^export LD_LIBRARY_PATH=./|export LD_LIBRARY_PATH=/usr/lib/lanshare|' "${pkgdir}/usr/bin/lanshare"

  icon_sizes=(16 32 48 64 128 256)
  for size in "${icon_sizes[@]}"; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    magick "${srcdir}/logo.png" -resize "${size}x${size}" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/lanshare.png"
  done

  install -d "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Name=lanshare
Exec=lanshare
Icon=lanshare
Type=Application
Categories=Network;Utility;
StartupNotify=true" > "${pkgdir}/usr/share/applications/lanshare.desktop"
}