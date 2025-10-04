# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Antony Ho <ntonyworkshop@gmail.com>

pkgname=session-desktop
pkgver=1.17.1
pkgrel=1
pkgdesc="A Decentralized, Onion Routed, Private Messenger"
arch=('x86_64')
url="https://getsession.org"
license=('GPL-3.0-only')
_electron=electron34
depends=('bash' "${_electron}" 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'python')
makedepends=('cmake' 'git' 'nvm' 'python-setuptools' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/session-foundation/session-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=('552d9ace54b292fd0b139f2196013c52c57fd0ed3118a72c761b0a89667f7716'
            '267d772a94ba49b19e799e7ecee25c0077ded4dd9c853c073ec386a8ab6a7e5c'
            'a5279447d005060aa77536dcabe0ab66226f9cffa668dc0b6e07a2f1e52ab5ce')

prepare() {
    source /usr/share/nvm/init-nvm.sh

    cd "${pkgname}-${pkgver}"
    sed "s/process.resourcesPath/path.dirname(app.getAppPath())/g" -i ts/mains/main_node.ts
    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"

    mkdir -p .git

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    nvm install
    yarn install --frozen-lockfile
}

build() {
    cd "${pkgname}-${pkgver}"
    export NODE_ENV=production
    yarn build
    yarn electron-builder --linux --dir \
        -c.extraMetadata.environment=production \
        -c.electronDist="/usr/lib/${_electron}" \
        -c.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/lib"
    cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}"
    for i in 16 32 48 64 128 256 512 1024; do
        install -Dm644 "build/icons/icon_${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
