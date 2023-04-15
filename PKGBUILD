# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com> 
# Contributor: Benjamin Wilhelm <aur@hedgehogcode.de>
# Package creator: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname=knime-desktop
_upstream_name="knime"
pkgver=4.7.2
pkgrel=1
pkgdesc="A user-friendly graphical workbench for the entire data analysis process"
url="http://www.knime.org/"
license=('custom')
arch=('x86_64')
depends=('java-environment' 'python')
makedepends=('binutils' 'fakeroot' 'imagemagick')
optdepends=('bash: Required for bash-scriptable nodes'
            'r: Required for R-scriptable nodes'
            'webkit2gtk: Required for displaying HTML content')
options=('!emptydirs')
changelog=ChangeLog
_CARCH="x86_64"

source=("https://download.knime.org/analytics-platform/linux/${_upstream_name}_${pkgver}.linux.gtk.${_CARCH}.tar.gz"
        'knime.sh'
        'knime-desktop.desktop'
        'LICENSE')
sha256sums=('b710ca97b03ffdf5846880e9941db69aeb235ae4dd21608e0d6240f05f0b58a1'
            '834238a61eb6018de8957935bf98ab6f31d3767bd2ccf87402ec3ea3096ce955'
            '33f9d9c921e7e89c24f4b9d73b694300bdc995e9705b10ee668f8e6a7b760634'
            'ecd59cb1a79d96474e732361fcd40417fd3352b3974be66add43f8f00c7e016a')

package() {
    local installpath="/usr/share/java"
    local programpath="${installpath}/${pkgname}"
    local share="${pkgdir}/usr/share"
    local bin="${pkgdir}/usr/bin"

    msg2 "Copy the program"
    install -d -m755 "${pkgdir}/${installpath}"
    cp -r "${srcdir}/${_upstream_name}_${pkgver}" "${pkgdir}/${programpath}"

    msg2 "Copy the launcher and the license"
    install -D -m644 "${srcdir}/LICENSE" "${share}/licenses/${pkgname}/LICENSE"
    install -D -m755 "${srcdir}/knime.sh" "${bin}/${pkgname}"
    sed -i "s|__KNIMEHOME__|${programpath}|" "${bin}/${pkgname}"

    msg2 "Install the desktop specification"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${share}/applications/${pkgname}.desktop"
    install -d -m755 "${share}/pixmaps"
    convert "${srcdir}/${_upstream_name}_${pkgver}/icon.xpm" "${share}/pixmaps/${pkgname}.png"
}

# vim:set ts=4 sw=4 et:
