# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=tiny-dnn-git
pkgver=1.0.0a3.r73.gb89239c
pkgrel=1
pkgdesc="A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices"
arch=('any')
url="https://github.com/tiny-dnn/tiny-dnn"
license=('BSD')
makedepends=('git' 'cmake' 'protobuf' 'intel-tbb' 'opencl-icd-loader' 'opencl-headers')
provides=('tiny-dnn')
conflicts=('tiny-dnn')
source=("${pkgname}"::"git+https://github.com/tiny-dnn/tiny-dnn.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}"
    
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
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
