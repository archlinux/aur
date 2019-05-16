# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=siesta
pkgver=4.0.2
pkgrel=1
pkgdesc="A first-principles materials simulation code using DFT"
arch=("x86_64")
url="https://departments.icmab.es/leem/siesta"
license=('GPL')
depends=('gcc-fortran' 'openmpi' 'blas' 'lapack' 'scalapack')
makedepends=('sed')
source=("https://launchpad.net/$pkgname/4.0/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('bafbda19358f0c1dd39bb1253c92ee548791a1c0f648977051d2657216874f7e')

build() {
    cd $pkgname-$pkgver/Obj
    ../Src/obj_setup.sh
    ../Src/configure \
                    --prefix=/usr \
                    --enable-mpi \
                    --with-lapack="-llapack" \
                    FCFLAGS="$CFLAGS"
    make -j1
    cd ../Util
    sed -i "s/ make/ make -j1/g" build_all.sh
    ./build_all.sh
}

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/opt/siesta/bin
    install -dm755 $pkgdir/usr/{bin,share/siesta}
    find ./Util -type f ! -name "*.sh" -executable -exec install -m755 {} "$pkgdir/opt/siesta/bin" ";"
    install -m755 ./Obj/siesta $pkgdir/opt/siesta/bin
    ln -sf $pkgdir/opt/siesta/bin/siesta $pkgdir/usr/bin
} 
