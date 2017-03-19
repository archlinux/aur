# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=tiny-dnn
pkgver=1.0.0a3
pkgrel=1
pkgdesc="A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices"
arch=('any')
url="https://github.com/tiny-dnn/tiny-dnn"
license=('BSD')
makedepends=('cmake' 'protobuf' 'intel-tbb' 'opencl-icd-loader' 'opencl-headers')
conflicts=('tiny-dnn-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tiny-dnn/tiny-dnn/archive/v${pkgver}.tar.gz")
sha256sums=('e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b')

build() {
    cd "${pkgname}-${pkgver}"
    
    # set CPU options
    if [ "$CARCH" = "x86_64" ] 
    then
        # get CPU flags (contains supported CPU instruction sets)
        _cpuflags="$(grep -m1 'flags' /proc/cpuinfo | sed 's/^flags[[:space:]]*:[[:space:]]//')"
        
        # check if optional instructions are supported by the CPU
        { printf "%s" "$_cpuflags" | grep -q 'avx'  && _avx="-DUSE_AVX:BOOL=ON"   ; } || _avx="-DUSE_AVX:BOOL=OFF"
        { printf "%s" "$_cpuflags" | grep -q 'avx2' && _avx2="-DUSE_AVX2:BOOL=ON" ; } || _avx2="-DUSE_AVX2:BOOL=OFF"
        
        _cpuopts="-DUSE_SSE:BOOL=ON ${_avx} ${_avx2}"
    else
        _cpuopts="-DUSE_SSE:BOOL=OFF -DUSE_AVX:BOOL=OFF -DUSE_AVX2:BOOL=OFF"
    fi
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_COLOR_MAKEFILE:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DUSE_TBB=ON \
        -DUSE_OMP:BOOL=OFF \
        $_cpuopts \
        -DUSE_DOUBLE:BOOL=ON \
        -DUSE_NNPACK:BOOL=OFF \
        -DUSE_OPENCL:BOOL=ON \
        -DUSE_LIBDNN:BOOL=OFF \
        -DUSE_SERIALIZER:BOOL=ON \
        -DBUILD_TESTS:BOOL=OFF \
        -DBUILD_EXAMPLES:BOOL=OFF \
        -DBUILD_DOCS:BOOL=OFF \
        -Wno-dev \
        .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
