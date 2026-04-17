# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
# Maintainer: Evan Simkowitz <https://simkowitz.dev/>
pkgname=waveterm
_pkgname=Wave
_appname="${_pkgname} Terminal"
pkgver=0.14.5
_electronversion=41
_nodeversion=22
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.waveterm.dev/"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache-2.0')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'go'
    'curl'
    'zip'
    'curl'
    'nvm'
    'ruby'
    'go-task'
    'zig'
    'ruby-bundler'
    'libarchive'
    'openjpeg2'
    'python'
    'git'
    'yarn'
)
source=("${pkgname}.sh")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver="$(grep '"electron":' "${srcdir}/${pkgname}-${pkgver}/package.json" | cut -d'"' -f4 | tr -d '^' | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}"
    if [[ ! -d "${pkgname}-${pkgver}" ]]; then
        git clone \
            --depth 1 \
            --branch "v${pkgver}" \
            "${_ghurl}" \
            "${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _get_electron_version
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_appname}" \
        --exec="${pkgname} %U"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export RUBY_ENV="production"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        # 设置Go代理
        export GOPROXY=https://goproxy.cn,direct
        # 设置Ruby使用国内镜像
        gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
        bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
        # 设置npm使用国内镜像
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
		export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
		export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/build\/icons.icns/build\/appicon.png/g" electron-builder.config.cjs
    sed -i -e "
        s/npm install/NODE_ENV=development npm install --include=optional/g
        /- task: build:server:macos/d
        /- task: build:server:windows/d
        s/ && npm exec electron-builder -- -c electron-builder.config.cjs -p never {{.CLI_ARGS}}//g
    " Taskfile.yml
    find emain -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    gem install fpm
    NODE_ENV=development    npm add -D node-gyp sharp
    NODE_ENV=development    go-task init
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     go-task package
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} -c electron-builder.config.cjs"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -a "${srcdir}/${pkgname}-${pkgver}/make/linux-"*"/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
