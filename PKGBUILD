# Maintainer: Wayne Heaney <wayne@xronlinux.com>
_pkgbase=breezy-desktop
pkgname="${_pkgbase}"-kwin-git
pkgver=2.9.1
pkgrel=1
pkgdesc="Breezy KWin - XR desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/wheaney/breezy-desktop"
license=('GPL-3.0')
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kglobalaccel'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'kxmlgui'
    'qt6-tools'
)
depends=(
    'kwin'
    'qt6-base'
    'qt6-declarative'
    'libepoxy'
    'libxcb'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kglobalaccel'
    'ki18n'
    'kcmutils'
    'kwindowsystem'
    'kxmlgui'
    'python'
    'xr-driver-git'
)
source=("git+${url}#commit=0d53d10a43e0a8c307dadba5f18327bd75e2bdfb")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgbase}"
    # Read version from VERSION file and replace hyphens with dots
    version=$(cat VERSION)
    echo "${version}" | tr '-' '.'
}

prepare() {
    USER=${SUDO_USER:-$USER}
    if [ -n "$USER" ]; then
        USER_HOME=$(getent passwd $USER | cut -d: -f6)
        if [ -e "$USER_HOME/.local/bin/breezy_kwin_uninstall" ]; then
            echo "Please uninstall Breezy Desktop first using $USER_HOME/.local/bin/breezy_kwin_uninstall, then reattempt the AUR installation"
            exit 1
        fi
    fi
}

build() {
    cd ${_pkgbase}

    # init submodules (only required ones)
    git submodule update --init --recursive modules/sombrero ui/modules/PyXRLinuxDriverIPC
    
    # Copy required files for build
    cp ui/modules/PyXRLinuxDriverIPC/xrdriveripc.py kwin/src/xrdriveripc/xrdriveripc.py
    cp VERSION kwin/
    
    # Copy sombrero assets to qml directory if they exist
    if [ -n "$(find modules/sombrero -name '*.png' 2>/dev/null)" ]; then
        cp modules/sombrero/*.png kwin/src/qml/
    fi
    
    cp ui/data/icons/hicolor/scalable/apps/com.xronlinux.BreezyDesktop.svg kwin/src/kcm/
    
    # Build KWin plugin
    cd kwin
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF
    
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgbase}/kwin"
    
    DESTDIR="${pkgdir}" cmake --install build

    # Install scripts
    install -Dm755 "${srcdir}/${_pkgbase}/kwin/bin/breezy_kwin_logs" \
        "${pkgdir}/usr/bin/breezy_kwin_logs"
}
