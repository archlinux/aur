# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>
# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.21.1
pkgrel=1
pkgdesc="A simple and elegant open-source markdown editor that focused on speed and usability"
arch=('x86_64' 'aarch64')
url="https://marktext.me/"
license=('MIT')
_electron=electron42
depends=('bash' "$_electron" 'glib2' 'glibc' 'libgcc' 'libsecret' 'libstdc++' 'libx11' 'libxkbfile')
makedepends=('pnpm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz"
        "${pkgname}-arg-handling.patch"
        "${pkgname}.sh")
sha256sums=('36491b6e02a871ef5c4997939952c5d01116b608395ee97adbee3c760279c578'
            '3f7b433eb1e2e9c70bcd9b4c02bb6d92d77f39e5c0790677f43ae9615091e53d'
            '0f1ce8eb888caada8e7774cbc89d81f2b62eb143fe3d185d009d42584cbe501b')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/${pkgname}-arg-handling.patch"
    sed -i "s/process.resourcesPath/path.dirname(app.getAppPath())/g" \
        packages/desktop/src/main/globalSetting.ts \
        packages/desktop/src/main/ipc/bootInfo.ts
    sed -i "s/@ELECTRON@/${_electron}/" "${srcdir}/${pkgname}.sh"
}

build() {
    cd "${pkgname}-${pkgver}"
    pnpm install --frozen-lockfile --ignore-scripts
    pnpm run build:linux --dir \
        --config.electronDist="/usr/lib/${_electron}" \
        --config.electronVersion="$(cat /usr/lib/${_electron}/version)"
}

package() {
    cd "${pkgname}-${pkgver}"
    case "${CARCH}" in
        x86_64) unpacked=linux-unpacked ;;
        aarch64) unpacked=linux-arm64-unpacked ;;
    esac
    install -Dm644 "dist/${unpacked}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "dist/${unpacked}/resources"/{app.asar.unpacked,icons,static} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "packages/desktop/build/linux/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "packages/desktop/build/linux/${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 packages/desktop/build/icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
