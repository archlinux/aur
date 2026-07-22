# Maintainer: Fgaoxing <fgaoxing0206@outlook.com>
pkgname=axolotl-launcher-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnotify')
conflicts=('axolotl-launcher')
provides=("axolotl-launcher=${pkgver}")
source_x86_64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_arm64.deb")
sha256sums_x86_64=('8c7bcdec3f14c6de59720cbb949e76d1e11b026c741f8b6c6e155b2ebbcf9a47')
sha256sums_aarch64=('447e55437a201c2fe157f32e7fbf9d008333b0387660cb2009f61d8e139dc869')

package() {
  cd "${srcdir}"

  local _arch_name
  if [ "${CARCH}" = "x86_64" ]; then
    _arch_name="amd64"
  elif [ "${CARCH}" = "aarch64" ]; then
    _arch_name="arm64"
  fi

  local _deb="Axolotl.Launcher_${pkgver}_${_arch_name}.deb"

  # 从 deb 中提取 data.tar.gz，再解压到 pkgdir
  bsdtar -xf "${_deb}" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # 重命名 desktop 文件
  if [ -f "${pkgdir}/usr/share/applications/Axolotl Launcher.desktop" ]; then
    mv "${pkgdir}/usr/share/applications/Axolotl Launcher.desktop" "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"
    sed -i 's/^Exec=.*/Exec=WEBKIT_DISABLE_DMABUF_RENDERER=1 "Axolotl Launcher"/' "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"
  fi
}
