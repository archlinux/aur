# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Danny Dutton <duttondj@vt.edu>
pkgname=webtorrent-desktop-git
_pkgname="WebTorrent"
pkgver=0.24.0.r388.gfcee401
_electronversion=27
_nodeversion=16
pkgrel=1
pkgdesc="Streaming torrent client.Use system-wide electron."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://webtorrent.io/desktop"
_ghurl="https://github.com/webtorrent/webtorrent-desktop"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" package-lock.json
    fi
    sed -e "
        s/npm ci/NODE_ENV=development npm ci/g
        s/npm run/NODE_ENV=production npm run/g
    " -i bin/package.js
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run package -- linux --package=zip
    sed -e "
        s/Exec=\/opt\/${pkgname%-git}\/${_pkgname}/Exec=${pkgname%-git}/g
        s/Path=\/opt\/${pkgname%-git}/Path=\/usr\/lib\/${pkgname%-git}/g
    " -i static/linux/share/applications/"${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        aarch64)
            _osarchdir="${_pkgname}-linux-arm64"
            ;;
        armv7h)
            _osarchdir="${_pkgname}-linux-armv7l"
            ;;
        x86_64)
            _osarchdir="${_pkgname}-linux-x64"
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/${_osarchdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/dist/${_osarchdir}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 48x48 256x256;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/static/linux/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/static/linux/share/applications/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}