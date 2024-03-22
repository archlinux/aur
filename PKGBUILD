# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
pkgname=webtorrent-desktop-git
_pkgname="WebTorrent"
pkgver=0.24.0.r371.gebaf9cf8
_electronversion=15
_nodeversion=16
pkgrel=1
pkgdesc="Streaming torrent client."
arch=(
    'aarch64'
    'x86_64'
)
url="https://webtorrent.io/desktop"
_ghurl="https://github.com/webtorrent/webtorrent-desktop"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'git'
    'nvm'
    'npm'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    npm install
    npm run package -- linux --package=zip
    sed -e "s|Exec=\/opt\/${pkgname%-git}\/${_pkgname}|Exec=${pkgname%-git}|g" \
        -e "s|Path=\/opt\/${pkgname%-git}|Path=\/usr\/lib\/${pkgname%-git}|g" \
        -i static/linux/share/applications/"${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        aarch64)
            _osarchdir="${_pkgname}-linux-arm64"
            ;;
        x86_64)
            _osarchdir="${_pkgname}-linux-x64"
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/${_osarchdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/dist/${_osarchdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/${_osarchdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    for _icons in 48x48 256x256;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/static/linux/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/static/linux/share/applications/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}