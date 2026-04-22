# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Antony Ho <ntonyworkshop@gmail.com>

pkgname=session-desktop
pkgver=1.18.0
pkgrel=1
pkgdesc="A Decentralized, Onion Routed, Private Messenger"
arch=('x86_64')
url="https://getsession.org"
license=('GPL-3.0-only')
_electron=electron39
depends=('bash' "${_electron}" 'glib2' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'libvips' 'python')
makedepends=('cmake' 'git' 'nvm' 'pnpm')
source=("git+https://github.com/session-foundation/session-desktop.git#tag=v${pkgver}"
        "git+https://github.com/session-foundation/session-localization.git"
        "git+https://github.com/session-foundation/session-desktop-dynamic-assets.git"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('9cc39a6164ae3886ca93fad4eebe14869619327ec06c28b439619c6023e1720a'
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
    export NODE_ENV=production
    export SHARP_FORCE_GLOBAL_LIBVIPS=1
    pnpm install --frozen-lockfile
    pnpm run build
    pnpm electron-builder --linux --dir \
        --config.extraMetadata.environment=production \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
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
}
