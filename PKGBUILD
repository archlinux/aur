# Maintainer: Vryali <vryali ~at~ gmail ~dot~ com>

# Required icon attribution: Twitch Icon created by Vitaly Corbachev - Flaticon
# https://www.flaticon.com/free-icons/twitch

pkgname='stream-overlay'
pkgdesc="Borderless, transparent, click-through browser windows for streaming"
pkgver='2.0.0'
pkgrel='2'
url="https://github.com/hperrin/stream-overlay/"
__baseurl="https://github.com/hperrin/stream-overlay/archive/refs/tags"
license=('Apache')
arch=('any')

# I'd need to install this fresh to remember if there were other deps I had to add, let me know if I missed any
makedepends=('npm')
depends=('hicolor-icon-theme' 'bash' 'nodejs')

source=("${__baseurl}/v${pkgver}.tar.gz"
    "stream-overlay.png"
    "stream-overlay.desktop"
    "stream-overlay.sh")
sha256sums=('980249bacb4bb6871d0418ce63f5e3a5078c589b625a7521aa4a3921ae05e42f'
            'f2f99d2aed697ee813c0e351f949979148ac22d73271f667f0a7f5690124635e'
            'b936d6454c941232565e282f566845b8de2ee133bdcfeaff127a8f7e43f5b28e'
            '85dfd699c65ba774343def1522c1d929b63ca90af8dd1c3c17e6a6f0fb6f4191')
build() {
    # Go ahead and remove those so they don't clutter up the app folder
    #for i in 'desktop png sh'; do rm ${pkgname}.${i}; done
    # Everything else is part of the app
    #mv "${srcdir}" "${pkgdir}/usr/share/${pkgname}/"
    # Now, build everything out as per the README.md
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install
    cd 'app/app'
    npm install
    cd '../../'
    npm run clean
    npm run build
    npm run package:linux
}

package() {
    # Prepare system folders
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps" \
                    "${pkgdir}/usr/share/applications"              \
                    "${pkgdir}/usr/share/${pkgname}"          \
                    "${pkgdir}/usr/bin"

    # Setup the directory structure to comply with standards
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Clean up some of the build files
    rm -rf "${srcdir}/${pkgname}-${pkgver}/flatpak"*

    # Can do some clean-up here from the things used in build
    rm -rf "${srcdir}/${pkgname}-${pkgver}/dist"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/node_modules"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/node_modules/@electron"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/node_modules/@sindresorhus"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/node_modules/@types"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/node_modules/@szmarczak"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/esbuild"*
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/@electron"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/@sindresorhus"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/@types"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/@szmarczak"
    rm -rf "${srcdir}/${pkgname}-${pkgver}/app/app/.svelte-kit/output/server/stylesheets"
    unlink "${srcdir}/${pkgname}-${pkgver}/app/app/node_modules/.bin/esbuild"

    # Copy in all the things
    cp -r "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}/usr/share/${pkgname}/"
}
