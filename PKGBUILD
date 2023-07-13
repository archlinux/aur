# Maintainer:‌ <none>
pkgname=dptf
pkgver=9.0.11363
pkgrel=1
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('custom')
depends=('readline')
makedepends=('cmake')
source=("dptf-$pkgver.tar.gz::https://github.com/intel/dptf/archive/$pkgver.tar.gz")
sha256sums=('eeac4e52230742e3d3e8d12d65013dce47032348e30ce21302fa08fe92c4fb78')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CXXFLAGS="${CXXFLAGS} -Wno-error=catch-value -Wno-error=stringop-truncation -Wno-error=overloaded-virtual -ffile-prefix-map='$srcdir/$pkgname-$pkgver'="
    export CFLAGS="${CFLAGS} -Wno-error=format-truncation -Wno-error=format-overflow -Wno-error=overloaded-virtual -ffile-prefix-map='$srcdir/$pkgname-$pkgver'="

    pushd DPTF/Linux/build
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
    make
    popd

    pushd ESIF/Products/ESIF_UF/Linux
    make
    popd

    pushd ESIF/Products/ESIF_CMP/Linux
    make
    popd

    pushd ESIF/Products/ESIF_WS/Linux
    make
    popd

    pushd IPF/Linux
    make
    popd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 DPTF/Linux/build/x64/release/Dptf{,Policy{Active,Critical,Passive}}.so -t "$pkgdir/usr/share/dptf/ufx64/"
    install -Dm755 ESIF/Products/ESIF_CMP/Linux/esif_cmp.so "$pkgdir/usr/share/dptf/ufx64/esif_cmp.so"
    install -Dm755 ESIF/Products/ESIF_WS/Linux/esif_ws.so "$pkgdir/usr/share/dptf/ufx64/esif_ws.so"
    install -Dm644 ESIF/Packages/DSP/dsp.dv "$pkgdir/etc/dptf/dsp.dv"
    install -Dm755 ESIF/Products/ESIF_UF/Linux/esif_ufd "$pkgdir/usr/bin/esif_ufd"
    install -Dm644 ESIF/Packages/Installers/linux/dptf.service "$pkgdir/usr/lib/systemd/system/dptf.service"

    install -Dvm644  README.txt   "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
    install -Dvm644  security.md  "${pkgdir}/usr/share/doc/${_pkgname}/security.md"
    install -Dvm644  LICENSE.txt  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt"
}
