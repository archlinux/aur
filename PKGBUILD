# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi-git'
_pkgname='koi'
__pkgname='Koi'
pkgver=0.6.r2.1697ec6
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
url="https://github.com/baduhai/Koi"
license=('LGPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'kconfig'
    'kcoreaddons'
    'kdbusaddons'
    'kguiaddons'
    'kwidgetsaddons'
    'kwindowsystem'
    'kconfigwidgets'
    'plasma-desktop'
    'plasma-integration'
    'plasma-workspace'
    'hicolor-icon-theme'
)

makedepends=(
    'qt6-tools'
    'cmake'
    'extra-cmake-modules'
    'desktop-file-utils'
    'fdupes'
)

optdepends=(
    'xsettingsd: Apply settings to GTK applications on the fly'
    'kvantum: Powerful extra customisable themes'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    cmake -S '.' -B 'build' \
          -DCMAKE_BUILD_TYPE='Release' \
          -DCMAKE_INSTALL_PREFIX='/usr/' \
          -DKDE_INSTALL_USE_QT_SYS_PATHS='ON'

    cmake --build 'build'
}

package() {
    cd "${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install 'build'

    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

    # Validate the desktop file structure
    desktop-file-validate "${pkgdir}/usr/share/applications/local.${__pkgname}DbusInterface.desktop"

    # Deduplicate files (if applicable)
    fdupes -s "${pkgdir}"
}
