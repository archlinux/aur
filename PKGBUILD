# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# shellcheck disable=SC2034,SC2154

pkgname=iqmol
pkgver=3.2.0
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'glu'
    'libglvnd'
    'libqglviewer-qt5'
    'libssh2'
    'openbabel'
    'openmesh'
    'qt5-base'
    'yaml-cpp'
)
provides=("${pkgname}")
conflicts=("iqmol-git" "iqmol-bin")
source=(
    "${pkgname}_${pkgver}.tar.gz::https://github.com/nutjunkie/IQmol3/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.png"
    "${pkgname}.desktop"
    "CMakeLists.txt.patch"
    "src-main-iqmolapplication-c.patch"
    "FileDialog.C.patch"
    "src_CMakeLists.txt.patch"
)
b2sums=('b65c7d70e5e8120c8134ad5b4b5ce37f602c7c34202b8a8bc8ac09f9cb8a35b3e3ad615de4c33bbb3f9b406d9bd1a99861004f6354aae0c79738ffb8d3e711c2'
        '71e913daa9032326153f0af6fcd320718d9d6ad4487e1d5e4cca28d89b6311282c43fbb28cd89c9cb7ed9531ba1e552d7107c50518ca917177919b564a347c04'
        'c852ea5ab5673435647df0a016bb74234e3a3767c6425f8bb05aad1a11e02ddf2f752db0aee3d4346c3372b3b0e4491c2cba9afa1a882cbb84721b4b81034b35'
        'c27b2aa0913cd860a92c3316ff80629b9831038b7d414c82c05fa018e15fa3ca2eeae93f232b0efb5da29189caf0bd9f5dc4fcb593c7c37706572cdc4d083956'
        '31808c39fab46dafaed2da054952e2d345a4db4fee727a120bcdc6a3eb8c1b0c6d4885dd2eb57c433960fdbab4e9878e1b23aa6ce31fd853c07e5578bd146bfd'
        '4cc4c5ce7814ef6bd06e9931f3f59582ec222201ad78827e85b36e1158dfefcb0a0f2fe36bc0ff921c12cc4dc1ef76392c2ab1c27277dbc1f18e5d152811859d'
        'a8d11e89b328c28efee7a2990d337f8647bd37d9bc06392fc15e6a22ccf8f2e9c2019ad3e6090eae00fb395c2dc053f77c91c79fead6a7d50780ad79e88fed64')

prepare() {
    # makepkg --clean --nobuild --noprepare; diff -ura src/IQmol3-3.2.0/CMakeLists.txt CMakeLists.txt.new > CMakeLists.txt.patch; updpkgsums
    # makepkg --clean --nobuild --noprepare; diff -ura src/IQmol3-3.2.0/src/Util/FileDialog.C FileDialog.C > FileDialog.C.patch; updpkgsums
    # makepkg --clean --nobuild --noprepare; diff -ura src/IQmol3-3.2.0/src/CMakeLists.txt CMakeLists.txt > src_CMakeLists.txt.patch; updpkgsums
    patch --forward -p1 -i "CMakeLists.txt.patch"
    patch --forward -p1 -i "src-main-iqmolapplication-c.patch"
    patch --forward -p1 -i "FileDialog.C.patch"
    patch --forward -p1 -i "src_CMakeLists.txt.patch"
}

build() {
    cmake -B build -S IQmol3-${pkgver}
    cmake --build build
}

package() {

    install -D -m755 "${srcdir}/build/IQmol" "${pkgdir}/usr/bin/iqmol"

    mkdir -p "${pkgdir}/usr/share/iqmol"
    cp -dr --no-preserve='ownership' "${srcdir}/IQmol3-${pkgver}/share/." "${pkgdir}/usr/share/iqmol/"

    mkdir -p "${pkgdir}/usr/share/man/man7/"
    install -Dm644 "${srcdir}/IQmol3-${pkgver}/share/man/man7/iqmol.7.gz" "${pkgdir}/usr/share/man/man7/"

    install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
