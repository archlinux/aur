# Maintainer: lukaszimmermann <luk.zim91 at gmail dot com> 
# Contributor: Benjamin Wilhelm <aur@hedgehogcode.de>
# Package creator: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="knime-sdk"
_upstream_name="eclipse_knime"
pkgver="3.5.2"
pkgrel="1"
pkgdesc="Software Development Kit for Knime"
url="http://www.knime.org/"
license=('custom')
arch=('x86_64')
depends=('java-environment' 'python' 'libxml2')
makedepends=('binutils' 'fakeroot' 'imagemagick')
optdepends=('bash: Required for bash-scriptable nodes'
            'r: Required for R-scriptable nodes')
options=('!emptydirs')
changelog="ChangeLog"
_CARCH="${CARCH}"
source=("https://download.knime.org/analytics-platform/linux/${_upstream_name}_${pkgver}.linux.gtk.${_CARCH}.tar.gz"
        'knime-sdk.sh'
        'knime-sdk.desktop'
        'LICENSE')
sha256sums=('a2a8c9fe3c815872c016453e755e84f7d4077bba3b71c6b727389b03b991c71b'
            'fb0e03e46b1aff889fc4957258a75496399c803d2a67392c25236c616886d761'
            '14521c9c333c06d39d69dc1cd35a41fc58854e5e8366502d7defad54ef02edd4'
            'ecd59cb1a79d96474e732361fcd40417fd3352b3974be66add43f8f00c7e016a')

package() {
    installpath="/usr/share/java"
    programpath="${installpath}/${pkgname}"

    msg2 "Copy the program"
    install -d -m755 "${pkgdir}/${installpath}"
    cp -r "${srcdir}/${_upstream_name}_${pkgver}" "${pkgdir}/${programpath}"

    msg2 "Copy the launcher and the license"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m755 "${srcdir}/knime-sdk.sh" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s|__KNIMEHOME__|${programpath}|" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Install the desktop specification"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -d -m755 "${pkgdir}/usr/share/pixmaps"
    convert "${srcdir}/${_upstream_name}_${pkgver}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    msg2 "Remove the provided libraries (jre)"
    rm -rf "${pkgdir}/${programpath}/jre/"             # Provided by `java-environment`
}

# vim:set ts=4 sw=4 et:
