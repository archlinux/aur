# Maintainer: Jove Yu <yushijun110 at 126 dot com>

_pkgver=v1.0.80
_channel=stable
pkgname=lazycat-cloud-client
pkgver=${_pkgver//-/_}
pkgrel=2
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
  "https://dl.lazycat.cloud/client/desktop/${_channel}/lzc-client-desktop_${_pkgver}.tar.zst"
  "lzc-client-desktop")
install='lazycat-cloud-client.install'
noextract=("lzc-client-desktop_${_pkgver}.tar.zst")
sha256sums=('20173a3048c220e62c902518608588412c473eed418b2c6295837a655bfefc86'
            '0670fac388eb62ea33daa0d1ca3aa99637d922720aa55f392c021f24ba27eb8c')

package() {
  install -d ${pkgdir}/opt/lzc-client-desktop/

  tar --no-same-owner -xf lzc-client-desktop_${_pkgver}.tar.zst -C ${pkgdir}/opt/lzc-client-desktop

  # fix desktop file
  install -Dm755 ${srcdir}/lzc-client-desktop ${pkgdir}/usr/bin/lzc-client-desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/lzc-client.desktop ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  install -Dm644 ${pkgdir}/opt/lzc-client-desktop/icon.png ${pkgdir}/usr/share/icons/lzc-client-desktop.png
  sed -i 's|Exec=.*|Exec=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop
  sed -i 's|Icon=.*|Icon=lzc-client-desktop|' ${pkgdir}/usr/share/applications/lzc-client-desktop.desktop

  # fix permission
  chmod +x ${pkgdir}/opt/lzc-client-desktop/core/lzc-core

  # remove rclone
  rm ${pkgdir}/opt/lzc-client-desktop/rclone
  ln -s /usr/bin/rclone ${pkgdir}/opt/lzc-client-desktop/rclone
}
