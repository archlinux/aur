# Maintainer:
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>

pkgname=standardnotes
pkgver=3.202.7
pkgrel=1
pkgdesc="Think fearlessly with end-to-end encrypted notes and files"
arch=('x86_64')
url="https://standardnotes.com"
license=('AGPL-3.0-or-later')
_electron=electron43
depends=('bash' "${_electron}" 'glibc' 'hicolor-icon-theme' 'libstdc++' 'nodejs' 'python')
makedepends=('nvm' 'python-setuptools' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/standardnotes/app/archive/@standardnotes/desktop@${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('34c74b4982717ae3dbdd7c3925714895153591a940db03dc48e117a64022f0c8'
            'b990343f6d187f3997129a7e2d5892fb2cb7a942a8040f9be2b8887ad5150215'
            '6dc53fdd5d597acd1bcc1bfe7ecc6458291fb53c5b1a4d2ece12e0dbfa8b41a2')

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm

    ln -sf "app--${pkgname}-desktop-${pkgver}" "${pkgname}-${pkgver}"
    sed -i "s|@ELECTRON@|${_electron}|" "${pkgname}.sh"

    cd "${pkgname}-${pkgver}"
    nvm install
    yarn up --recursive node-abi

    cd packages/desktop
    yarn up electron-builder@24
}

build() {
    _ensure_local_nvm

    cd "${pkgname}-${pkgver}/packages/desktop"
    yarn install --immutable
    yarn run rebuild:home-server
    yarn run build:desktop
    yarn run webpack --config desktop.webpack.prod.js
    yarn run electron-builder --linux \
        --config.linux.target=dir \
        --config.extraMetadata.version="${pkgver}" \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}/packages/desktop"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    for size in 16x16 32x32 128x128 256x256 512x512; do
        install -Dm644 "build/icon.iconset/icon_${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
