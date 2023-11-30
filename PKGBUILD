# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=peersky-browser
_appname="Peersky Browser"
pkgver=1.0.0_prerelease
_electronversion=20
pkgrel=4
pkgdesc="A minimal p2p web browser."
arch=("any")
url="https://peersky.p2plabs.xyz/"
_ghurl="https://github.com/p2plabsxyz/peersky-browser"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'lib32-glibc'
    'gconf'
    'libxss'
    'alsa-lib'
    'gtk2'
    'lib32-gcc-libs'
)
makedepends=(
    'npm'
    'gendesk'
    'nodejs'
    'git'
    'asar'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '7eb20123886333292b926aeee32dcc5cb861f4107f3adef9decc103bf52ad8e8')
build() {
    gendesk -f -n -q --categories "Network" --name "${_appname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname%}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="$srcdir/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed -i "s|@electronversion@|${ELECTRONVERSION}|" "$srcdir/${pkgname}.sh"
    sed -e 's|"AppImage",|"AppImage"|g' -e '/deb/d' -i package.json
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> src/main.js
    npm install --force
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/build/linux-unpacked/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}