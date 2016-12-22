# Maintainer: Benjamin Wilhelm <aur@hedgehogcode.de>
# Package creator: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="knime-sdk"
_upstream_name="eclipse_knime"
pkgver="3.3.1"
pkgrel="1"
pkgdesc="Software Development Kit for Knime"
url="http://www.knime.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-environment' 'python')
makedepends=('imagemagick')
optdepends=('bash: Required for bash-scriptable nodes'
            'r: Required for R-scriptable nodes')
options=('!emptydirs')
changelog="ChangeLog"
_CARCH="${CARCH}"
[ "${CARCH}" = 'i686' ] && _CARCH='x86'
source=("https://download.knime.org/analytics-platform/linux/${_upstream_name}_${pkgver}.linux.gtk.${_CARCH}.tar.gz"
        'knime.sh'
        'knime-sdk.desktop'
        'LICENSE')
md5sums=('09d3983ee2e039157beb0ed12717bf71'
         '7240fa995f2be4df2bccc463f5875f49'
         'e51afecee76a22937b5d5500056eeabd'
         '9e93e4def16f04f7808bddb48da3c009')
[ "${CARCH}" = 'x86_64' ] && md5sums[0]='18c31821e78cfbcfeb333614a794730b'

package() {
    installpath="/usr/share/java"
    programpath="${installpath}/${pkgname}"

    msg2 "Copy the program"
    install -d -m755 "${pkgdir}/${installpath}"
    cp -r "${srcdir}/${_upstream_name}_${pkgver}" "${pkgdir}/${programpath}"

    msg2 "Copy the launcher and the license"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m755 "${srcdir}/knime.sh" "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s|__KNIMEHOME__|${programpath}|" "${pkgdir}/usr/bin/${pkgname}"

    msg2 "Install the desktop specification"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -d -m755 "${pkgdir}/usr/share/pixmaps"
    convert "${srcdir}/${_upstream_name}_${pkgver}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    msg2 "Remove the provided libraries (jre)"
    rm -r "${pkgdir}/${programpath}/jre/"             # Provided by `java-environment`
}

# vim:set ts=4 sw=4 et:
