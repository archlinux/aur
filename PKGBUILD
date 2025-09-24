# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# shellcheck disable=SC2034,SC2154

pkgname=iqmol
pkgver=3.2.0
pkgrel=5
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL-3.0-only')
makedepends=(
    'gcc'
    'gcc-fortran'
)
depends=(
    'gcc-libs'
    'glibc'
    'glu'
    'libglvnd'
    'libqglviewer-qt5'
    'libssh2'
    'openbabel-git'
    'openmesh'
    'qt5-base'
    'yaml-cpp'
)
conflicts=("iqmol-git" "iqmol-bin")
source=(
    "git+https://github.com/nutjunkie/IQmol3.git#commit=e80b864c49272d00d2d4002b44cb5512af56dbd1"
    "${pkgname}.png"
    "${pkgname}.desktop"
)

b2sums=('00a6c4f250717d4a2ccafe3d637dd57d86767d4ca10644c97fd2394dd48ea3201eaadcfd2f4fe21855fe2882972546e8d832b2ae5b428aafb2cd20b6ce49e914'
        '71e913daa9032326153f0af6fcd320718d9d6ad4487e1d5e4cca28d89b6311282c43fbb28cd89c9cb7ed9531ba1e552d7107c50518ca917177919b564a347c04'
        'c852ea5ab5673435647df0a016bb74234e3a3767c6425f8bb05aad1a11e02ddf2f752db0aee3d4346c3372b3b0e4491c2cba9afa1a882cbb84721b4b81034b35')

prepare() {
    cmake -B build -S IQmol3
}

build() {
    cmake --build build
}

package() {

    install -D -m755 "${srcdir}/build/IQmol" "${pkgdir}/usr/bin/iqmol"

    mkdir -p "${pkgdir}/usr/share/iqmol"
    cp -dr --no-preserve='ownership' "${srcdir}/IQmol3/share/." "${pkgdir}/usr/share/iqmol/"
    rm "${pkgdir}/usr/share/iqmol/man/man7/iqmol.7.gz"

    mkdir -p "${pkgdir}/usr/share/man/man7/"
    install -Dm644 "${srcdir}/IQmol3/share/man/man7/iqmol.7.gz" "${pkgdir}/usr/share/man/man7/"

    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
