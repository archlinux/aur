# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=tabby
pkgver=1.0.237
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://tabby.sh"
license=('MIT')
_electron=electron43
depends=('bash' "${_electron}" 'fontconfig' 'glib2' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libsecret' 'libstdc++' 'nodejs')
makedepends=('gendesk' 'git' 'npm' 'python' 'yarn')
conflicts=('terminus-terminal')
replaces=('terminus-terminal')
source=("git+https://github.com/Eugeny/tabby.git#tag=v${pkgver}"
        "${pkgname}.sh"
        'build.patch')
sha256sums=('88e7a0977127d5796b6954fe5c11977a1bda37ce6d470478ae4c036bd585a088'
            'e10c3846ec9ffd5d711397cece65d53fb2b81af1d08706442f04328c7bcbbb5a'
            'f5581859b734a2f9199a331540fc9beac0a102705a519f6070858ddd7db8b401')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/build.patch"

    sed -e "s|@ELECTRON_DIST@|/usr/lib/${_electron}|" \
        -e "s|@ELECTRON_VERSION@|$(cat /usr/lib/${_electron}/version)|" \
        -i scripts/build-linux.mjs
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --exec "${pkgname} %U" \
        --categories 'Utility;TerminalEmulator;System' \
        --custom "StartupWMClass=${pkgname}"
}

build() {
    cd "${pkgname}"
    yarn install --frozen-lockfile
    yarn run build
    ./scripts/prepackage-plugins.mjs
    ./scripts/build-linux.mjs
}

package() {
    cd "${pkgname}"
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/{app.asar.unpacked,builtin-plugins,extras} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    for i in 16 32 64 128 256 512; do
        install -Dm644 "build/icons/${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    local find_files=(
        -iname '*darwin-arm64*' -o
        -iname '*darwin-x64*' -o
        -iname '*linux-arm*' -o
        -iname '*linux-arm64*' -o
        -iname '*win32-arm64*' -o
        -iname '*win32-x64*'
    )
    find "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules" -type f \( "${find_files[@]}" \) -delete

    local find_dirs=(
        -iwholename '*/android-arm' -o
        -iwholename '*/android-arm64' -o
        -iwholename '*/darwin-arm64' -o
        -iwholename '*/darwin-x64' -o
        -iwholename '*/darwin-x64+arm64' -o
        -iwholename '*/linux-arm' -o
        -iwholename '*/linux-arm64' -o
        -iwholename '*/win32-arm64' -o
        -iwholename '*/win32-ia32' -o
        -iwholename '*/win32-x64'
    )
    find "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/node_modules" -type d \( "${find_dirs[@]}" \) -exec rm -rf {} +
}
