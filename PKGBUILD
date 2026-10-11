# Maintainer: rcdfrd <rcdfrd@gmail.com>
#
# 开源版 ZCode：从 zai-org/ZCode 源码构建命令行 TUI 与 Web 工作台。
# 与 AUR 上基于官方 Linux 二进制的 zcode / z-code-bin / zcode-bin 等包不同，
# 本包只使用上游 Apache-2.0 源码，产物为 `zcode` 命令（无参数进入 TUI，`--web` 启动 Web）。

pkgname=zcode-cli
pkgver=3.15.1
pkgrel=1
pkgdesc="ZCode open-source AI coding workbench (TUI + Web) built from source"
arch=('x86_64' 'aarch64')
url="https://github.com/zai-org/ZCode"
license=('Apache-2.0')
# 发行包本身是 JS，运行仍需 Node.js；上游 mise.toml 固定 Node 24，已在 24/26 上验证。
depends=('nodejs')
makedepends=('pnpm')
# 提供同名命令，与安装 /usr/bin/zcode 的桌面端包互斥。
conflicts=('zcode' 'zcode-bin' 'z-code-bin' 'zcode-desktop-bin' 'zcode-ce-bin' 'zcode-pro' 'zcode-redminote11tech')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfab1f9fdf0d454d8fbeceae2d5454af4e4db248f74029e3a1821b1deb343139')

# build:zcode 生成的 install.sh 只用于自更新索引，这里填入上游 release 地址作为占位。
_dist_base_url="${url}/releases/download/v${pkgver}/"

build() {
  cd "ZCode-${pkgver}"

  # 避免 husky 在非 git 目录里执行 prepare 钩子。
  export HUSKY=0
  export CI=1
  # node-gyp 默认把 Node 头文件解到 /tmp；构建机 /tmp 常为 tmpfs，空间不足会直接失败。
  export TMPDIR="${srcdir}/tmp"
  mkdir -p "${TMPDIR}"

  # 发行所需的 node-pty / sharp / koffi 等原生依赖都由上游预编译包提供，
  # 不需要在本机重新编译；跳过 install script 也能避免拉取 Electron 运行时。
  pnpm install --frozen-lockfile --ignore-scripts

  # 根 packages/shared 没有 build script，但 TUI runtime 收集阶段要求它的 dist 产物；
  # 上游 build:zcode 不会自行编译它，缺这一步会在 stageTuiRuntime 直接失败。
  pnpm exec tsc -b packages/shared

  pnpm --filter "@zcode/cli..." build
  pnpm --filter "@zcode/server..." build
  pnpm --filter "@zcode/web..." build

  pnpm build:zcode --skip-build --base-url "${_dist_base_url}" --out-dir dist/zcode
}

check() {
  cd "ZCode-${pkgver}"

  local _check_dir="${srcdir}/zcode-check"
  rm -rf "${_check_dir}"
  mkdir -p "${_check_dir}"
  tar -xzf "dist/zcode/releases/${pkgver}/zcode-${pkgver}.tar.gz" -C "${_check_dir}"

  node "${_check_dir}/zcode/bin/zcode.mjs" --version
  node "${_check_dir}/zcode/bin/zcode.mjs" --web --help
}

package() {
  cd "ZCode-${pkgver}"

  local _stage_dir="${srcdir}/zcode-stage"
  rm -rf "${_stage_dir}"
  mkdir -p "${_stage_dir}"
  tar -xzf "dist/zcode/releases/${pkgver}/zcode-${pkgver}.tar.gz" -C "${_stage_dir}"

  install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -a "${_stage_dir}/zcode" "${pkgdir}/usr/lib/zcode"

  # bin/zcode.mjs 自带 `#!/usr/bin/env node`，软链即可作为 /usr/bin/zcode 使用。
  ln -s /usr/lib/zcode/bin/zcode.mjs "${pkgdir}/usr/bin/zcode"
  ln -s /usr/lib/zcode/bin/zcode.mjs "${pkgdir}/usr/bin/zcode-cli"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE.md "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
  install -Dm644 THIRD-PARTY-NOTICES.md \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
}
