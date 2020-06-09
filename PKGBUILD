# Maintainer:  Kate Temkin  <kate+aur@ktemkin.com>

pkgname=quicklogic-fpga-toolchain-bin
pkgrel=1
pkgver=0.1.0
pkgdesc="SymbiFlow variant provided as QuickLogic's vendor toolchain"
provides=('quicklogic-fpga-toolchain')
conflicts=('quicklogic-fpga-toolchain')
arch=('x86_64' 'i686')
url='https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain'
license=('custom:ISC')
depends=('readline6')
makedepends=()
source=( 'https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v0.1.0/Symbiflow_v0.1.0.gz.run')
sha512sums=('5333a80f67c4fdae6340ae717a09903e1a4066113234881080ab28d52232fee9e4adccfa0f52be963758d9a5be391b01cc38d3ccc638391dbf4d7890b2a697be')
options=('!strip')


package() {
    cd "${srcdir}"
    
    # Install the toolchain to our package directory...
    export SYM_INSTALL_PATH="${pkgdir}/opt/quicklogic-fpga-toolchain"
    chmod +x ./Symbiflow_v${pkgver}.gz.run
    ./Symbiflow_v${pkgver}.gz.run

    # ... patch away any references to our package directory...
    cd "${pkgdir}"
    find -name *egg-link -exec sed -i 's|.*/opt/quicklogic-fpga-toolchain/|/opt/quicklogic-fpga-toolchain/|' {} \;
    find -name *easy-install.pth -exec sed -i 's|.*/opt/quicklogic-fpga-toolchain/|/opt/quicklogic-fpga-toolchain/|' {} \;

    # ... fix up our permissions ...
    chmod -R a=u,go-w "${pkgdir}"

    # ... and copy our license into place.
    install -Dm644 "${pkgdir}/opt/quicklogic-fpga-toolchain/symbiflow-arch-defs/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
