# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgbase=rpcs3-bin
pkgname=(rpcs3-{bin,appimage})
_api=https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest
_commit=$(curl -s $_api | grep -oP 'tag_name": "build-\K\w{40}')
_pkgver=$(curl -s $_api | grep -oP '"name": "\K0[^"]+')
pkgver=${_pkgver/-/_}
pkgrel=1
pkgdesc='PlayStation 3 Emulator'
arch=('x86_64')
url=https://github.com/RPCS3/rpcs3-binaries-linux
license=('GPL-2.0-only')
makedepends=(patchelf)
provides=(rpcs3)
conflicts=(rpcs3)

source=("${url}/releases/download/build-${_commit}/rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage")
b2sums=('4a8ba2aa79cfd0e4ae753d67a7f978e4038b4fbeda29565ca87ce0885db8dd22dc4c1a27eaf60affc6c48b9b3f232b0298f2945fef3d05fd7147ed224b9dbf8f')

prepare() {
  chmod 755 rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage
  ./rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage --appimage-extract 2> /dev/null
}

package_rpcs3-bin() {
  depends=( alsa-lib curl gcc-libs glibc libxkbcommon libx11 sdl3 systemd-libs libevdev libglvnd vulkan-icd-loader zlib
   glu glew openal opencv qt6-{base,multimedia,svg} )

  cd AppDir
  # mv large files to save disk space
  install -d "$pkgdir"/usr/bin && mv usr/bin/rpcs3 -t "$pkgdir"/usr/bin
  patchelf --debug "$pkgdir"/usr/bin/rpcs3 --replace-needed libGLEW.so.2.2 libGLEW.so
  install -Dm644 usr/share/applications/rpcs3.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/scalable/apps/rpcs3.svg -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 usr/share/metainfo/rpcs3.metainfo.xml -t "$pkgdir"/usr/share/metainfo
  rm -rf usr/share/rpcs3/test 
  mv usr/share/rpcs3 -t "$pkgdir"/usr/share
}

package_rpcs3-appimage() {
  options=(!strip)
  install -d "$pkgdir"/usr/bin && mv $(readlink rpcs3-v${_pkgver}-${_commit::8}_linux64.AppImage) "$pkgdir"/usr/bin/rpcs3

  cd AppDir
  install -Dm644 usr/share/applications/rpcs3.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 usr/share/icons/hicolor/scalable/apps/rpcs3.svg -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 usr/share/metainfo/rpcs3.metainfo.xml -t "$pkgdir"/usr/share/metainfo
}
