# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=amgx
pkgver=2.2.0
pkgrel=1
pkgdesc="Distributed multigrid linear solver library on GPU"
arch=("x86_64")
url="https://github.com/NVIDIA/AMGX"
license=('custom')
depends=('cuda>=10.2' 'openmpi')
makedepends=('cmake')
provides=('amgx')
conflicts=('amgx-git')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/AMGX/archive/refs/tags/v${pkgver}.tar.gz"
    "amgx.sh"
    "amgx.conf"
)
sha256sums=(
    "dac78516bb528135cad903399fe0093aa0904e304565ef2d3da4fae05eda7928"
    "0d8b9c1ecdf6d76f791dc5a1f2a9a2989ce26cc2c5f4232446d7f6f8e6e8bee9"
    "7a1ee0bf5d5610a8e643720e579d8659e362a77ac763a7570ee22a2e56c05cbd"
)

prepare() {
    # fix the folder name
    mv "AMGX-${pkgver}" "$pkgname-$pkgver"
}

build() {
    mkdir "$srcdir/build"
    cd "$srcdir/build"

    # running cmake configuration; install to /opt
    cmake \
        -DCMAKE_C_COMPILER=/usr/bin/gcc \
        -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
        -DCMAKE_CXX_FLAGS="-fPIC" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/opt/$pkgname" \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DCUDA_HOST_COMPILER=/opt/cuda/bin/g++ \
        -DCUDA_NVCC_FLAGS="-Wno-deprecated-gpu-targets" \
        -DCUDA_ARCH="35 37 52 60 70" \
        -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF \
        -DCMAKE_NO_MPI=OFF \
        -DAMGX_NO_RPATH=OFF \
        "$srcdir/$pkgname-$pkgver/"

    # will respect the parallel compilation settings in /etc/makepkg.conf
    echo
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "! ==================================================================== !"
    echo "! -------------------------------------------------------------------- !"
    echo "!                                                                      !"
    echo "! To comile the code in parallel, consider modifying /etc/makepkg.conf !"
    echo "!                                                                      !"
    echo "! -------------------------------------------------------------------- !"
    echo "! ==================================================================== !"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo
    make all
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    # install amgx.sh to /etc/profile.d
    install -Dm755 "$srcdir/amgx.sh" "$pkgdir/etc/profile.d/amgx.sh"

    # install amgx.conf to /etc/ld.so.conf.d/amgx.conf
    install -Dm644 "$srcdir/amgx.conf" "$pkgdir/etc/ld.so.conf.d/amgx.conf"

    # not sure which path to install LICENSE, so use a simlink
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/opt/$pkgname/LICENSE"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
