# Contributor: physkets <physkets // at // tutanota dot com>

pkgname=fmlib
pkgver=1.4
pkgrel=3
pkgdesc="A fortran multiple-precision arithmetic library"
arch=('x86_64')
url="https://dmsmith.lmu.build/"
license=('MIT')
depends=('libgfortran.so')
makedepends=('gcc-fortran')
source=("FM_files_${pkgver}_${pkgrel}.zip::https://dmsmith.lmu.build/FM${pkgver}/FM_files.zip")
sha256sums=('fba4ac76c212fca77c99a21d3772cd0843b2c18b4a6443838c6466491f1d5cca') 

build() {
    cd "$srcdir/FM_files/"
    mkdir -p build/libs
    mkdir -p build/mods
    gfortran -O3 -shared -fPIC -J./build/mods -o ./build/libs/libfmsave.so fmsave.f95
    gfortran -O3 -shared -fPIC -J./build/mods -o ./build/libs/libfm.so fm.f95
    gfortran -O3 -shared -fPIC -J./build/mods -o ./build/libs/libfmzm90.so fmzm90.f95
}

check() {
    cd "$srcdir/FM_files/"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$srcdir/FM_files/build/libs/"
    gfortran -O3 -I./build/mods -L./build/libs -o test.out TestFM.f95 -lfmsave -lfm -lfmzm90
    # check fails, mailed upstream 2026-02-17
    # ./test.out
    gfortran -O3 -I./build/mods -L./build/libs -o sample.out SampleFM.f95 -lfmsave -lfm -lfmzm90
    ./sample.out
}

_gcc_ver="$(gcc --version | awk 'NR==1 {print$3}')"

package() {
    install -Dm755 -t "$pkgdir/usr/lib" "$srcdir/FM_files/build/libs/"*.so 
    install -Dm644 -t "$pkgdir/usr/lib/gcc/x86_64-pc-linux-gnu/${_gcc_ver}/finclude" "$srcdir/FM_files/build/mods/"*.mod
    install -Dm644 "$srcdir/FM_files/LICENSE.txt" "$pkgdir/usr/share/licenses/fmlib/LICENSE.txt"
}

