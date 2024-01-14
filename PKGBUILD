# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: SimPilotAdamT <adam_tazul@outlook.com>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname='teamviewer-quicksupport'
epoch=2
pkgver=15.49.2
pkgrel=1
pkgdesc='All-in-one software for remote support and online meetings'
arch=('x86_64')
url='http://www.teamviewer.com/'
options=('!strip')
depends=(
    'bash'
    'glibc'
    'hicolor-icon-theme'
    'qt5-base'
    'qt5-declarative'
    'qt5-x11extras'
)
conflicts=('teamviewer')
license=('custom')
source=("teamviewer_qs-${pkgver}.tar.gz::https://download.teamviewer.com/download/teamviewer_qs.tar.gz")
b2sums=('5581894aa3a86e1367fb1f00a921d61fd9aa4b475179872ca9507727eed78a9dd125bfce4645ffe99e09a5a8e1866606b4fae7172f31a20efa8f61e70cfd23ba')

prepare() {
    cd teamviewerqs

    if ! grep -q "^TV_VERSION='${pkgver}'\$" tv_bin/script/tvw_config; then
        echo "Source version does not match pkgver!"
        return 1
    fi

    # Delete unneeded empty dirs
    rmdir config
    rmdir logfiles

    cd tv_bin

    # Extract embedded archive
    tar -xf archive.tar.xz

    # set correct pathes in desktop file
    sed -e "/^Exec=/c Exec=/opt/teamviewer/tv_bin/script/teamviewer" \
        -e "/^Icon=/c Icon=teamviewer.png" \
        < desktop/teamviewer.desktop.template \
        > "${srcdir}"/teamviewer.desktop

    # Don't try to extract tar archive during application runtime
    sed -e '/ExtractBinaries/s/^/#/' -i script/tvw_main

    # Don't clear LD_PRELOAD before running application
    sed -e '/  CheckEnvironment/s/^/#/' -i script/tvw_main

    # Yes, this is QuickSupport... But we want to use user's home directory.
    sed -e '/function isInstalledTV/,/^}$/c function isInstalledTV() { return 0; }' -i script/tvw_aux

    # Fix check for Qt5 XCB in libcheck script
    sed -e '/local -r qtxcb/c local -r qtxcb="/usr/lib/qt/plugins/platforms/libqxcb.so"' -i script/tvw_libcheck

    # Fix check for Qt5 QuckControls in setup script
    sed -e '/CheckQtQuickControls()/{N' \
        -e 'a ls /usr/lib/qt/qml/QtQuick/Controls/qmldir &>/dev/null && return # ArchLinux' \
        -e '}' \
        -i script/teamviewer_setup

    # Delete unneeded files
    rm -rf RTlib/
    rm -f desktop/teamviewer.desktop.template
    rm -f xdg-utils/xdg-email
    rm -f archive.tar.xz
}

package() {
    cd teamviewerqs

    install -dm 0755 "${pkgdir}/opt/teamviewer"
    cp -a --no-preserve=ownership * "${pkgdir}/opt/teamviewer/"

    install -d -m0755 "${pkgdir}"/usr/{bin,share/applications,share/icons/hicolor,share/licenses/${pkgname}}
    ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}/usr/bin/teamviewer"
    ln -s /opt/teamviewer/tv_bin/script/teamviewer "${pkgdir}/usr/bin/quicksupport"
    ln -s /opt/teamviewer/doc/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s /opt/teamviewer/doc/{EULA_en.txt,DPA_en.txt} "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm 0755 "${srcdir}/teamviewer.desktop" "${pkgdir}/usr/share/applications/teamviewer.desktop"

    for iconsize in 16 20 24 32 48 256; do
        install -Dm 644 "tv_bin/desktop/teamviewer_${iconsize}.png" "${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/teamviewer.png"
    done

    install -dm 1777 "${pkgdir}/var/lib/teamviewer"
    ln -s /var/lib/teamviewer "${pkgdir}/opt/teamviewer/config"
    install -dm 1777 "${pkgdir}/var/log/teamviewer"
    ln -s /var/log/teamviewer "${pkgdir}/opt/teamviewer/logfiles"
}

