# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
# Maintainer: Evan Simkowitz <https://simkowitz.dev/>
pkgname=waveterm
_pkgname=Wave
_appname="${_pkgname} Terminal"
pkgver=0.11.5
_electronversion=37
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
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('fced21e18e379c90cd0cfa722b9d71b73d80ea6c0ad4d9e262409bc8c889485f'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver="$(grep '^ *"electron": *"' "${srcdir}/${pkgname}-${pkgver}/package.json" | cut -d'"' -f4 | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
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
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export RUBY_ENV="production"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'npmRegistryServer: "https://registry.npmmirror.com"'
            echo "cacheFolder: "${srcdir}"/.yarn/cache"
            echo "globalFolder: "${srcdir}"/.yarn/global"
            echo 'networkConcurrency: 10'
        } >> .yarnrc.yml
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        export GOPROXY=https://goproxy.cn,direct
        gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
        bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/build\/icons.icns/build\/appicon.png/g" electron-builder.config.cjs
    sed -i -e "
        /- task: build:server:macos/d
        /- task: build:server:windows/d
        s/ && yarn electron-builder -c electron-builder.config.cjs -p never//g
    " Taskfile.yml
    gem install fpm
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    echo y | yarn version "${_yarnver}"
    NODE_ENV=production     go-task init
    NODE_ENV=development    yarn add node-gyp --dev
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     go-task package
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" -c electron-builder.config.cjs
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
