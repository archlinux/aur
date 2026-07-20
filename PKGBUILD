# Maintainer: GX <gx@ghs.red>
pkgname=axolotl-launcher-bin
pkgver=1.3.3
pkgrel=2
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnotify')
conflicts=('axolotl-launcher')
provides=("axolotl-launcher=${pkgver}")
source_x86_64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.AppImage")
source_aarch64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_aarch64.AppImage")
source+=("axolotl-launcher.desktop")
sha256sums_x86_64=('505016d80be940e5568f6aa5fb90fcd36a86d552268d35881076df5db2bacb96')
sha256sums_aarch64=('320db64519aa61539ded5301c613567819f3548e7d217cded8d00ea246db10b5')
sha256sums+=('a533673913a71414e9e23b24cd0821b360292a8b945af3a845f971262c2cbd4a')

package() {
  cd "${srcdir}"

  local _arch_name
  if [ "${CARCH}" = "x86_64" ]; then
    _arch_name="amd64"
  elif [ "${CARCH}" = "aarch64" ]; then
    _arch_name="aarch64"
  fi

  local _appimage="Axolotl.Launcher_${pkgver}_${_arch_name}.AppImage"

  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract > /dev/null 2>&1

  cd squashfs-root

  install -Dm755 "usr/bin/axolotl-launcher" "${pkgdir}/usr/bin/axolotl-launcher"
  install -Dm644 "${srcdir}/axolotl-launcher.desktop" "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"

  if [ -d "usr/share/icons" ]; then
    install -d "${pkgdir}/usr/share/icons"
    cp -r --preserve=timestamps usr/share/icons/* "${pkgdir}/usr/share/icons/"
  fi

  if [ -f ".DirIcon" ]; then
    install -Dm644 ".DirIcon" "${pkgdir}/usr/share/pixmaps/axolotl-launcher.png"
  fi
}
