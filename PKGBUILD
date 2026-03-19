pkgname=trae-cn-bin
_pkgname=trae-cn
pkgver=2.3.13343
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
conflicts=('trae-cn')
source=("Trae%20CN-linux-x64.deb::https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/${pkgver}/linux/Trae%20CN-linux-x64.deb")
sha256sums=('7f42a2aad4bef92e2a697c9d8962cb7f8b4bf0aa0efe0c2bbb9b49b43558daea')

package() {
  cd "$srcdir"

  # 解包 deb -> data.tar.* -> $pkgdir
  ar x "Trae%20CN-linux-x64.deb"
  local _data_tar
  _data_tar=$(ls data.tar.*)
  bsdtar -xf "${_data_tar}" -C "$pkgdir"

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
