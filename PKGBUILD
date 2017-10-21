# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=beathazardultra
pkgver=20130308
_srcpkgver=03-08-13
pkgrel=2
pkgdesc='Intense music-driven arcade shooter powered by your music (game sold separately)'
arch=('i686' 'x86_64')
url='http://www.coldbeamgames.com/'
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libjpeg' 'lib32-libpng12')
else
    depends=('libjpeg' 'libpng12')
fi
options=('!strip')
_gamepkg="beathazard-installer_${_srcpkgver}"
source=("${pkgname}.desktop"
        "hib://${_gamepkg}"
        "${pkgname}.sh")
md5sums=('c734328d12709b1d6fc7a39a2e5a5325'
         '79abdec2257bec523800f070287df91e'
         'f00693e0dcf73ced11aa793ffa27924a')
noextract=("${_gamepkg}")
# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; echo "Read this PKGBUILD for more info."; exit 1')
PKGEXT='.pkg.tar'

prepare() {
    cd "${srcdir}"

    mkdir "${pkgname}-${pkgver}"
    bsdtar -x -C "${pkgname}-${pkgver}" -f "${_gamepkg}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/opt"
    cp -Rl data/all "${pkgdir}/opt/${pkgname}"
    install -m644 "data/SmileLogo.png" "${pkgdir}/opt/${pkgname}/"

    # Use symlinks instead of copies
    pushd "${pkgdir}/opt/${pkgname}/hge_lib"
    ln -sf "liballegro_dialog.so.5.0.9" "liballegro_dialog.so"
    ln -sf "liballegro_dialog.so.5.0.9" "liballegro_dialog.so.5.0"
    ln -sf "liballegro_image.so.5.0.9" "liballegro_image.so"
    ln -sf "liballegro_image.so.5.0.9" "liballegro_image.so.5.0"
    ln -sf "liballegro_memfile.so.5.0.9" "liballegro_memfile.so"
    ln -sf "liballegro_memfile.so.5.0.9" "liballegro_memfile.so.5.0"
    ln -sf "liballegro.so.5.0.9" "liballegro.so"
    ln -sf "liballegro.so.5.0.9" "liballegro.so.5.0"
    popd

    # Use system-provided libraries
    rm "${pkgdir}/opt/${pkgname}/hge_lib/libjpeg.so"
    rm "${pkgdir}/opt/${pkgname}/hge_lib/libjpeg.so.8"
    rm "${pkgdir}/opt/${pkgname}/hge_lib/libjpeg.so.8.0.2"
    rm "${pkgdir}/opt/${pkgname}/hge_lib/libpng12.so.0"
    rm "${pkgdir}/opt/${pkgname}/hge_lib/libpng12.so.0.46.0"

    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
