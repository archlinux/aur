# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inkdown-git
_pkgname=Inkdown
pkgver=2.0.1.r0.gc31eb37
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience. and generate your Markdown files into online documents in the easiest and fastest way.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1943time/inkdown"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'npm'
    'pnpm'
    'git'
    'nvm'
    'gendesk'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
        echo "network-concurrency=32"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/\/\${platform}\/\${arch}//g" electron-builder.yml
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=development    pnpm run build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.yml"
    rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/{darwin,win32}
    case "${CARCH}" in
        'aarch64')
            cp -r "${srcdir}/${pkgname%-git}.git/node_modules/onnxruntime-node/bin/napi-v3/linux" \
                "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/x64
            ;;
        'x86_64')
            cp -r "${srcdir}/${pkgname%-git}.git/node_modules/onnxruntime-node/bin/napi-v3/linux" \
                "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/
            rm -rf "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/arm64
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}