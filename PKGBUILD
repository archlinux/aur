# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="knime-sdk"
_upstream_name="eclipse_knime"
pkgver="2.11.3"
pkgrel="1"
pkgdesc="Software Development Kit for Knime"
url="http://www.knime.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-environment' 'cairo' 'python2')
makedepends=('imagemagick')
optdepends=('bash: Required for bash-scriptable nodes'
            'r: Required for R-scriptable nodes')
options=('!emptydirs')
changelog="ChangeLog"
_CARCH="${CARCH}"
[ "${CARCH}" = 'i686' ] && _CARCH='x86'
source=("http://www.knime.org/knime_downloads/linux/${_upstream_name}_${pkgver}.linux.gtk.${_CARCH}.tar.gz"
        'knime.sh'
        'knime-sdk.desktop'
        'LICENSE')
md5sums=('adce712518c2e1cf889fe23bf08b1fbb'
         'db5bad392dda08e0694bc3b4b72734db'
         'e51afecee76a22937b5d5500056eeabd'
         '9e93e4def16f04f7808bddb48da3c009')
[ "${CARCH}" = 'x86_64' ] && md5sums[0]='72511f7ff1eec09334c46a2361e693a7'

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

    msg2 "Remove the provided libraries (cairo, jre)"
    rm    "${pkgdir}/${programpath}/libcairo-swt.so"  # Provided by `cairo`
    rm -r "${pkgdir}/${programpath}/jre/"             # Provided by `java-environment`

    msg2 "Link 'libcairo' to the system"
    ln -s "/usr/lib/libcairo.so" "${pkgdir}/${programpath}/libcairo-swt.so"

    msg2 "Change necessary files to python2 shellbang"
    sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" "${pkgdir}/${programpath}/plugins/org.apache.ant_1.8.2.v20120109-1030/bin/runant.py"
}

# vim:set ts=4 sw=4 et:
