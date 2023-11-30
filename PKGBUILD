# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orca-writer
_pkgname=Orca
pkgver=0.7.0_pre_alpha
_electronversion=18
pkgrel=4
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('any')
url="https://orcawriter.app/"
_ghurl="https://github.com/zachhannum/orca"
license=('AGPL3')
conflicts=("${pkgname}")
depends=(
    'libxfixes'
    'libdrm'
    'pango'
    'libxcomposite'
    'libxdamage'
    'libxkbcommon'
    'at-spi2-core'
    'nspr'
    'gdk-pixbuf2'
    'libxrandr'
    'cairo'
    'nss'
    'libcups'
    'libxcb'
    'expat'
    'hicolor-icon-theme'
    'gtk3'
    'mesa'
    'libxext'
    'alsa-lib'
    'libx11'
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'node-gyp'
    'make'
    'gcc'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver//_/-}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    export npm_config_build_from_source=true
    export npm_config_cache="$srcdir/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn
    yarn package
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt/"${pkgname}"}
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-writer}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}