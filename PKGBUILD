pkgname=trae-cn-bin
_pkgname=trae-cn
pkgver=2.3.17110
pkgrel=1
pkgdesc="TRAE CN 桌面客户端（预编译二进制包）"
arch=('x86_64')
url="https://trae.ai/"
license=('custom')
depends=(
  'gtk3' 'nss' 'libxss' 'libxkbfile' 'libsecret' 'xdg-utils' 'alsa-lib' 'libnotify'
  'libxtst' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxrandr' 'pango' 'cairo' 'at-spi2-core' 'glib2' 'cups' 'expat' 'nspr' 'util-linux' 'dbus' 'gcc-libs' 'libxkbcommon' 'mesa'
)
optdepends=('vulkan-icd-loader: 启用 Vulkan 加速')
provides=('trae-cn')
conflicts=('trae-cn' 'trae-cn-desktop-bin' 'trae-bin')
source=("Trae%20CN-linux-x64-${pkgver}.tar.gz::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/Trae%20CN-linux-x64.tar.gz")
sha256sums=('12673204f639ef50f4d2034273be8caac558638ff874c00810e50c00fdd99f2c')

package() {
  cd "$srcdir"

  # 解包 tar.gz -> /usr/share/${_pkgname}
  install -d "$pkgdir/usr/share/${_pkgname}"
  bsdtar -xf "Trae%20CN-linux-x64-${pkgver}.tar.gz" -C "$pkgdir/usr/share/${_pkgname}"

  # 创建可执行入口
  install -d "$pkgdir/usr/bin"
  ln -sf "/usr/share/${_pkgname}/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

  # Electron chrome-sandbox 兼容（与 VSCode/Slack 等一致）
  if [[ -f "$pkgdir/usr/share/${_pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "$pkgdir/usr/share/${_pkgname}/chrome-sandbox"
  fi

  # 许可证放置（若上游提供）
  if [[ -f "$pkgdir/usr/share/${_pkgname}/LICENSES.chromium.html" ]]; then
    install -Dm644 "$pkgdir/usr/share/${_pkgname}/LICENSES.chromium.html" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
  fi
}

pkgver() {
  # 如需从上游内部版本号转化，可在此定制；当前直接使用 URL 中的版本。
  printf "%s" "$pkgver"
}
