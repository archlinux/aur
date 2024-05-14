# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_pkgname="Peersky Browser"
pkgver=1.0.0_prerelease
_electronversion=20
pkgrel=8
pkgdesc="A minimal p2p web browser."
arch=("any")
url="https://peersky.p2plabs.xyz/"
_ghurl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}-bin"
    'java-runtime'
    'nodejs'
    'python>=3'
)
makedepends=(
    'npm'
    'gendesk'
    'base-devel'
    'gcc'
    'curl'
)
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('19365d7daf195ca82ced4c542ff62d26a337bc9df6152be4abc4e0cd35763954'
            '41b6d61dffef064762b3eec3dfeca7a3e1f57cbcb6dce9a6940c06797a0eae9d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@|ELECTRON_DISABLE_SECURITY_WARNINGS=true|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --pkgname="${pkgname}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "/openDevTools/d" -i src/main.js
    npm install --force
    npx electron-builder build -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver//_/-}/build/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}