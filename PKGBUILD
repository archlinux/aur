pkgname=dptf
pkgver=8.8.10200
pkgrel=1
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('custom')
depends=('readline')
makedepends=('cmake')
source=("dptf-$pkgver.tar.gz::https://github.com/intel/dptf/archive/$pkgver.tar.gz")
sha256sums=('9fe1690484ba3e85d3e39db3fbfadd78f5a795540c35b1a710bae38cb0aa5e49')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CXXFLAGS="${CXXFLAGS} -Wno-error=catch-value -Wno-error=stringop-truncation -ffile-prefix-map='$srcdir/$pkgname-$pkgver'="
    export CFLAGS="${CFLAGS} -Wno-error=format-truncation -Wno-error=format-overflow -ffile-prefix-map='$srcdir/$pkgname-$pkgver'="

    pushd DPTF/Linux/build
    cmake ..
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

    cd ESIF/Packages/Installers/linux
    sed -i 's/^description/Description/' dptf.service
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 DPTF/Linux/build/x64/release/Dptf{,Policy{Active,Critical,Passive}}.so -t "$pkgdir/usr/share/dptf/ufx64/"
    install -Dm755 ESIF/Products/ESIF_CMP/Linux/esif_cmp.so "$pkgdir/usr/share/dptf/ufx64/esif_cmp.so"
    install -Dm755 ESIF/Products/ESIF_WS/Linux/esif_ws.so "$pkgdir/usr/share/dptf/ufx64/esif_ws.so"
    install -Dm644 ESIF/Packages/DSP/dsp.dv "$pkgdir/etc/dptf/dsp.dv"
    install -Dm755 ESIF/Products/ESIF_UF/Linux/esif_ufd "$pkgdir/usr/bin/esif_ufd"
    install -Dm644 ESIF/Packages/Installers/linux/dptf.service "$pkgdir/usr/lib/systemd/system/dptf.service"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
