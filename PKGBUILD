# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi'
_pkgname='Koi'
pkgver=0.6
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'plasma-desktop' 'plasma-integration' 'plasma-workspace' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('base-devel' 'gcc' 'qt6-base' 'qt6-tools' 'cmake' 'extra-cmake-modules' 'desktop-file-utils' 'fdupes')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly'
            'kvantum: Powerful extra customisable themes')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('72486cc1c6b76f4f76401dc55f852d80')

build() {
    cmake -DCMAKE_BUILD_TYPE=Release              \
          -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" \
          -S "${srcdir}/${_pkgname}-${pkgver}/"   \
          -B "${srcdir}/${_pkgname}-${pkgver}/build/"

    cmake --build "${srcdir}/${_pkgname}-${pkgver}/build/" --parallel
}

package() {
    cmake --install "${srcdir}/${_pkgname}-${pkgver}/build/"

# Check the Application .DESKTOP file & Look for Duplicates within `pkgdir` ...
    desktop-file-validate "${pkgdir}/usr/share/applications/local.${_pkgname}DbusInterface.desktop"
    fdupes -r -s          "${pkgdir}/"
}
