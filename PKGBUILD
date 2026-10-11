# Maintainer: rcdfrd <rcdfrd@gmail.com>
#
# 开源版 ZCode 桌面端：从 zai-org/ZCode 源码构建（Apache-2.0），使用仓库自带的
# electron-builder 配置出 Arch 原生包，再重新打包为本 PKGBUILD 的产物。
# 与 zcode-cli（TUI/Web）可共存：桌面入口是 /usr/bin/zcode-desktop，
# 上游 .desktop 本身就以 /opt/ZCode/zcode 绝对路径启动，不占用 /usr/bin/zcode。

pkgname=zcode-open
pkgver=3.15.1
pkgrel=1
pkgdesc="ZCode open-source AI coding workbench (desktop app) built from source"
# 仅验证了 x86_64；aarch64 需要交叉构建 Electron 与原生依赖，未测试故不声明。
arch=('x86_64')
url="https://github.com/zai-org/ZCode"
license=('Apache-2.0')
# 依赖取自上游 electron-builder 的 pacman 运行时闭包。
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'libnotify' 'alsa-lib' 'mesa' 'xdg-utils')
# libxcrypt-compat 提供 libcrypt.so.1：electron-builder 内置的 fpm（Ruby）在 Arch 上需要它。
makedepends=('nodejs' 'pnpm' 'libxcrypt-compat')
conflicts=('zcode' 'zcode-bin' 'z-code-bin' 'zcode-desktop-bin' 'zcode-ce-bin'
           'zcode-redminote11tech' 'zcode-pro')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("zcode-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfab1f9fdf0d454d8fbeceae2d5454af4e4db248f74029e3a1821b1deb343139')

build() {
  cd "ZCode-${pkgver}"

  export HUSKY=0
  export CI=1
  # 生产身份与生产后端；缺省会落到 Preview/_TEST。
  export ZCODE_ENV=production
  # 桌面本地运行不需要为 SSH/WSL 远程工作区准备的 mock-cdn 资源，跳过可省大量下载。
  export ZCODE_SKIP_REMOTE_ASSETS=1
  export ZCODE_TARGET_OS=linux
  case "${CARCH}" in
    x86_64) export ZCODE_TARGET_ARCH=x64 ;;
    aarch64) export ZCODE_TARGET_ARCH=arm64 ;;
  esac
  # node-gyp 默认把 Node 头文件解到 /tmp；构建机 /tmp 常为 tmpfs，空间不足会失败。
  export TMPDIR="${srcdir}/tmp"
  mkdir -p "${TMPDIR}"

  # 原生依赖由上游预编译包提供，跳过 install script 可避免本机重编译并跳过 Electron 运行时下载。
  pnpm install --frozen-lockfile --ignore-scripts

  # 根 packages/shared 没有 build script，先编译出 dist 供后续收集阶段使用。
  pnpm exec tsc -b packages/shared

  # 桌面构建：内部会 prepare:runtime-assets（agent bundle、native-search）再构建 out/。
  pnpm --filter "@zcode/desktop..." build

  # 只出 pacman 包；deb/rpm/AppImage 需要额外工具，Arch 侧不需要。
  # ZCODE_TARGET_* 供 electron-builder.config.js 判断目标平台。
  (
    cd packages/desktop
    pnpm exec electron-builder --config electron-builder.config.js --linux pacman --"${ZCODE_TARGET_ARCH}"
  )
}

check() {
  cd "ZCode-${pkgver}"

  local _pkg="packages/desktop/dist/ZCode-${pkgver}-linux-x64.pkg.tar.zst"

  # 关键运行时资产必须进包，否则装完启动即崩。
  bsdtar --zstd -tf "${_pkg}" | grep -qx 'opt/ZCode/zcode'
  bsdtar --zstd -tf "${_pkg}" | grep -qx 'opt/ZCode/resources/app.asar'
  bsdtar --zstd -tf "${_pkg}" | grep -qx 'opt/ZCode/resources/glm/zcode.cjs'
  bsdtar --zstd -tf "${_pkg}" | grep -qx 'opt/ZCode/resources/app.asar.unpacked/node_modules/node-pty/prebuilds/linux-x64/pty.node'

  # 随包 agent 可独立执行，验证打包后的运行时闭包完整。
  local _check_dir="${srcdir}/zcode-desktop-check"
  rm -rf "${_check_dir}"
  mkdir -p "${_check_dir}"
  bsdtar --zstd -xf "${_pkg}" -C "${_check_dir}" 'opt/ZCode/resources/glm'
  node "${_check_dir}/opt/ZCode/resources/glm/zcode.cjs" --version
}

package() {
  cd "ZCode-${pkgver}"

  local _pkg="packages/desktop/dist/ZCode-${pkgver}-linux-x64.pkg.tar.zst"
  local _extract_dir="${srcdir}/zcode-desktop-extract"
  rm -rf "${_extract_dir}"
  mkdir -p "${_extract_dir}"

  # 上游产出的就是 Arch 包，只取文件内容，元数据与 .INSTALL 由本 PKGBUILD 负责。
  bsdtar --zstd -xf "${_pkg}" -C "${_extract_dir}" \
    --exclude=.PKGINFO --exclude=.INSTALL --exclude=.MTREE --exclude=.BUILDINFO

  cp -a "${_extract_dir}/opt" "${pkgdir}/"
  cp -a "${_extract_dir}/usr" "${pkgdir}/"

  # 提供显式命令；不占用 /usr/bin/zcode，避免与 zcode-cli 冲突。
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ZCode/zcode "${pkgdir}/usr/bin/zcode-desktop"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE.md "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
}
