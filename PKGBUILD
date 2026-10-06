# Maintainer: duanluan <duanluan@outlook.com>

pkgname=minimax-code
_pkgname='@minimax-ai/code'
pkgver=0.6.3
pkgrel=1
# upstream optionalDependencies pin
_better_sqlite3_ver=12.11.1
pkgdesc='MiniMax Code terminal AI coding agent (mcode CLI)'
arch=('x86_64' 'aarch64')
url='https://agent.minimax.cn/download'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'nodejs>=22.19'
)
makedepends=(
  'node-gyp'
  'npm'
  'python'
)
optdepends=(
  'git: version control features'
)
options=('!strip')
source=('LICENSE')
sha256sums=('9d8b53a4e5afaa1b1cae3e7e5048952cd09050722951cab6638163500e0b3579')

prepare() {
  cd "${srcdir}"

  rm -rf app
  install -dm755 app
  cd app

  # 固定用系统 /usr/bin/node 附带的 npm 安装，保证后面编译的原生绑定和运行时 ABI（Node 内部模块版本）一致
  PATH="/usr/bin:/usr/sbin:/bin" /usr/bin/npm install \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    --omit=dev \
    "${_pkgname}@${pkgver}" \
    "better-sqlite3@${_better_sqlite3_ver}"

  # 上游 better-sqlite3 的 install 脚本会下载预编译绑定，打包时改为用系统 Node 头文件本地编译
  cd "${srcdir}/app/node_modules/better-sqlite3"
  /usr/bin/node-gyp rebuild --release --nodedir=/usr

  cd "${srcdir}/app/node_modules"

  # ripgrep 和剪贴板库带了各平台预编译包，只保留当前架构用到的
  local keep_rid keep_cid entry
  case "${CARCH}" in
    x86_64)
      keep_rid='ripgrep-linux-x64'
      keep_cid='clipboard-linux-x64-gnu'
      ;;
    aarch64)
      keep_rid='ripgrep-linux-arm64'
      keep_cid='clipboard-linux-arm64-gnu'
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  for entry in @vscode/ripgrep-* @mariozechner/clipboard-*; do
    case "${entry}" in
      "@vscode/${keep_rid}"|"@mariozechner/${keep_cid}") ;;
      *) rm -rf "${entry}" ;;
    esac
  done

  # macOS / Windows 的原生小模块和 Windows 启动脚本在 Linux 上不会被加载
  rm -rf "${srcdir}/app/node_modules/${_pkgname}/native/darwin" \
    "${srcdir}/app/node_modules/${_pkgname}/native/win32"
  rm -f "${srcdir}/app/node_modules/${_pkgname}/internal-bin/mcode-tools.cmd"
  chmod 755 "${srcdir}/app/node_modules/${_pkgname}/internal-bin/mcode-tools"

  # 清掉 better-sqlite3 的编译中间产物，只留编译好的绑定
  cd "${srcdir}/app/node_modules/better-sqlite3"
  rm -rf deps src build/Release/obj.target build/Release/.deps docs test benchmark
  rm -f binding.gyp Makefile build/Makefile build/*.mk build/config.gypi
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a app/node_modules "${pkgdir}/opt/${pkgname}/node_modules"

  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/opt/${pkgname}" -type f -perm /111 -exec chmod 755 '{}' +
  find "${pkgdir}/opt/${pkgname}" -type f ! -perm /111 -exec chmod 644 '{}' +

  # 启动器固定走系统 Node：原生绑定是按它编译的，换别的 Node 可能加载失败
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcode" <<'SCRIPT'
#!/bin/sh
exec /usr/bin/node /opt/minimax-code/node_modules/@minimax-ai/code/cli.js "$@"
SCRIPT
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcode-tools" <<'SCRIPT'
#!/bin/sh
exec /usr/bin/node /opt/minimax-code/node_modules/@minimax-ai/code/mcode-tools.js "$@"
SCRIPT

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
