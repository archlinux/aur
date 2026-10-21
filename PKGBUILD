# Maintainer: lucaszhou007@163.com
pkgname=toonflow
pkgver=2.0.7
pkgrel=1
pkgdesc="AI 驱动的短剧 / 漫剧创作平台（Web 界面 + 本地服务端）"
arch=('x86_64')
url="https://github.com/HBAI-Ltd/Toonflow-app"
license=('MIT')
depends=('bun')
optdepends=(
  'ffmpeg: 在设置中选择“系统”模式以复用系统 FFmpeg'
)
# 上游标签 v2.0.7 对应提交 30139c931e80476caa718b31684b86383c6e83ce。
# 使用标签归档而非 git 仓库：下载量小一个数量级（约 11 MB 对 209 MB），
# 且内容固定、可校验，不受上游强制移动标签的影响。
source=("$pkgname-$pkgver.tar.gz::https://github.com/HBAI-Ltd/Toonflow-app/archive/refs/tags/v$pkgver.tar.gz"
        'toonflow' 'toonflow.service' 'toonflow.sysusers' 'toonflow.conf')
sha256sums=('855cab916ac0163c3d39b944b52c3729605d36493a00a3ec7391ca34d00acccb'
            'c8c2a793076815c041c6e48d46da6a2c58d086dd1fb7240286ae7a4ded423f27'
            '68eae09d3142f626cde943801fa2d1499bb23ec0bd2d87d7667d4ad63d28b9b0'
            '807edaa2f8fdc12d64efea06a59d49a4e9ada7a27eb95dd761a246de67a3ebb2'
            '8d9bf4cd8ddf67b9e9f6f35f825e1162eb42b876a4b237692722dc4f87447194')
# /etc 下的可修改配置，升级时保留用户改动（生成 .pacnew）
backup=('etc/conf.d/toonflow')

prepare() {
  cd "Toonflow-app-$pkgver"

  # 上游 bun.lock 固化了已停止服务的 registry.npm.taobao.org 以及国内镜像
  # registry.npmmirror.com 的下载地址，统一改写为官方 npm registry。
  # 仅替换下载地址，不影响版本号与 sha512 完整性校验，--frozen-lockfile 仍可正常解析。
  sed -i \
    -e 's|http://registry\.npm\.taobao\.org|https://registry.npmjs.org|g' \
    -e 's|https://registry\.npmmirror\.com|https://registry.npmjs.org|g' \
    bun.lock
}

build() {
  cd "Toonflow-app-$pkgver"

  # electrobun.config.ts 通过 process.env.appVersion 注入版本号，缺省会回落到 2.0.0。
  export appVersion="${pkgver}"

  # 注意：构建需要访问 npm registry 下载依赖。
  bun install --frozen-lockfile
  bun run build:server
}

check() {
  cd "Toonflow-app-$pkgver"

  # 验证服务端入口与关键产物已生成（任一缺失则 check 失败，makepkg 中止）。
  if [[ ! -f build/server/index.js ]]; then
    printf 'build/server/index.js 缺失\n' >&2
    return 1
  fi
  if [[ ! -d build/web ]]; then
    printf 'build/web 缺失\n' >&2
    return 1
  fi

  # 产物中不应残留构建机的绝对路径（上游曾因此导致运行时找不到 WASM / 原生文件）。
  if grep -qF "$srcdir" build/server/index.js; then
    printf 'build/server/index.js 中残留构建路径：%s\n' "$srcdir" >&2
    return 1
  fi
}

package() {
  cd "Toonflow-app-$pkgver"

  # 运行时产物整体安装到 /usr/lib/toonflow
  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -r build "${pkgdir}/usr/lib/${pkgname}/build"

  # 上游产物中 MCP stdio 与 anydoc CLI 声明的是 node 解释器，但本包运行时为 bun
  # （MCP stdio 由 bun 启动，anydoc CLI 亦可用 bun 执行），改写 shebang 保持一致。
  sed -i 's|^#!/usr/bin/env node$|#!/usr/bin/env bun|' \
    "${pkgdir}/usr/lib/${pkgname}/build/mcp/stdio.js" \
    "${pkgdir}/usr/lib/${pkgname}/build/server/node_modules/@firecrawl/anydoc/cli.js"

  # 启动脚本
  install -Dm755 "${srcdir}/toonflow" "${pkgdir}/usr/bin/toonflow"

  # systemd 服务（专用账户 + 状态目录）
  install -Dm644 "${srcdir}/toonflow.service" "${pkgdir}/usr/lib/systemd/system/toonflow.service"

  # 服务专用系统账户（pacman 的 systemd 钩子会自动调用 systemd-sysusers）
  install -Dm644 "${srcdir}/toonflow.sysusers" "${pkgdir}/usr/lib/sysusers.d/toonflow.conf"

  # 可在 /etc/conf.d/toonflow 中修改端口、数据目录等（已列入 backup）
  install -Dm644 "${srcdir}/toonflow.conf" "${pkgdir}/etc/conf.d/toonflow"

  # 许可证
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
