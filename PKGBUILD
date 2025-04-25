# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-git
_pkgname=R3PLAYX
pkgver=2.7.4.r31.gdc20e3b
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic.(Use system-wide electron)高颜值的第三方网易云播放器."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Sherlockouo/music"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname%-git}"
    "yesplaymusic"
    "r3play"
    "my-yesplaymusic"
)
provides=("yesplaymusic")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'pnpm'
    'curl'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
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
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    cp .env.example .env
    sed -i "s/'deb'/'dir'/g;s/'AppImage'/'dir'/g" packages/desktop/.electron-builder.config.js
    sed -i "s/\.\.\/resources\/bin\/better_sqlite3.node/\/usr\/lib\/${pkgname%-git}\/bin\/better_sqlite3.node/g" \
        packages/desktop/main/db.ts
    local electronDist="/usr/lib/electron${_electronversion}"
    jq '.scripts.package += " --linux dir -c.electronDist='"$electronDist"'"' package.json > temp.json
    cp temp.json packages/desktop/package.json
    NODE_ENV=development    pnpm install
    NODE_ENV=development    pnpm add -w -D @types/better-sqlite3
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        aarch64)
            local _osarch=linux-arm64-unpacked
            ;;
        x86_64)
            local _osarch=linux-unpacked
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/desktop/release/${_osarch}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/packages/desktop/release/${_osarch}/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-git}"
    _icon_sizes=(16x16 24x24 32x32 64x64 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/packages/desktop/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}