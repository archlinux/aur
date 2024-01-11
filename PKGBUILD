# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=spx-translation
pkgver=2.0.5_1
_electronversion=25
pkgrel=1
pkgdesc="聚合翻译程序(谷歌+deepl)"
arch=('x86_64')
url="https://github.com/mlmdflr/spx-translation"
license=('custom')
conflicts=("${pkgname}")
depends=(
    'libxkbcommon'
    'mesa'
    'libxcomposite'
    'libcups'
    'expat'
    'gtk3'
    'libxdamage'
    'alsa-lib'
    'libxfixes'
    'libdrm'
    'cairo'
    'nss'
    'nspr'
    'libx11'
    'libxext'
    'libxcb'
    'at-spi2-core'
    'pango'
)
makedepends=(
    'gendesk'
    'yarn'
    'npm'
    'nodejs'
    'git'
    'python'
    'node-gyp'
    'make'
    'gcc'
)
source=(
    "${pkgname}.git::git+${url}#tag=vv${pkgver//_/-}"
)
sha256sums=('SKIP')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|, 'snap', 'deb', 'rpm', 'pacman'||g" -i scripts/cfg.js
    sed "s|, 'snap', 'deb', 'rpm', 'pacman'||g" -i scripts/build.js
    sed "14,22d" -i scripts/build.js
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/out/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/resources/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/out/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}