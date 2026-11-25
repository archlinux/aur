# Maintainer: duanluan <duanluan@outlook.com>
#
# 豆包 CLI 官方只发布预编译产物，没有源码可编译，因此包名不带 -bin 后缀
# （见 docs/aur-packaging-rules.md 第 1 节）。
#
# 上游通过 npm 包 @bytedance/doubao-cli 分发：npm 包里只有启动脚本和
# artifacts.json 下载清单，真正的运行时是按平台下载的 linux-x64 压缩包。
# 本包直接打包 CDN 上的压缩包，不经过 npm，也不依赖 Node.js。
#
# 压缩包里的 doubao 按自身真实路径查找同目录的 resources/ 和 .so，所以
# /usr/bin/doubao 指向 /opt 下真身的软链接即可正常工作。

pkgname=doubao-cli
pkgver=2.38.2
pkgrel=1
pkgdesc='Doubao CLI: terminal AI agent for Doubao, usable from scripts and automation workflows'
arch=('x86_64')
url='https://www.doubao.com/work/docs/zh-cn/doubao-cli'
license=('LicenseRef-Proprietary')
depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'gnutls'
  'nspr'
  'nss'
  'systemd-libs'
  'util-linux-libs'
  'zlib'
)
optdepends=(
  'curl: download the browser-use runtime'
  'dpkg: unpack the Chromium bundle used by browser-use'
  'python: create the browser-use virtual environment'
)
options=('!strip' '!debug')
source=(
  "doubao-cli-${pkgver}-linux-x64.tar.gz::https://lf-flow-web-cdn.doubao.com/obj/flow-doubao/doubao_cli/2.38.2/doubao-cli-2.38.2-linux-x64-signed.tar.gz"
  'LICENSE'
)
sha256sums=('1d1133ba70e4911b4ee5e37baf8896443b9fc0503fd82c8a053554b3a69795ec'
            '28a013f498cab8e33069387e2c08eb82a4c378a3dc03e94c04443861437ca54a')
noextract=("doubao-cli-${pkgver}-linux-x64.tar.gz")

package() {
  install -dm755 "${pkgdir}/opt/doubao-cli"
  bsdtar -C "${pkgdir}/opt/doubao-cli" --strip-components=1 \
    -xf "${srcdir}/doubao-cli-${pkgver}-linux-x64.tar.gz"

  find "${pkgdir}/opt/doubao-cli" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/opt/doubao-cli" -type f -perm /111 -exec chmod 755 '{}' +
  find "${pkgdir}/opt/doubao-cli" -type f ! -perm /111 -exec chmod 644 '{}' +

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/doubao-cli/doubao "${pkgdir}/usr/bin/doubao"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/doubao-cli/clipboard-native-licenses.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.clipboard-native"
}
