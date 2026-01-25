# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Antony Ho <ntonyworkshop@gmail.com>

pkgname=session-desktop
pkgver=1.17.7
pkgrel=1
pkgdesc="A Decentralized, Onion Routed, Private Messenger"
arch=('x86_64')
url="https://getsession.org"
license=('GPL-3.0-only')
_electron=electron39
depends=('bash' "${_electron}" 'fmt' 'gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 'libvips' 'nodejs' 'python' 'spdlog')
makedepends=('chrpath' 'cmake' 'git' 'nvm' 'python' 'yarn')
source=("git+https://github.com/session-foundation/session-desktop.git#tag=v${pkgver}"
        "git+https://github.com/session-foundation/session-localization.git"
        "git+https://github.com/session-foundation/session-desktop-dynamic-assets.git"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('0eeaae169f12e8102c0bd529671f6fa2e300506e2416932bc77ecda59103e8a5'
            'SKIP'
            'SKIP'
            '267d772a94ba49b19e799e7ecee25c0077ded4dd9c853c073ec386a8ab6a7e5c'
            '82fdfb8518905269d5fa7131f9645deb9e01aa602c13d2089be6bb3d7bbf4e39')

_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    _ensure_local_nvm

    cd "${pkgname}"
    git submodule init
    git config submodule.ts/localization.url "${srcdir}/session-localization"
    git config submodule.dynamic_assets.url "${srcdir}/session-desktop-dynamic-assets"
    git -c protocol.file.allow=always submodule update

    sed -i "s/process.resourcesPath/path.dirname(app.getAppPath())/g" ts/mains/main_node.ts
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"

    nvm install
}

build() {
    _ensure_local_nvm

    cd "${pkgname}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SHARP_FORCE_GLOBAL_LIBVIPS=1
    yarn add node-addon-api node-gyp
    yarn install --frozen-lockfile
    export NODE_ENV=production
    yarn build
    yarn electron-builder --linux --dir \
        -c.extraMetadata.environment=production \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}"
    install -d "${pkgdir}/usr/lib"
    install -Dm644 release/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r release/linux-unpacked/resources/{app.asar.unpacked,dynamic_assets} "${pkgdir}/usr/lib/${pkgname}"
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/icon_${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    # Remove insecure RPATH
    chrpath --delete "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules"{,/sharp/node_modules}/@img/sharp-linux*/lib/sharp-linux*.node
}
