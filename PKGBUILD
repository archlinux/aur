# Maintainer: Yishan <wwwww95915@qq.com>
pkgname=neo-mofox-launcher-git
_pkgname='Neo-MoFox Launcher'
_appname=neo-mofox-launcher
_zhsname='Neo-MoFox 启动器'
pkgver=r196.bace2bb
_electronversion=39
pkgrel=1
pkgdesc="An elegant instance management launcher for Neo-MoFox QQ Bot. - 一个优雅的 Neo-MoFox QQ 机器人实例管理启动器"
arch=(
    'x86_64'
)
url="https://github.com/MoFox-Studio/Neo-MoFox-Launcher"
license=('AGPL-3.0')
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
    'git'
)
makedepends=(
    'npm'
    'git'
    'gendesk'
    'jq'
)
provides=("${_appname}")
conflicts=("${_appname}")
optdepends=(
    'uv: Python 包管理器'
)
source=(
    "${_appname}::git+${url}.git"
    "${_appname}.sh"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/${_appname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${_appname}/Neo-MoFox-Launcher/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}

prepare() {
    cd "${srcdir}/${_appname}"
    _get_electron_version
    
    # 配置启动脚本
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_appname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${_appname}.sh"
    
    # 生成桌面文件
    gendesk -q -f -n \
        --pkgname="${_appname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${_appname} %U" \
        --custom=Name[zh_CN]="${_zhsname}"
    
    cd "${srcdir}/${_appname}/Neo-MoFox-Launcher"
    
    # 设置系统 Electron 版本
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    
    # 如果在中国，使用镜像源
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    
    # 更新 package.json 中的 electron 版本
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    
    # 安装依赖
    NODE_ENV=development npm install
}

build() {
    cd "${srcdir}/${_appname}/Neo-MoFox-Launcher"
    
    local electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    
    # 使用 electron-builder 构建
    NODE_ENV=production npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}

package() {
    # 安装启动脚本
    install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    # 安装 CLI 命令行包装脚本（无桌面环境亦可使用）
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/neo-mofox-cli" <<'CLI_EOF'
#!/usr/bin/env bash
# /usr/bin/neo-mofox-cli — Neo-MoFox Launcher 命令行入口
INSTALL_DIR="/usr/lib/neo-mofox-launcher"
CLI_ENTRY="${INSTALL_DIR}/app.asar/src/cli/index.js"
[ -f "${CLI_ENTRY}" ] || CLI_ENTRY="${INSTALL_DIR}/resources/app.asar/src/cli/index.js"

if command -v node >/dev/null 2>&1; then
    exec node "${CLI_ENTRY}" "$@"
fi
for v in 39 38 37 36 35; do
    if command -v "electron${v}" >/dev/null 2>&1; then
        exec env ELECTRON_RUN_AS_NODE=1 "electron${v}" "${CLI_ENTRY}" "$@"
    fi
done
echo "错误: 未找到可用的 node 或 electron 运行时" >&2
exit 1
CLI_EOF
    
    # 安装应用文件
    install -Dm755 -d "${pkgdir}/usr/lib/${_appname}"
    cp -a "${srcdir}/${_appname}/Neo-MoFox-Launcher/dist/linux-"*"/resources/". "${pkgdir}/usr/lib/${_appname}/"
    
    # 安装桌面文件
    install -Dm644 "${srcdir}/${_appname}/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
    
    # 安装图标
    if [ -f "${srcdir}/${_appname}/Neo-MoFox-Launcher/assets/images/icon.png" ]; then
        install -Dm644 "${srcdir}/${_appname}/Neo-MoFox-Launcher/assets/images/icon.png" \
            "${pkgdir}/usr/share/pixmaps/${_appname}.png"
    fi
    
    # 安装许可证
    install -Dm644 "${srcdir}/${_appname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${_appname}/LICENSE"
}
