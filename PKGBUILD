# Maintainer: Benjamin Wilhelm <aur@hedgehogcode.de>
# Package creator: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="knime-desktop-full"
_pkgname="knime-desktop"
_upstream_name="knime"
pkgver="3.3.1"
pkgrel="1"
pkgdesc="A user-friendly graphical workbench for the entire data analysis process (with all free extensions)"
url="http://www.knime.org/"
license=('custom')
arch=('i686' 'x86_64')
depends=('java-environment' 'python')
makedepends=('imagemagick')
optdepends=('bash: Required for bash-scriptable nodes'
            'r: Required for R-scriptable nodes')
options=('!emptydirs')
conflicts=('knime-desktop')
provides=('knime-desktop')
changelog="ChangeLog"
_CARCH="${CARCH}"
[ "${CARCH}" = 'i686' ] && _CARCH='x86'
source=("https://download.knime.org/analytics-platform/linux/${_upstream_name}-full_${pkgver}.linux.gtk.${_CARCH}.tar.gz"
        'knime.sh'
        'knime-desktop.desktop'
        'LICENSE')
md5sums=('6645006698c7d7dcefdbc7873e7d8860'
         '597314dbe6d4aae1d8381388d83d4b81'
         '8ec3f57e90588fac3f202e0509db2d08'
         '9e93e4def16f04f7808bddb48da3c009')
[ "${CARCH}" = 'x86_64' ] && md5sums[0]='a5fa1b0223508df291adf2776be462f8'

package() {
    installpath="/usr/share/java"
    programpath="${installpath}/${_pkgname}"

    msg2 "Copy the program"
    install -d -m755 "${pkgdir}/${installpath}"
    cp -r "${srcdir}/${_upstream_name}-full_${pkgver}" "${pkgdir}/${programpath}"

    msg2 "Copy the launcher and the license"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -D -m755 "${srcdir}/knime.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i "s|__KNIMEHOME__|${programpath}|" "${pkgdir}/usr/bin/${_pkgname}"

    msg2 "Install the desktop specification"
    install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -d -m755 "${pkgdir}/usr/share/pixmaps"
    convert "${srcdir}/${_upstream_name}-full_${pkgver}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    msg2 "Remove the provided libraries (jre)"
    rm -r "${pkgdir}/${programpath}/jre/"             # Provided by `java-environment`
}

# vim:set ts=4 sw=4 et:
