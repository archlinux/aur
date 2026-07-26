# Maintainer: Fgaoxing <fgaoxing0206@163.com>
pkgname=axolotl-launcher-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnotify')
conflicts=('axolotl-launcher')
provides=("axolotl-launcher=${pkgver}")
source=("red.ghs.axolotl.xml")
sha256sums=("a3c7ac4b8489dff5a8e558780765648dccc99c8a65b13e6dd11777de8352da7f")
source_x86_64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_arm64.deb")
sha256sums_x86_64=('d6ae1e29b9cabfca8b3518bdd9971a42c6480fd8cc7b94cfbd6f8876afbbca22')
sha256sums_aarch64=('7477d4abbf35c0def1820f6730f9219738b52cd42f24c7b90dc68ff88c182736')

package() {
  cd "${srcdir}"

  local _arch_name
  if [ "${CARCH}" = "x86_64" ]; then
    _arch_name="amd64"
  elif [ "${CARCH}" = "aarch64" ]; then
    _arch_name="arm64"
  fi

  local _deb="Axolotl.Launcher_${pkgver}_${_arch_name}.deb"

  bsdtar -xf "${_deb}" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  install -Dm644 "red.ghs.axolotl.xml" "$pkgdir/usr/share/mime/packages/red.ghs.axolotl.xml"


  if [ -f "${pkgdir}/usr/share/applications/Axolotl Launcher.desktop" ]; then
    mv "${pkgdir}/usr/share/applications/Axolotl Launcher.desktop" "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"
    sed -i "s/^Exec=.*/Exec=WEBKIT_DISABLE_DMABUF_RENDERER=1 'Axolotl Launcher'/" "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"
  fi
}
