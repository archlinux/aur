# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Based on teamviewer package from AUR: https://aur.archlinux.org/packages/teamviewer

pkgname=teamviewer-sandboxed
pkgver=15.71.4
pkgrel=2
pkgdesc='TeamViewer with systemd and bubblewrap security sandboxing (recommended for client-only use)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.teamviewer.com/en/download/portal/linux/'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer' 'teamviewer-beta')
depends=(
    'hicolor-icon-theme'
    'qt5-x11extras'
    'qt5-quickcontrols'
    'qt5-webengine'
    'qt5-svg'
    'bubblewrap'
)
install=teamviewer-sandboxed.install
source_x86_64=("https://dl.teamviewer.com/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("https://dl.teamviewer.com/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
source_armv7h=("https://dl.teamviewer.com/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_armhf.deb")
source_aarch64=("https://dl.teamviewer.com/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_arm64.deb")
source+=('teamviewerd-sandboxed.service'
         'teamviewer-gui-wrapper.sh')
sha256sums=('cd2031c9b6559d0e5806b2bbb4261997d5eee7aae5620640af950f264fdad661'
            'd65c847dadc88ec3656f3d04ec287a2e9243d0d0780364bb8492b7bd417e7dc1')
sha256sums_i686=('1a7854ad92d80e967f7cc3b9385c33e034a67de6f6d8690186395f8f1a04d724')
sha256sums_x86_64=('0f3b5945504815d2e4657d5af3db55c09bc989c82c9b9613bb1d1ecf258bd7ec')
sha256sums_armv7h=('789445ea3e5ad78dd3d24dc8ed3621d27f45c98f0cba2a39c465acb51e9adaf4')
sha256sums_aarch64=('94a100b8cb1271b9c492047a545ca41326abe79bbf15db7955c0969ca3f024b5')

prepare() {
    warning "If the install fails, you need to uninstall previous major version of Teamviewer"
    [ -d data ] && rm -rf data
    mkdir data
    cd data
    for datatar in ../data.tar.*; do
        msg2 "Unpacking $datatar"
        tar -xf $datatar
    done
    sed -i '/function CheckQtQuickControls()/{N;a ls /usr/lib/qt/qml/QtQuick/Controls/qmldir &>/dev/null && return # ArchLinux
}' ./opt/teamviewer/tv_bin/script/teamviewer_setup || msg2 "Patching CheckQtQuickControls failed! Contact maintainer"
    msg2 "Running teamviewer_setup checklibs"
    ./opt/teamviewer/tv_bin/script/teamviewer_setup checklibs \
    || msg2 "teamviewer_setup checklibs failed, contact maintainer with /tmp/teamviewerTARLibCheck/DependencyCheck.log"

    # Patch .desktop files to use the sandboxed wrapper
    msg2 "Patching .desktop files to use /usr/bin/teamviewer wrapper"
    find ./opt/teamviewer/tv_bin/desktop -name "*.desktop" -type f -exec \
        sed -i 's|Exec=/opt/teamviewer/tv_bin/script/teamviewer|Exec=/usr/bin/teamviewer|g' {} +
}

package() {
    warning "If the install fails, you need to uninstall previous major version of Teamviewer"
    cp -dr --no-preserve=ownership ./data/{etc,opt,usr,var} "${pkgdir}"/

    # Remove apt configs
    rm -rf "${pkgdir}"/etc/apt

    # Remove polkit policy to prevent sandbox escape via pkexec
    rm -f "${pkgdir}"/usr/share/polkit-1/actions/com.teamviewer.TeamViewer.policy

    # Remove D-Bus services to prevent auto-activation bypass of sandbox
    rm -f "${pkgdir}"/usr/share/dbus-1/services/com.teamviewer.TeamViewer.service
    rm -f "${pkgdir}"/usr/share/dbus-1/services/com.teamviewer.TeamViewer.Desktop.service

    # Install sandboxed systemd service
    install -D -m0644 "${srcdir}"/teamviewerd-sandboxed.service \
        "${pkgdir}"/usr/lib/systemd/system/teamviewerd.service

    # Move original teamviewer symlink to teamviewer-unwrapped
    mv "${pkgdir}"/usr/bin/teamviewer "${pkgdir}"/usr/bin/teamviewer-unwrapped

    # Install bwrap wrapper as the default teamviewer command
    install -D -m0755 "${srcdir}"/teamviewer-gui-wrapper.sh \
        "${pkgdir}"/usr/bin/teamviewer

    install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
    ln -s /opt/teamviewer/License.txt \
        "${pkgdir}"/usr/share/licenses/teamviewer/LICENSE

    if [ "$CARCH" = "x86_64" ] && [ -f "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend" ]; then
        msg2 "Removing libdepend to ditch lib32 dependencies"
        rm "${pkgdir}/opt/teamviewer/tv_bin/script/libdepend"
    fi
}
