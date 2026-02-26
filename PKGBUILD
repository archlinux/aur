# Maintainer: Dmitry Golgowski <d.westcoast@aol.com>

pkgname=lidarview
pkgver=5.2.0
pkgrel=1
pkgdesc="Real-time reception, recording, visualization and processing of 3D LiDAR data (successor to VeloView)"
arch=(x86_64)
license=(Apache-2.0)
url="https://lidarview.kitware.com"
depends=('libglvnd' 'libxcb' 'libxkbcommon' 'dbus')
makedepends=(gendesk)
optdepends=('nvidia-utils: NVIDIA GPU acceleration')
# Upstream hosts binaries on Google Drive
# Release page: https://gitlab.kitware.com/LidarView/lidarview/-/releases
_gdrive_id=1T2-e2nACjePKYZZpS1ds-K1t_rhMjhZA
_archive="LidarView-${pkgver}"
source=("${_archive}-Linux.tar.gz::https://drive.usercontent.google.com/download?id=${_gdrive_id}&export=download&confirm=t"
        "lidarview.svg::https://raw.githubusercontent.com/Kitware/LidarView/master/Application/Client/Resources/Images/LidarViewLogo.svg")
sha256sums=('b1747057eef17c0569aa76a21433aea09446202128221c5399b6fa79f2da9e13'
            'SKIP')

prepare() {
  gendesk --pkgname=LidarView --pkgdesc="$pkgdesc" --exec=/opt/lidarview/bin/LidarView --categories="Science;DataVisualization" PKGBUILD
}

package() {
  install -dm755 "$pkgdir"/opt/lidarview
  cp -a --no-preserve=ownership "$srcdir"/${_archive}/{bin,lib,plugins,share} "$pkgdir"/opt/lidarview/

  install -dm755 "$pkgdir"/usr/bin
  ln -s /opt/lidarview/bin/LidarView "$pkgdir"/usr/bin/lidarview
  ln -s /opt/lidarview/bin/PacketFileSender "$pkgdir"/usr/bin/lidarview-packetsender

  install -Dm644 "$srcdir"/LidarView.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$srcdir"/lidarview.svg "$pkgdir"/usr/share/pixmaps/LidarView.svg
}
