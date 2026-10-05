# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Saillard (GitSquared) <gabriel@saillard.dev>
# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.20.0
pkgrel=1
pkgdesc="A simple and elegant open-source markdown editor that focused on speed and usability"
arch=('x86_64')
url="https://marktext.me/"
license=('MIT')
_electron=electron42
depends=('bash' "$_electron" 'glib2' 'glibc' 'libgcc' 'libsecret' 'libstdc++' 'libx11' 'libxkbfile')
makedepends=('pnpm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marktext/marktext/archive/v${pkgver}.tar.gz"
        "${pkgname}-arg-handling.patch"
        "${pkgname}.sh")
sha256sums=('9a052868129560e46de583c37f793d250241fab05c120ea0b84e6b195a4d5400'
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
    install -Dm644 dist/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r dist/linux-unpacked/resources/{app.asar.unpacked,icons,static} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "packages/desktop/build/linux/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "packages/desktop/build/linux/${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 packages/desktop/build/icons/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
