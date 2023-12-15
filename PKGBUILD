# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi-git'
_pkgname='koi'
__pkgname='Koi'
pkgver=r163.eae87d1
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('plasma-desktop' 'plasma-integration' 'plasma-framework5' 'kcoreaddons5' 'kconfig5'
         'kwidgetsaddons5' 'kwindowsystem5' 'kconfigwidgets5' 'kxmlgui5' 'kpackage5' 'hicolor-icon-theme')
makedepends=('git' 'glibc' 'qt5-base' 'qt5-tools' 'qt5-svg' 'cmake' 'extra-cmake-modules')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly')
conflicts=('koi')
source=("${__pkgname}::git+https://github.com/baduhai/Koi.git")
sha256sums=('SKIP')
options=('!strip')


pkgver() {
  cd "${srcdir}/${__pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    mkdir -p "${srcdir}/${__pkgname}/src/build/"

    cmake -S "${srcdir}/${__pkgname}/src/" \
          -B "${srcdir}/${__pkgname}/src/build/" \
          -DCMAKE_INSTALL_PREFIX=/usr/

    cd "${srcdir}/${__pkgname}/src/build/"

    make all
}

package() {
    cd "${srcdir}/${__pkgname}/src/build/"

    make DESTDIR="${pkgdir}" install all

    install -Dm644 "${srcdir}/${__pkgname}/src/koi.desktop" -t "${pkgdir}/usr/share/applications/"
}
