# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Eric Berquist <eric DOT berquist AT gmail>
# shellcheck disable=SC2034,SC2154

pkgname=iqmol
pkgver=3.1.5
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL-3.0-only')
depends=('qt5-base' 'glu')
provides=("${pkgname}")
conflicts=("iqmol-git" "iqmol-bin")
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/nutjunkie/IQmol3/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.png"
    "${pkgname}.desktop"
    "CMakeLists.patch")
b2sums=('4e78bc51d34ab230a5d31352b38ab2ca08538382f0950bac1e92ff9bdc1b2ab160b4628f6d52a3f248a3ab130ceac4c3b9e62b530ec10241471e71d30fd583a8'
        '71e913daa9032326153f0af6fcd320718d9d6ad4487e1d5e4cca28d89b6311282c43fbb28cd89c9cb7ed9531ba1e552d7107c50518ca917177919b564a347c04'
        'd3ceaa996a9c7332e4a25c42a229a0a72689913b488d1b13e060bb59b1ca7ba253b49132748166dd9dc5fbf16d6ab4da63ad687cea73bd6cba44eb663a392d68'
        'b15062d2fd0782759a465416b8e7b3276d5c80ad2d0d5afd95450be4ac5dc7a33c3cc41af2a79b3d623dce431aa190b9ccce2f4aa7de3940d8ebd799c8475ef4')

prepare() {
    patch --forward -i "CMakeLists.patch" "IQmol3-${pkgver}/CMakeLists.txt"
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
