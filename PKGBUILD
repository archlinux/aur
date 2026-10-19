# Maintainer:
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: lsf
# Contributor: Daniel Haß <aur@hass.onl>

pkgname=standardnotes
pkgver=3.202.10
pkgrel=1
pkgdesc="Think fearlessly with end-to-end encrypted notes and files"
arch=('x86_64')
url="https://standardnotes.com"
license=('AGPL-3.0-or-later')
_electron=electron43
depends=('bash' "${_electron}" 'glib2' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libsecret' 'libstdc++' 'nodejs' 'python')
makedepends=('nvm' 'python-setuptools' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/standardnotes/app/archive/@standardnotes/desktop@${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('d46d491e0b5729cdaa04dd3fa00a457a64f877047019801fdae6f5a3b83c75c6'
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

    local find_dirs=(
        -iwholename '*/darwin-x64+arm64' -o
        -iwholename '*/linux-arm' -o
        -iwholename '*/linux-arm64' -o
        -iwholename '*/win32-ia32' -o
        -iwholename '*/win32-x64'
    )
    find "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules" -type d \( "${find_dirs[@]}" \) -exec rm -rf {} +
}
