# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=whitebox-tools
pkgver=2.4.0
pkgrel=1
pkgdesc="WhiteboxTools is an advanced geospatial data analysis platform developed by Prof. John Lindsay"
arch=(i686 x86_64)
url="https://www.whiteboxgeo.com/"
license=('MIT')
makedepends=('rust' 'cmake' 'fontconfig' 'at-spi2-core' 'gtk3')
depends=('python')
source=("whitebox-tools-v${pkgver}.tar.gz::https://github.com/jblindsay/whitebox-tools/archive/v${pkgver}.tar.gz")
sha256sums=('f99f47e3d362cd3a1e8ac3f1e060ad7d0426244520ebd968f3ef01870fc1a955')

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTFLAGS="-C link-arg=-lzstd"

    cargo clean 
    cargo build --release 
}

package() {
    cd "${pkgname}-${pkgver}"

    install -D -m755 "target/release/whitebox_tools" "${pkgdir}/usr/bin/whitebox_tools"
    install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -D -m755 "whitebox_tools.py" "${pkgdir}/${site_packages}/whitebox_tools.py"
    install -D -m755 "wb_runner.py" "${pkgdir}/${site_packages}/wb_runner.py"
}
