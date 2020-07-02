# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>
#
# You can define $HALCOGEN_WINEPREFIX environment variable to hardcode the $WINEPREFIX
# of wine running HALCoGen, the  is default '~/.wine-halcogen'.

pkgname=halcogen
pkgver=04.07.01
pkgrel=1
pkgdesc='Hardware Abstraction Layer Code Generator for Hercules MCUs'
arch=('i686' 'x86_64')
url='https://www.ti.com/tool/HALCOGEN/'
license=('custom')
depends=('wine')

source=('https://www.ti.com/lit/sw/spnc030g/spnc030g.zip'
        'halcogen.sh')
md5sums=('e521ca88416a99717637280417f93350'
         '44a08dbac4143ed758146bfb59bc00df')

package() {
    mkdir -p "${pkgdir}/opt/halcogen/"

    WINEARCH=win32 WINEPREFIX="${srcdir}/prefix" wine "${srcdir}/HALCoGen-${pkgver}-installer.exe" \
        --mode unattended \
        --prefix "${pkgdir}/opt/halcogen" \
        --install_desktop_shortcuts 0
    WINEARCH=win32 WINEPREFIX="${srcdir}/prefix" wineserver -k

    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "${srcdir}/halcogen.sh" "${pkgdir}/usr/bin/halcogen"

    if [[ -z "$HALCOGEN_WINEPREFIX" ]]; then
        sed -i "s#\${REPLACE_WINEPREFIX}#\${PWD}/wine-halcogen#g" "${pkgdir}/usr/bin/halcogen"
    else 
        sed -i "s#\${REPLACE_WINEPREFIX}#${HALCOGEN_WINEPREFIX}#g" "${pkgdir}/usr/bin/halcogen"
    fi

    sed -i "s#${pkgdir}##g" "${pkgdir}/opt/halcogen/HCG_updater.ini"
}
