# Maintainer: ValHue <vhuelamo at gmail dot com>
#
_pkgname="GIMP_AppImage-release"
pkgname="gimp-appimage"
pkgver="2.10.22"
pkgrel="1"
pkgdesc="GNU Image Manipulation Program (AppImage version)"
arch=('x86_64')
_filename="${_pkgname}-${pkgver}-withplugins-${arch}.AppImage"
url='https://github.com/aferrero2707/gimp-appimage'
license=('custom')
depends=('hicolor-icon-theme' 'zlib')
provides=('gimp')
conflicts=('gimp')
options=('!strip' '!emptydirs')
install='GIMP_AppImage.install'
source=("${_filename}::${url}/releases/download/continuous/${_filename}"
        ${_pkgname}.sh)
sha256sums=('0289456e7bd566d14fb0c6f8f22bca58bcf62d6b698fb41571d5e2d347b62e42'
            '04e6d5c88f0eed70bcb1189a89015878943e6f039db30bb6f50fcad363d67487')

prepare() {
    cd "${srcdir}"

    # mark as executable so we can extract
    chmod u+x ${_filename}

    # extract the AppImage  
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/gimp-2.10"
    ln -s "${pkgdir}/usr/bin/gimp-2.10" "${pkgdir}/usr/bin/gimp"

    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/applications" "${pkgdir}/usr/share/"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
