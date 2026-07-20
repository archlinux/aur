# Maintainer: GX <gx@ghs.red>
pkgname=axolotl-launcher-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('gtk3' 'libnotify' 'libsoup3' 'webkit2gtk-4.1' 'nss' 'nspr' 'libxkbcommon' 'xdg-utils' 'ttf-font')
makedepends=('fuse2')
conflicts=('axolotl-launcher')
provides=("axolotl-launcher=${pkgver}")
source=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.AppImage"
        "axolotl-launcher.desktop")
sha256sums=('505016d80be940e5568f6aa5fb90fcd36a86d552268d35881076df5db2bacb96'
            'a533673913a71414e9e23b24cd0821b360292a8b945af3a845f971262c2cbd4a')

package() {
  cd "${srcdir}"

  chmod +x "Axolotl.Launcher_${pkgver}_amd64.AppImage"
  ./Axolotl.Launcher_${pkgver}_amd64.AppImage --appimage-extract > /dev/null 2>&1

  cd squashfs-root

  # 安装二进制文件
  install -Dm755 "usr/bin/axolotl-launcher" "${pkgdir}/usr/bin/axolotl-launcher"

  # 安装桌面快捷方式
  install -Dm644 "${srcdir}/axolotl-launcher.desktop" "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"

  # 安装图标
  if [ -d "usr/share/icons" ]; then
    install -d "${pkgdir}/usr/share/icons"
    cp -r --preserve=timestamps usr/share/icons/* "${pkgdir}/usr/share/icons/"
  fi

  if [ -f ".DirIcon" ]; then
    install -Dm644 ".DirIcon" "${pkgdir}/usr/share/pixmaps/axolotl-launcher.png"
  fi
}
