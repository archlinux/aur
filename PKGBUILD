# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=creamplayer
_pkgname=Creamplayer
pkgver=5.2.2
_electronversion=33
_nodeversion=22
pkgrel=3
pkgdesc="🎵 QQ Netease Music Downloader.(Use system-wide electron)网易云播放/下载器,QQ音乐批量下载工具."
arch=('any')
url="https://github.com/Beadd/Creamplayer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-requests'
    'python-mutagen'
    'python-eyed3'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'curl'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.png"
    "${pkgname}.sh"
)
sha256sums=('3c2449a6baf93b8f83ee685563f35be7d54eb87bf5965a101697afd6efc015d9'
            '30920ab7e7fb31d7e69dc2d73813ba664e26004258ffe3f2317d4a2b5037985b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
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
    # 在Linux下，使用musicdownloader.py来下载文件
    sed -i "s/\.\/resources\/musicdownloader\.exe/python\ \/usr\/lib\/${pkgname}\/musicdownloader\.py/g" main.cjs
    # 删除多余的exe文件
    rm -rf resources/musicdownloader.exe
    # 定义下载目录为 ~/Music
    sed -i "s/\"downloads\"/os.path.join(os.path.expanduser(\"\~\"), \"Music\")/g" resources/musicdownloader.py
    # 添加使用豆包生成的图标
    install -Dm644 "${srcdir}/${pkgname}.png" "${srcdir}/${pkgname}-${pkgver}/public/icon.png"
    sed -i '3i\    <img src="/icon.png" alt="App Icon" class="w-12 h-12 mb-4" />' src/App.vue
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \'${electronDist}\',\\
        },\\
    }," forge.config.*
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/${pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/resources/musicdownloader.py" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
}