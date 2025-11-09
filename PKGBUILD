# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname=rpcs3-bin
_api=https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest
_commit=$(curl -s $_api | jq .tag_name | sed -e "s/\"//g" -e "s/build-//")
_pkgver=$(curl -s $_api | jq .name | sed "s/\"//g")
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='PlayStation 3 Emulator'
arch=('x86_64')
url=https://github.com/RPCS3/rpcs3-binaries-linux
license=('GPL-2.0-only')
makedepends=(jq)
depends=( alsa-lib curl gcc-libs glibc libxkbcommon libx11 sdl3 systemd-libs libevdev libglvnd vulkan-icd-loader zlib
  glu
  glew
  openal
  opencv
  qt6-base
  qt6-multimedia
  qt6-svg
)
provides=(rpcs3)
conflicts=(rpcs3)

source=("${url}/releases/download/build-${_commit}/rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage")
sha256sums=('SKIP')

package() {
  # save disk space
  chmod +x rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage
  ./rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage --appimage-extract 2> /dev/null

  cd AppDir
  install -d "$pkgdir"/usr/{bin,share/{applications,metainfo,pixmaps}}
  mv usr/bin/rpcs3 -t "$pkgdir"/usr/bin
  mv usr/share/applications/rpcs3.desktop -t "$pkgdir"/usr/share/applications
  mv usr/share/icons/hicolor/scalable/apps/rpcs3.svg -t "$pkgdir"/usr/share/pixmaps
  mv usr/share/metainfo/rpcs3.metainfo.xml -t "$pkgdir"/usr/share/metainfo
  rm -rf usr/share/rpcs3/test 
  mv usr/share/rpcs3 -t "$pkgdir"/usr/share
}
