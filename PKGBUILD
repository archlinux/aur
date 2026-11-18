# Maintainer: liyp <my@liyp.cc>
pkgname=kun
pkgver=0.4.5
pkgrel=1
pkgdesc="AI agent workspace with Code and Write modes - Electron client"
arch=('x86_64')
url="https://github.com/KunAgent/Kun"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('electron43')
makedepends=('npm' 'nodejs>=22' 'python')
optdepends=('libxss: screen saver inhibit support'
            'libappindicator-gtk3: system tray support on GTK-based DEs')
replaces=('kun-gui')
conflicts=('kun-gui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KunAgent/Kun/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f89101120a9aa5697f12e249a14367d4c2822550a15994de9f9191653a646d77')
options=('!strip')

# 本包不用 electron-builder 的 asar 布局：以「目录模式」跑 `electron43 /usr/lib/kun`，
# Electron 仍令 app.isPackaged=true，而 process.resourcesPath 指向系统 electron 目录。
# 下面把上游的 isPackaged 分支统一改走 appRoot 分支，并校验替换确实生效。
_patch() {
    local file="src/$1"
    sed -i "$2" "$file"
    if ! grep -qF -- "$3" "$file"; then
        echo ":: 补丁未生效: $file (期望: $3)" >&2
        return 1
    fi
}

prepare() {
    cd "${srcdir}/Kun-${pkgver}"

    # X11 WM_CLASS / Wayland app_id 必须小写匹配 kun.desktop 的 StartupWMClass
    _patch shared/app-environment.ts \
        "s/export const PRODUCTION_APP_NAME = 'Kun'/export const PRODUCTION_APP_NAME = 'kun'/" \
        "PRODUCTION_APP_NAME = 'kun'"
    # electron-vite 不写版本，app.getVersion() 需要显式兜底
    _patch main/app-identity.ts \
        "s/app.setName(identity.appName)/app.setName(identity.appName); app.setVersion(\"${pkgver}\");/" \
        "app.setVersion(\"${pkgver}\")"

    # 资源解析：bundled-extensions / officecli / bundled-skills / ppt-toolchain
    _patch main/bundled-extension-resources.ts 's/input.isPackaged/false/' 'resolve(false'
    _patch main/officecli-resources.ts 's/input.isPackaged/false/' 'const candidates = false'
    _patch main/bundled-skill-resources.ts \
        's/const isPackaged = options?.isPackaged ?? app.isPackaged/const isPackaged = false/' \
        'const isPackaged = false'
    _patch main/kun-process.ts \
        's/const pptToolchainDirectory = app.isPackaged/const pptToolchainDirectory = false/' \
        'const pptToolchainDirectory = false'
    # 内置宠物资源（0.4.x 新增 resources/pets）
    _patch main/pets/pet-service.ts \
        's/resolveBuiltinPetsRoot({ packaged: app.isPackaged, /resolveBuiltinPetsRoot({ packaged: false, /' \
        'resolveBuiltinPetsRoot({ packaged: false, '

    # 安装健康检查按 asar 布局校验，改成校验本包布局（main 入口 + kun 运行时入口）
    _patch main/packaged-install-health.ts \
        "s|{ label: 'resources/app.asar', path: join(input.resourcesPath, 'app.asar') }|{ label: 'main bundle', path: join(input.resourcesPath, 'out', 'main', 'index.js') }|" \
        "'main bundle'"
    sed -i "s|join(input.resourcesPath, 'app.asar.unpacked', 'kun', 'dist'|join(input.resourcesPath, 'kun', 'dist'|" \
        src/main/packaged-install-health.ts
    [ "$(grep -cF "'kun', 'dist'" src/main/packaged-install-health.ts)" -eq 2 ] || {
        echo ":: 补丁未生效: src/main/packaged-install-health.ts (kun 运行时入口路径)" >&2
        return 1
    }
    _patch main/main-ready-shell.ts \
        's/resourcesPath: process.resourcesPath/resourcesPath: app.getAppPath()/' \
        'resourcesPath: app.getAppPath()'

    # 本包没有随附 kun CLI 二进制，跳过首启的 CLI 软链提示
    _patch main/cli-install-service.ts \
        's/if (!app.isPackaged || (process.platform !== '"'"'darwin'"'"' \&\& process.platform !== '"'"'linux'"'"')) return/if (true) return/' \
        'if (true) return'

    # 上游 lockfile 的 resolved 指向 registry.npmmirror.com，npm 12 默认拒绝非 registry 主机的
    # tarball URL（allow-remote=none），这里改回官方 registry 并显式放行 xlsx 的 sheetjs CDN 依赖
    sed -i 's|https://registry.npmmirror.com|https://registry.npmjs.org|g' package-lock.json kun/package-lock.json

    # 跳过 postinstall（它会构建 kun 并下载 electron 预编译），依赖与原生模块在 build() 处理
    npm install --ignore-scripts --allow-remote=all
    npm --prefix kun install --allow-remote=all
}

build() {
    cd "${srcdir}/Kun-${pkgver}"

    # 与上游一致的生产构建：扩展工作区 + kun 运行时 + 资源自检 + electron-vite + canvas-app
    npm run build
    if [ ! -f "kun/dist/cli/serve-entry.js" ] || [ ! -f "kun/dist/manager/manager-entry.js" ]; then
        echo "ERROR: kun runtime build failed - serve-entry.js / manager-entry.js not found" >&2
        return 1
    fi

    # 按系统 electron ABI 重建原生模块（node-pty 等无 electron linux-x64 预编译）
    local _electron_ver
    _electron_ver=$(electron43 --version | sed 's/^v//')
    echo "==> Rebuilding native modules for Electron ${_electron_ver}..."
    # cpu-features 是 ssh2 的可选依赖，--ignore-scripts 下不会生成 buildcheck.gypi，跳过重建
    npx @electron/rebuild -f -v "${_electron_ver}" -o better-sqlite3,node-pty -m .
    npx @electron/rebuild -f -v "${_electron_ver}" -m ./kun

    npm prune --production
    npm --prefix kun prune --production
}

package() {
    cd "${srcdir}/Kun-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"

    # main/preload/renderer + out/canvas-app
    cp -r out "${pkgdir}/usr/lib/${pkgname}/out"
    install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"

    # 生产 node_modules（原生模块已按 electron43 ABI 重建）
    cp -r node_modules "${pkgdir}/usr/lib/${pkgname}/node_modules"

    # kun 运行时：appRoot/kun，其 node_modules 里 @kun/* 是指向 packages/ 的符号链接
    cp -r kun "${pkgdir}/usr/lib/${pkgname}/kun"
    cp -r packages "${pkgdir}/usr/lib/${pkgname}/packages"

    # 运行时资源：bundled-skills / bundled-extensions / officecli / ppt-toolchain / whisper / pets
    cp -r resources "${pkgdir}/usr/lib/${pkgname}/resources"

    # 上游 vendor（openclaw-shim 与 @kun/* 的 tgz 依赖）
    if [ -d "vendor" ]; then
        cp -r vendor "${pkgdir}/usr/lib/${pkgname}/vendor"
    fi

    # packages/* 的 node_modules 已提升至根 node_modules，保留只会造成重复
    find "${pkgdir}/usr/lib/${pkgname}/packages" -type d -name node_modules -prune -exec rm -rf {} + 2>/dev/null || true

    local lib="${pkgdir}/usr/lib/${pkgname}"

    # kun 运行时必须向上解析到根 node_modules 里按 electron ABI 重建的 better-sqlite3
    rm -rf "${lib}/kun/node_modules/better-sqlite3"

    # 只保留 glibc x86_64 的原生产物（其余平台/ABI 的产物无用）
    rm -rf "${lib}/kun/node_modules/@anthropic-ai/claude-agent-sdk-linux-x64-musl"
    rm -rf "${lib}/kun/node_modules/@napi-rs/canvas-linux-x64-musl"
    rm -rf "${lib}/node_modules/@napi-rs/canvas-linux-x64-musl"
    rm -rf "${lib}/node_modules/@img/sharp-linuxmusl-x64" "${lib}/node_modules/@img/sharp-libvips-linuxmusl-x64"
    rm -rf "${lib}/kun/node_modules/@opentui/core-linux-x64-musl"
    rm -rf "${lib}/node_modules/@ubjs/node-linux-x64-musl"
    rm -rf "${lib}/node_modules/node-pty/prebuilds"
    rm -rf "${lib}/node_modules/@computer-use/libnut-darwin" "${lib}/node_modules/@computer-use/libnut-win32"
    rm -rf "${lib}/kun/node_modules/@computer-use/libnut-darwin" "${lib}/kun/node_modules/@computer-use/libnut-win32"
    for tree in "${lib}/node_modules" "${lib}/kun/node_modules"; do
        find "${tree}/bare-url/prebuilds" -mindepth 1 -maxdepth 1 -type d ! -name 'linux-x64' \
            -exec rm -rf {} + 2>/dev/null || true
    done

    # 只保留本机平台的 whisper 预编译产物
    find "${pkgdir}/usr/lib/${pkgname}/resources/whisper" -mindepth 1 -maxdepth 1 -type d \
        ! -name 'linux-x64' -exec rm -rf {} + 2>/dev/null || true

    # 瘦身：只删源码映射与类型定义（不动 doc/test 之类目录，上游会从里面取运行时文件）
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "*.map" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "*.d.ts" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "README*" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name "CHANGELOG*" -delete
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -name ".package-lock.json" -delete
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/typescript"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/@types"

    # kun 运行时瘦身：只留 dist 与 node_modules
    rm -rf "${pkgdir}/usr/lib/${pkgname}/kun/src"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/kun/tests"
    rm -rf "${pkgdir}/usr/lib/${pkgname}/kun/scripts"
    rm -f "${pkgdir}/usr/lib/${pkgname}/kun/package-lock.json"
    find "${pkgdir}/usr/lib/${pkgname}/kun/dist" -name "*.map" -delete
    find "${pkgdir}/usr/lib/${pkgname}/kun/node_modules" -name "*.map" -delete
    find "${pkgdir}/usr/lib/${pkgname}/kun/node_modules" -name "*.d.ts" -delete
    find "${pkgdir}/usr/lib/${pkgname}/kun/node_modules" -name "*.d.ts.map" -delete

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'LAUNCHER'
#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

if [[ -f "${XDG_CONFIG_HOME}/kun-flags.conf" ]]; then
	mapfile -t KUN_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/kun-flags.conf")"
	echo "User flags:" ${KUN_USER_FLAGS[@]}
fi

# 优先原生 Wayland，无则回退 X11
export ELECTRON_OZONE_PLATFORM_HINT=${ELECTRON_OZONE_PLATFORM_HINT:-auto}
# XWayland 激活（DISPLAY 已设）时也启用 Wayland IME
export KUN_LINUX_WAYLAND_IME=${KUN_LINUX_WAYLAND_IME:-1}
# Wayland app_id 由 CHROME_DESKTOP 决定，须与 kun.desktop 匹配
export CHROME_DESKTOP=kun

# 输入法环境变量（fcitx5/ibus）
if [[ -z "${GTK_IM_MODULE}" ]]; then
	if [[ -n "${XMODIFIERS}" && "${XMODIFIERS}" == *"fcitx"* ]]; then
		export GTK_IM_MODULE=fcitx
	elif command -v fcitx5 &>/dev/null; then
		export GTK_IM_MODULE=fcitx
		export XMODIFIERS=${XMODIFIERS:-@im=fcitx}
	elif command -v ibus-daemon &>/dev/null; then
		export GTK_IM_MODULE=ibus
		export XMODIFIERS=${XMODIFIERS:-@im=ibus}
	fi
fi

exec -a kun /bin/electron43 /usr/lib/kun \
	--name=kun \
	${KUN_USER_FLAGS[@]} "$@"
LAUNCHER

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << 'EOF'
[Desktop Entry]
Name=Kun
Comment=AI agent workspace with Code and Write modes
Exec=kun %U
Icon=kun
Type=Application
Categories=Development;
StartupWMClass=kun
EOF

    install -Dm644 "src/asset/img/kun.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kun.png"
    install -Dm644 "src/asset/img/kun.png" "${pkgdir}/usr/share/pixmaps/kun.png"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
PolyForm Noncommercial License 1.0.0
https://polyformproject.org/licenses/noncommercial/1.0.0

Copyright (c) 2026 xingyu
EOF
}
