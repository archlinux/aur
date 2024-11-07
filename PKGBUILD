# Maintainer:
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=tabby
pkgver=1.0.215
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://tabby.sh"
license=('MIT')
conflicts=('terminus-terminal')
replaces=('terminus-terminal')
_electron=electron29
depends=('bash' "${_electron}" 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'nodejs' 'python')
makedepends=('gendesk' 'git' 'python-setuptools' 'yarn')
source=("git+https://github.com/Eugeny/tabby.git#tag=v${pkgver}"
        "${pkgname}.sh"
        'build.patch')
sha256sums=('e3e1c4c3f90490972d4b031444b0780c9a05a620275d8add95bf771f80710385'
            'e10c3846ec9ffd5d711397cece65d53fb2b81af1d08706442f04328c7bcbbb5a'
            '3718fc3b957179d1efd18e1aff4dc2de3123093ffa5fd8e357c132f082e3cf40')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/build.patch"

    sed "s/@ELECTRON@/${_electron}/" -i "${srcdir}/${pkgname}.sh"
    sed -e "s|@ELECTRON_DIST@|/usr/lib/${_electron}|" \
        -e "s|@ELECTRON_VERSION@|$(cat /usr/lib/${_electron}/version)|" \
        -i scripts/build-linux.mjs

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --exec "${pkgname} %U" \
        --categories 'Utility;TerminalEmulator;System' \
        --custom StartupWMClass="${pkgname}"

    yarn install
}

build(){
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
