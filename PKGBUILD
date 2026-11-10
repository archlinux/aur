# Maintainer: H3CoF6 <1707889225@qq.com>

# WeQ 的 AUR 预编译包（`-bin` 约定：上游已构建好，这里只搬运）。
#
# 本文件由 `scripts/publish-aur.mjs` 从 `PKGBUILD.in` 生成 —— **不要直接改 AUR
# 仓库里的 PKGBUILD**，改这里再让脚本重新渲染，否则下次发版会把改动冲掉。
#
# 上游产物是 electron-builder 的 tar.gz，目录布局固定为：
#   weQ-<ver>-linux-<arch>/
#     @weqdesktop            ← 可执行文件（electron-builder 用 @weq/desktop 的
#                               sanitizedName 作 Linux 可执行名，改不了也不该改）
#     resources/             ← app.asar + 打包的 resources/ + node_modules
#     native/linux/<arch>/   ← nt_helper.node 与授权助手
# 三者必须保持兄弟关系：主进程按 execPath 相对定位 resources/ 和 native/。

pkgname=weq-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="QQ NT 本地聊天记录解密、导出、查看与年度报告"
arch=('x86_64' 'aarch64')
url="https://github.com/weq-devs/WeQ"
# 上游 LICENSE 是 CC BY-NC-SA 4.0（见仓库根目录 LICENSE）。
license=('CC-BY-NC-SA-4.0')
depends=(
  'gtk3'
  'nss'
  'alsa-lib'
  'at-spi2-core'
  'libcups'
  'mesa'
  'libxkbcommon'
  'dbus'
  'systemd-libs'
  'expat'
  'libxcb'
  'glib2'
)
optdepends=(
  'xdg-utils: 用系统默认程序打开链接与文件'
  'libappindicator-gtk3: 托盘图标（部分桌面环境需要）'
)
# 和上游 tar.gz 一样，不接受「系统里有别的 weq」共存。
conflicts=('weq')
provides=('weq')
options=('!strip' '!debug')
install="${pkgname}.install"

source_x86_64=(
  "weq.sh"
  "weq.desktop"
  "https://github.com/weq-devs/WeQ/releases/download/v${pkgver}/weQ-${pkgver}-linux-x64.tar.gz"
)
source_aarch64=(
  "weq.sh"
  "weq.desktop"
  "https://github.com/weq-devs/WeQ/releases/download/v${pkgver}/weQ-${pkgver}-linux-arm64.tar.gz"
)
# sha256（GitHub Release API 的 digest），由 publish-aur.mjs 填入；
# 本地两个辅助文件的哈希由脚本一并算好。
sha256sums_x86_64=('b66be34d74960406bd3aae57c9972e89a10ccb88c9c717db5269e9dff0132230' 'e9df74452c972f4ba963fb5b3108cfa37646d62405fe73f8ec25782cd79a87f5' 'a0a78a3d0c113231f6505b1083c6e6fce05954cc3afd419ee5015528dcca86b9')
sha256sums_aarch64=('b66be34d74960406bd3aae57c9972e89a10ccb88c9c717db5269e9dff0132230' 'e9df74452c972f4ba963fb5b3108cfa37646d62405fe73f8ec25782cd79a87f5' 'd0d5dc6cb77fca5741320d5b1792334138dd8cae3cff11f991c1068c3c555a7a')

package() {
  # 上游按 x86_64 / arm64 命名 tarball，这里把 Arch 的 CARCH 映射过去。
  local _arch
  case "${CARCH}" in
    x86_64) _arch=x64 ;;
    aarch64) _arch=arm64 ;;
    *) error "不支持的架构：${CARCH}"; return 1 ;;
  esac
  local _tar="weQ-${pkgver}-linux-${_arch}"
  local _root="/opt/${pkgname%-bin}"

  # 整个产物原样落到 /opt/weq：resources/ 与 native/ 必须与可执行文件同级。
  install -d "${pkgdir}${_root}"
  cp -a "${srcdir}/${_tar}/." "${pkgdir}${_root}/"

  # 主进程只能从 execPath 的兄弟目录找 resources/ 和 native/，所以不做任何
  # 文件搬迁；这里只补桌面集成所需的入口、图标和 .desktop。
  install -Dm755 "${srcdir}/weq.sh" "${pkgdir}/usr/bin/weq"

  # 图标直接从上游产物里取，不单独存一份（避免同图两份、发版不同步）。
  install -Dm644 "${pkgdir}${_root}/resources/resources/brand/logo.png" \
    "${pkgdir}/usr/share/pixmaps/weq.png"

  install -Dm644 "${srcdir}/weq.desktop" "${pkgdir}/usr/share/applications/weq.desktop"

  # 直接执行 /opt/weq/@weqdesktop（绕过包装脚本）时的托管标记：应用据此把
  # 应用内更新换成「请用 paru -Syu」的提示，而不是下载失败。
  : >"${pkgdir}${_root}/.weq-package-managed"

  # chrome-sandbox 必须是 root 拥有的 setuid 二进制，否则在关闭了
  # unprivileged userns 的发行版 / 内核配置上，Electron 会拒绝启动渲染进程。
  # 上游 tar.gz 里它是普通 0755（AppImage 靠 nosuid 挂载 + `--no-sandbox` 绕过，
  # 我们装到普通文件系统上，就按 Arch 自家 electron 包的做法补 setuid）。
  chown root:root "${pkgdir}${_root}/chrome-sandbox"
  chmod 4755 "${pkgdir}${_root}/chrome-sandbox"

  # 打包进来的 asar / node_modules 已经是最终形态，再 strip 只会破坏产物。
  find "${pkgdir}${_root}" -type f -name '*.node' -exec chmod 755 {} +
}
