# Maintainer: Jove Yu <yushijun110 at 126 dot com>

pkgname=lazycat-cloud-client
_pkgver=v1.6.0
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='懒猫微服'
url='https://lazycat.cloud'
arch=('x86_64')
license=('custom')
depends=(
  'nspr'
  'nss'
  'alsa-lib'
  'gtk3'
  'rclone'
  'fuse2')
makedepends=(
  'tar')
source=(
  "https://dl.lazycat.cloud/client/desktop/stable/lzc-client-desktop_${_pkgver}.tar.zst"
  "lzc-client-desktop")
install='lazycat-cloud-client.install'
noextract=("lzc-client-desktop_${_pkgver}.tar.zst")
md5sums=('65721b0b4bd37945810ceb574f267399'
         'b043322b2f2cfef1f7ff898ec5ae1801')

package() {
  install -d ${pkgdir}/opt/lzc-client-desktop/
  tar --no-same-owner --no-same-permissions -xf lzc-client-desktop_${_pkgver}.tar.zst -C ${pkgdir}/opt/lzc-client-desktop

  # fix desktop file
  install -Dm755 ${srcdir}/lzc-client-desktop ${pkgdir}/usr/bin/lzc-client-desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/lzc-client.desktop ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/icon.png ${pkgdir}/usr/share/icons/lzc-client-desktop.png
  sed -i 's|Exec=.*|Exec=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  sed -i 's|Icon=.*|Icon=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop

  # remove rclone
  rm ${pkgdir}/opt/lzc-client-desktop/rclone
  ln -s /usr/bin/rclone ${pkgdir}/opt/lzc-client-desktop/rclone
}
