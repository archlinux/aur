# Maintainer: Jan Kroulik <jk at wo dot cz>

_pkgname=boomaga
pkgname=${_pkgname}-git
pkgver=3.9.3.r0.g251dcad
pkgrel=2
pkgdesc="A virtual printer for viewing a document before printing it out using the physical printer (Qt6)"
arch=('x86_64' 'aarch64')
url="https://www.boomaga.org"
license=('GPL-2.0-only' 'LGPL-2.1-or-later')
depends=('cups' 'ghostscript' 'glibc' 'hicolor-icon-theme' 'libcups'
         'libgcc' 'libglvnd' 'libstdc++' 'poppler' 'qt6-base' 'zlib')
optdepends=('sudo: add the virtual printer from the Boomaga GUI'
            'qt6-wayland: run the GUI natively on Wayland')
makedepends=('qt6-tools' 'git' 'cmake')
provides=("boomaga=${pkgver}")
conflicts=('boomaga' 'boomaga-qt5' 'boomaga-qt6-git')
options=(!emptydirs)
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/Boomaga/boomaga.git#branch=master"
        'README.install')
sha256sums=('SKIP'
            '481746423a1b4c5d05d992a9282c43078fe8f34524a6224de1553299b716c7ea')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${_pkgname}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -D -m644 "${srcdir}/README.install" "${pkgdir}/usr/share/doc/${pkgname}/README.install"
}
