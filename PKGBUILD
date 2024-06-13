# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi-git'
_pkgname='koi'
__pkgname='Koi'
pkgver=0.3.r0.g86e3b15
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'plasma-desktop' 'plasma-integration' 'plasma-workspace' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'gcc' 'qt6-base' 'qt6-tools' 'cmake' 'extra-cmake-modules' 'desktop-file-utils' 'fdupes')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly'
                        'kvantum: Powerful extra customisable themes')
provides=("${_pkgname}")
conflicts=('koi')
source=("${pkgname}::git+https://github.com/baduhai/Koi.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "${srcdir}/${pkgname}/src/" \
          -B "${srcdir}/${pkgname}/src/build/" \
          -DCMAKE_INSTALL_PREFIX="/usr/"

    make -C "${srcdir}/${pkgname}/src/build/"
}

check() {
    desktop-file-validate "${srcdir}/${pkgname}/src/${_pkgname}.desktop"
    fdupes -r -s "${srcdir}/"
}

package() {
    make -C "${srcdir}/${pkgname}/src/build/" DESTDIR="${pkgdir}" install

    install -Dm644 "${srcdir}/${pkgname}/src/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

    desktop-file-validate "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    fdupes -r -s "${pkgdir}/"
}
