# Maintainer: sean <sean@example.com>
# Contributor: xpt <user.xpt@gmail.com>
pkgname=openstudio-bin
_pkgname=openstudio
pkgver=3.11.0
pkgrel=1
_relvar='241b8abb4d'
_ubuntuver='24.04'
pkgdesc="Supports whole building energy modeling using EnergyPlus and Radiance"
arch=('x86_64')
url="https://openstudio.net"
depends=('gcc-libs' 'glibc' 'libxcrypt-compat')
optdepends=('ruby: for Ruby bindings'
            'python: for Python bindings')
provides=('openstudio')
conflicts=('openstudio')
license=('BSD-3-Clause')
options=('!strip')
source=("https://github.com/NREL/OpenStudio/releases/download/v${pkgver}/OpenStudio-${pkgver}+${_relvar}-Ubuntu-${_ubuntuver}-${CARCH}.deb"
        'openstudio.desktop')
sha256sums=('0206b02bf610556e54857cb32d1c5104be5588366cb2a4e08dc717bc7295b1d1'
            'SKIP')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.gz
}

package() {
    cd "${srcdir}"

    # Install to /opt/openstudio
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    cp -a "usr/local/openstudio-${pkgver}/." "${pkgdir}/opt/${_pkgname}/"

    # Desktop entry
    install -Dm644 openstudio.desktop "${pkgdir}/usr/share/applications/openstudio.desktop"

    # Symlink main binaries to PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/bin/openstudio" "${pkgdir}/usr/bin/openstudio"

    # License
    install -Dm644 "${pkgdir}/opt/${_pkgname}/copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
