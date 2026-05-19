# Maintainer: collegeming <collegeming@outlook.com>
# Contributor: based on mybolide/pdmaner-final-release (v4.9.3)

pkgname=pdmaner-final
_pkgname=PDManer
_srcdir=pdmaner-final-release
pkgver=4.9.3
pkgrel=2
pkgdesc="PDManer元数建模 - 多操作系统开源免费的桌面版关系数据库模型建模工具 (最终发行版 v4.9.3)"
arch=('x86_64')
url="https://github.com/mybolide/pdmaner-final-release"
license=('MPL-2.0')
depends=(
    'electron'
    'java-runtime'
)
makedepends=(
    'npm'
)
provides=("pdmaner-final")
conflicts=("pdmaner-final")
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mybolide/pdmaner-final-release/archive/refs/tags/${pkgver}.tar.gz"
    "chiner-java.jar::https://raw.githubusercontent.com/601824142/pdmaner/develop/public/jar/chiner-java.jar"
    "pdmaner-final.sh"
    "pdmaner-final.desktop"
)
sha256sums=(
    'SKIP'
    '0a9a1159d97092483c335355cc4607a34ed513b790705c35cb36e88406b2bd68'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "${srcdir}/${_srcdir}-${pkgver}"

    install -Dm644 "${srcdir}/chiner-java.jar" "public/jar/pdmaner-java.jar"

    sed -i "s|../../app.asar.unpacked/build/jar/pdmaner-java.jar|jar/pdmaner-java.jar|g" src/main.js
    sed -i "s|../../app.asar.unpacked/build/file|file|g" src/main.js
}

build() {
    cd "${srcdir}/${_srcdir}-${pkgver}"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1

    # 安装根目录构建依赖 (webpack, babel, react 等)
    # --legacy-peer-deps: 老项目的 peer deps 冲突 (eslint 6 vs eslint-config-airbnb 要求 4/5)
    npm install --ignore-scripts --legacy-peer-deps

    # 单独安装 app/ 运行时依赖 (@electron/remote, electron-updater)
    cd app
    npm install --ignore-scripts --legacy-peer-deps
    cd ..

    # Patch @electron/remote 以兼容 Electron 42+
    # Electron 42+ 的 process._linkedBinding('electron_common_features')
    # 不再包含 isDesktopCapturerEnabled() 和 isViewApiEnabled() 方法
    # 不加此补丁会导致 vendor.js 初始化时抛 "is not a function" 错误 → 白屏
    #
    # Electron 42+ 还会从 webPreferences 中移除 enableRemoteModule 属性
    # 导致 @electron/remote v1.2.1 的 isRemoteModuleEnabledImpl 检查失败
    # 报错: @electron/remote is disabled for this WebContents
    # 补丁: 让 isRemoteModuleEnabledImpl 始终返回 true
    for _remote_dir in node_modules/@electron/remote app/node_modules/@electron/remote; do
        if [ -f "${_remote_dir}/dist/src/common/module-names.js" ]; then
            sed -i \
                -e 's/if (!features || features.isDesktopCapturerEnabled())/if (!features || !features.isDesktopCapturerEnabled || features.isDesktopCapturerEnabled())/' \
                -e 's/if (!features || features.isViewApiEnabled())/if (!features || !features.isViewApiEnabled || features.isViewApiEnabled())/' \
                "${_remote_dir}/dist/src/common/module-names.js"
        fi
        if [ -f "${_remote_dir}/dist/src/main/server.js" ]; then
            sed -i \
                's/return webPreferences.enableRemoteModule != null ? !!webPreferences.enableRemoteModule : false;/return true;/' \
                "${_remote_dir}/dist/src/main/server.js"
        fi
    done

    # NODE_OPTIONS=--openssl-legacy-provider: Node.js 17+ 默认 OpenSSL3 移除了 Webpack 4 使用的旧算法
    NODE_OPTIONS=--openssl-legacy-provider npm run build
}

package() {
    cd "${srcdir}/${_srcdir}-${pkgver}"

    # ---- 安装应用文件 ----
    local appdir="${pkgdir}/usr/lib/${pkgname}"
    install -d "${appdir}/app"

    # Webpack 构建产物 (app/build/)
    cp -r app/build "${appdir}/app/"

    # public/ 下的资源 (public/asset, public/icons 等会被 CopyWebpackPlugin 复制到 app/build/)
    # 但已经包含在 app/build/ 中了
    # 额外复制 jar 和 template 目录（CopyWebpackPlugin 没处理它们）
    if [ -d "public/jar" ]; then
        cp -r public/jar "${appdir}/app/build/"
    fi
    if [ -d "public/file" ]; then
        cp -r public/file "${appdir}/app/build/"
    fi

    # app/package.json 和运行时依赖
    cp app/package.json "${appdir}/app/"
    if [ -d "app/node_modules" ]; then
        cp -r app/node_modules "${appdir}/app/"
    fi

    # 图标
    install -Dm644 public/icons/icon_256x256.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 public/icons/icon_128x128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 public/icons/icon_64x64.png \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
    install -Dm644 public/icons/icon_48x48.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
    install -Dm644 public/icons/icon_32x32.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
    install -Dm644 public/icons/icon_16x16.png \
        "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"

    # ---- 启动脚本 ----
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # ---- .desktop 文件 ----
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # ---- license ----
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
