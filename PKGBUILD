# Maintainer: Nick Cao <nickcao@nichi.co>
# Maintainer: hexchain <richard0053@gmail.com>
pkgname=dptf
pkgver=8.4.10401
pkgrel=5
pkgdesc='Intel (R) Dynamic Platform and Thermal Framework (Intel (R) DPTF)'
arch=('x86_64')
url='https://github.com/intel/dptf'
license=('custom')
depends=('readline')
makedepends=('cmake')
source=('https://github.com/intel/dptf/archive/8.4.10401.tar.gz')
md5sums=('707632f2943e838f379d20a5076fb722')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CXXFLAGS="${CXXFLAGS} -Wno-error=catch-value -Wno-error=stringop-truncation"
    export CFLAGS="${CFLAGS} -Wno-error=format-truncation"

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
    install -Dm755 "DPTF/Linux/build/x64/release/Dptf.so" "$pkgdir/usr/share/dptf/ufx64/Dptf.so"
    install -Dm755 "DPTF/Linux/build/x64/release/DptfPolicyActive.so" "$pkgdir/usr/share/dptf/ufx64/DptfPolicyActive.so"
    install -Dm755 "DPTF/Linux/build/x64/release/DptfPolicyCritical.so" "$pkgdir/usr/share/dptf/ufx64/DptfPolicyCritical.so"
    install -Dm755 "DPTF/Linux/build/x64/release/DptfPolicyPassive.so" "$pkgdir/usr/share/dptf/ufx64/DptfPolicyPassive.so"
    install -Dm755 "ESIF/Products/ESIF_CMP/Linux/esif_cmp.so" "$pkgdir/usr/share/dptf/ufx64/esif_cmp.so"
    install -Dm755 "ESIF/Products/ESIF_WS/Linux/esif_ws.so" "$pkgdir/usr/share/dptf/ufx64/esif_ws.so"
    install -Dm644 "ESIF/Packages/DSP/dsp.dv" "$pkgdir/etc/dptf/dsp.dv"
    install -Dm755 "ESIF/Products/ESIF_UF/Linux/esif_ufd" "$pkgdir/usr/bin/esif_ufd"
    install -Dm644 "ESIF/Packages/Installers/linux/dptf.service" "$pkgdir/usr/lib/systemd/system/dptf.service"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
