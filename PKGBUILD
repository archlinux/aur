# Maintainer: zhaole_lv
pkgname=happier-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Open-source companion for AI coding agents (Claude Code, Codex, OpenCode, etc.)"
arch=('x86_64' 'aarch64')
url="https://github.com/happier-dev/happier"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=(
    'ripgrep: file search (bundled fallback included)'
    'difftastic: structural diff (bundled fallback included)'
)
source=("https://registry.npmjs.org/@happier-dev/cli/-/cli-${pkgver}.tgz")
noextract=("cli-${pkgver}.tgz")
sha256sums=('d906d15a02455a689328090f2127a4da2cfc5a69e6a5255d800d4f01412ffe95')

package() {
    # 跳过所有 postinstall 脚本 (避免 onnxruntime-node 下载 GPU 二进制)
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        --ignore-scripts \
        "${srcdir}/cli-${pkgver}.tgz"

    local _npmdir="${pkgdir}/usr/lib/node_modules/@happier-dev/cli"

    # 手动运行 happier 自己的 unpack-tools 脚本 (解压 bundled ripgrep/difftastic)
    if [[ -f "${_npmdir}/scripts/unpack-tools.cjs" ]]; then
        cd "${_npmdir}"
        node scripts/unpack-tools.cjs || true
    fi

    # 删除非本平台的 bundled 工具二进制, 节省约 60MB
    local _arch
    case "${CARCH}" in
        x86_64)  _arch="x64-linux" ;;
        aarch64) _arch="arm64-linux" ;;
    esac
    if [[ -d "${_npmdir}/tools/archives" ]]; then
        find "${_npmdir}/tools/archives" -type f \
            ! -name "*${_arch}*" \
            ! -name "*LICENSE*" \
            -delete
    fi

    # 仅修正实际包含打包绝对路径的 package.json，避免在 fakeroot 下
    # 对整个 npm 依赖树做无意义的原地改写而卡死。
    grep -rlZ -F --include="package.json" -- "${pkgdir}" "${pkgdir}" \
        | xargs -0r sed -i "s|${pkgdir}||g"

    # 清理 npm 缓存残留
    find "${pkgdir}" -name ".package-lock.json" -delete

    # 修正目录权限
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # 安装许可证
    install -Dm644 "${_npmdir}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
