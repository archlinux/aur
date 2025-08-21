# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
pkgname=waveterm-git
_pkgname=Wave
pkgver=0.11.4.r1.g6845cd5
_electronversion=37
_nodeversion=22
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows.(Git version.Use system-wide electron)"
arch=('any')
url="https://www.waveterm.dev/"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'git'
    'go'
    'ruby'
    'go-task'
    'cmake'
    'zip'
    'nvm'
    'curl'
    'zig'
    'libarchive'
    'openjpeg2'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        {
            echo 'npmRegistryServer: "https://registry.npmmirror.com"'
            echo "cacheFolder: "${srcdir}"/.yarn/cache"
            echo "globalFolder: "${srcdir}"/.yarn/global"
        } >> .yarnrc.yml
        export GOPROXY=https://goproxy.cn,direct
        gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
        bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
    else
        echo "Your network is OK."
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/build\/icons.icns/build\/appicon.png/g" electron-builder.config.cjs
    sed -e "
        /- task: build:server:macos/d
        /- task: build:server:windows/d
        s/ && yarn electron-builder -c electron-builder.config.cjs -p never//g
    " -i Taskfile.yml
    gem install fpm
    _yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
    corepack enable yarn
    echo y | yarn version "${_yarnver}"
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     go-task package
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" -c electron-builder.config.cjs
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/make/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/make/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
}
