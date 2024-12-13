# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clipio-git
_pkgname=Clipio
pkgver=r19.c5565f2
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="Clipio scans and organizes your clips from Medal.tv, Shadowplay, OBS, and AMD Relive. Quickly sort, search, and view your favorite moments by date, source, or game.(Use system-wide electron)"
arch=('x86_64')
url="https://clipio.whoswhip.top/"
_ghurl="https://github.com/whoswhip/clipio"
license=('GPL-3.0-or-later')
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
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
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -e "
        s/ffmpeg.exe/ffmpeg/g
        s/ffprobe.exe/ffprobe/g
    " -i src/main.js
    sed -e "
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/\"node_modules\/ffmpeg-static\/ffmpeg.exe\"/\"node_modules\/ffmpeg-static\/ffmpeg\"/g
        s/\"ffmpeg.exe\"/\"ffmpeg\"/g
        s/\"node_modules\/ffprobe-static\/bin\/win32\/x64\/ffprobe.exe\"/\"node_modules\/ffprobe-static\/bin\/linux\/x64\/ffprobe\"/g
        s/\"ffprobe.exe\"/\"ffprobe\"/g
    " -i package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/"{ffmpeg,ffprobe} -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src/build/icon-x16.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}