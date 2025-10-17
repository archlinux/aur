# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=tabby
pkgver=1.0.228
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://tabby.sh"
license=('MIT')
conflicts=('terminus-terminal')
replaces=('terminus-terminal')
_electron=electron38
depends=('bash' "${_electron}" 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 'libsecret' 'nodejs')
makedepends=('gendesk' 'git' 'npm' 'python' 'yarn')
source=("git+https://github.com/Eugeny/tabby.git#tag=v${pkgver}"
        "${pkgname}.sh"
        'build.patch')
sha256sums=('f58f1c9ceb98dd90e0b74b4cf7bee089169c2b004654eee86d372b7123413c36'
            'e10c3846ec9ffd5d711397cece65d53fb2b81af1d08706442f04328c7bcbbb5a'
            'f5581859b734a2f9199a331540fc9beac0a102705a519f6070858ddd7db8b401')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/build.patch"

    sed -e "s|@ELECTRON_DIST@|/usr/lib/${_electron}|" \
        -e "s|@ELECTRON_VERSION@|$(cat /usr/lib/${_electron}/version)|" \
        -i scripts/build-linux.mjs
    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --exec "${pkgname} %U" \
        --categories 'Utility;TerminalEmulator;System' \
        --custom "StartupWMClass=${pkgname}"

    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    yarn install --frozen-lockfile
}

build() {
    cd "${pkgname}"
    yarn run build
    ./scripts/prepackage-plugins.mjs
    ./scripts/build-linux.mjs
}

package() {
    cd "${pkgname}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/{app.asar.unpacked,builtin-plugins,extras} "${pkgdir}/usr/lib/${pkgname}"
    for i in 16 32 64 128 256 512; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
