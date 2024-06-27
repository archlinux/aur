# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi'
_pkgname='Koi'
pkgver=0.3.1
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'plasma-desktop' 'plasma-integration' 'plasma-workspace' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('gcc' 'qt6-base' 'qt6-tools' 'cmake' 'extra-cmake-modules' 'desktop-file-utils' 'fdupes')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly'
            'kvantum: Powerful extra customisable themes')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('5f42a59a26167d5d910c1361a86032e5')

build() {
    cmake -S "${srcdir}/${_pkgname}-${pkgver}/src/" \
          -B "${srcdir}/${_pkgname}-${pkgver}/src/build/" \
          -DCMAKE_INSTALL_PREFIX="/usr/"

    make -C "${srcdir}/${_pkgname}-${pkgver}/src/build/"
}

check() {
    desktop-file-validate "${srcdir}/${_pkgname}-${pkgver}/src/${pkgname}.desktop"
    fdupes -r -s "${srcdir}/"
}

package() {
    make -C "${srcdir}/${_pkgname}-${pkgver}/src/build/" DESTDIR="${pkgdir}" install

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

    desktop-file-validate "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    fdupes -r -s "${pkgdir}/"
}
