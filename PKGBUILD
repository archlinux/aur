# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi-git'
_pkgname='koi'
__pkgname='Koi'
pkgver=0.2.4.r0.geae87d1
pkgrel=2
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'glibc' 'plasma-integration' 'plasma-framework5' 'kcoreaddons5' 'kconfig5'
         'kwidgetsaddons5' 'kwindowsystem5' 'kconfigwidgets5' 'kxmlgui5' 'hicolor-icon-theme' 'qt5-base')
makedepends=('git' 'gcc' 'qt5-base' 'qt5-tools' 'qt5-svg' 'cmake' 'extra-cmake-modules')
optdepends=('desktop-file-utils: Command line utilities for working with desktop entries'
            'xsettingsd: Apply settings to GTK applications on the fly')
provides=('koi')
conflicts=('koi')
source=("${__pkgname}-${pkgver}::git+https://github.com/baduhai/Koi.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${__pkgname}-${pkgver}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' ||

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
    mkdir -p "${srcdir}/${__pkgname}-${pkgver}/src/build/"

    cmake -S "${srcdir}/${__pkgname}-${pkgver}/src/" \
          -B "${srcdir}/${__pkgname}-${pkgver}/src/build/" \
          -DCMAKE_INSTALL_PREFIX=/usr/

    cd "${srcdir}/${__pkgname}-${pkgver}/src/build/"

    make all
}

package() {
    cd "${srcdir}/${__pkgname}-${pkgver}/src/build/"

    make DESTDIR="${pkgdir}" install all

    install -Dm644 "${srcdir}/${__pkgname}-${pkgver}/src/koi.desktop" -t "${pkgdir}/usr/share/applications/"
}
