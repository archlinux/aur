# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi-git'
_pkgname='koi'
__pkgname='Koi'
pkgver=0.6.r0.gbe28f61
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'hicolor-icon-theme' 'plasma-desktop' 'plasma-integration' 'plasma-workspace')
makedepends=('base-devel' 'qt6-base' 'qt6-tools' 'cmake'
             'desktop-file-utils' 'extra-cmake-modules' 'fdupes')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly'
            'kvantum: Powerful extra customisable themes')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/baduhai/Koi.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" \
          -S "${srcdir}/${_pkgname}/" \
          -B "${srcdir}/${_pkgname}/build/"

    cmake --build "${srcdir}/${_pkgname}/build/" --parallel
}

package() {
    cmake --install "${srcdir}/${_pkgname}/build/"

# Check the Application .DESKTOP file & Look for Duplicates within `pkgdir` ...
    desktop-file-validate "${pkgdir}/usr/share/applications/local.${__pkgname}DbusInterface.desktop"
    fdupes -r -s          "${pkgdir}/"
}
