# Maintainer: Oliver Mangold <omgold@dray.be>
pkgname=luxcorerender-bin
pkgver=2.2
pkgrel=1
pkgdesc="LuxCoreRender is a physically correct, unbiased rendering engine (official binary version)."
arch=('x86_64')
license=('apache')
depends=(libx11 libxcb ocl-icd)
optdepends=()
makedepends=(unzip)
conflicts=(luxcorerender)
provides=(luxcorerender)
source=(
    "https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v${pkgver}/luxcorerender-v${pkgver}-blender2.80-linux64-opencl.tar.bz2"
    "https://github.com/LuxCoreRender/LuxCore/releases/download/luxcorerender_v${pkgver}/luxcorerender-v${pkgver}-linux64-opencl-sdk.tar.bz2"
)
sha256sums=(
    '9e607d10a24d0d24ca051c4f9d5114ca1a42d7b3749de8d56ac9024ae5a97c52'
    '13fc4670b1fc87d2b36d6228b035ce220adeaff6f65177f2945f247d89f4e212'
)

package() {
    local _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")

    cd "${srcdir}/LuxCore-opencl-sdk"
    install -dm755 $pkgdir/usr/lib/luxcorerender
    install lib/* bin/* $pkgdir/usr/lib/luxcorerender
    install -dm755 $pkgdir/usr/bin
    cd bin
    for f in *; do
        ln -s "../lib/luxcorerender/$f" "$pkgdir/usr/bin/$f"
    done
    cd ..
    install -dm755 $pkgdir/usr/lib/python$_pyver
    ln -s ../luxcorerender/pyluxcore.so $pkgdir/usr/lib/python$_pyver/pyluxcore.so
    install -dm755 $pkgdir/usr/share/luxcorerender/{scenes,samples}
    cp -a scenes/* $pkgdir/usr/share/luxcorerender/scenes
    cp -a samples/* $pkgdir/usr/share/luxcorerender/samples
    cd "${srcdir}/LuxCore-opencl"
    install pyluxcore.so $pkgdir/usr/lib/luxcorerender/pyluxcore.so
    rm -rf pyluxcoretools
    unzip -o "pyluxcoretools.zip"
    install -dm755 pyluxcoretools $pkgdir/usr/lib/python$_pyver/pyluxcoretools
    cp -a pyluxcoretools/* $pkgdir/usr/lib/python$_pyver/pyluxcoretools
}
