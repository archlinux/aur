# Original Author: William Franco Abdul Hai <baduhai@proton.me>
# Contributor:     Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer:      Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname=koi
_pkgname=Koi
pkgver=0.6
pkgrel=2
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

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fccc484bd14ebc6f4c557ecc1ed1cb76cf8cdee764c296efa75f0a66401e7c89')

build() {
    cd "${_pkgname}-${pkgver}"

    cmake -S '.' -B 'build' \
          -DCMAKE_BUILD_TYPE='Release' \
          -DCMAKE_INSTALL_PREFIX='/usr/' \
          -DKDE_INSTALL_USE_QT_SYS_PATHS='ON'

    cmake --build 'build'
}

package() {
    cd "${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install 'build'

    install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    # Validate the desktop file structure
    desktop-file-validate "${pkgdir}/usr/share/applications/local.${_pkgname}DbusInterface.desktop"

    # Deduplicate files (if applicable)
    fdupes -s "${pkgdir}"
}
