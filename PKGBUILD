# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
# Maintainer: Evan Simkowitz <https://simkowitz.dev/>
pkgname=waveterm
_pkgname=Wave
_appname="${_pkgname} Terminal"
pkgver=0.9.0
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows.Use system-wide electron."
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
    'gcc'
    'gendesk'
    'npm'
    'go'
    'curl'
    'gcc'
    'zip'
    'curl'
    'nvm'
    'ruby'
    'go-task'
    'zig'
    'ruby-bundler'
    'libarchive'
    'openjpeg2'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('c813253fdcc29798e6aa2cbf085b0f7b43762d29ed0000157cbad38cca478207'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_appname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc.yml"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'npmRegistryServer: "https://registry.npmmirror.com"'
            echo "cacheFolder: "${srcdir}"/.yarn/cache"
            echo "globalFolder: "${srcdir}"/.yarn/global"
        } >> .yarnrc.yml
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        go env -w GOPROXY=https://goproxy.cn,direct
        gem sources --add https://mirrors.aliyun.com/rubygems/ --remove https://rubygems.org/
        bundle config mirror.https://rubygems.org https://mirrors.aliyun.com/rubygems
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/build\/icons.icns/build\/appicon.png/g" electron-builder.config.cjs
    sed -e "
        /- build:server:macos/d
        /- build:server:windows/d
        s/ && yarn electron-builder -c electron-builder.config.cjs -p never//g
    " -i Taskfile.yml
    sed -i "139,146d;123,130d" Taskfile.yml
    gem install fpm
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    echo y | yarn version "${_yarnver}"
    NODE_ENV=development    yarn install
    NODE_ENV=production     go-task package
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" -c electron-builder.config.cjs
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
