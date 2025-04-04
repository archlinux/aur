# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libsurvive
pkgver=1.0
pkgrel=5
_data_commit=5cc2fc085d11ef98ad5936a745d4a42954b207ca
pkgdesc='Tracking system for Lighthouse and Vive based devices'
arch=('x86_64')
url='https://github.com/cntools/libsurvive/'
license=('MIT')
depends=('cblas' 'glibc' 'lapacke' 'libpcap' 'libusb' 'zlib')
optdepends=('xr-hardware: for acessing additional devices')
makedepends=('git' 'cmake' 'eigen')
source=("git+https://github.com/cntools/libsurvive.git#tag=v${pkgver}"
        'git+https://github.com/cntools/cnkalman.git'
        'git+https://github.com/cntools/cnmatrix.git'
        "git+https://github.com/jdavidberger/libsurvive-extras-data.git#commit=${_data_commit}"
        'git+https://github.com/sciplot/sciplot.git#tag=v0.2.2'
        'git+https://github.com/allanleal/doxystrap.git'
        'git+https://github.com/sciplot/gnuplot-palettes.git')
sha256sums=('0ecd62a21fb01a264e4c04ad3ec1ae61f5dc5edba8a9cac9aa9c858c2e09f995'
            'SKIP'
            'SKIP'
            'd61277d7fe4c7e0d0a04cd48ce98a205b33a7ecbf19a032861c444b87075bba7'
            '76b70caa0ca7ffcef97338b6bab0ef3269566360f6fa9f0169450b889a07af26'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p build-libsurvive/src/test_cases
    ln -s ../../../libsurvive-extras-data build-libsurvive/src/test_cases/libsurvive-extras-data
    
    # libsurvive git submodules
    git -C libsurvive submodule init
    git -C libsurvive config --local submodule.libs/cnkalman.url "${srcdir}/cnkalman"
    git -C libsurvive -c protocol.file.allow='always' submodule update
    
    # cnkalman git submodules
    git -C libsurvive/libs/cnkalman submodule init
    git -C libsurvive/libs/cnkalman config --local submodule.libs/cnmatrix.url "${srcdir}/cnmatrix"
    git -C libsurvive/libs/cnkalman -c protocol.file.allow='always' submodule update
    
    # sciplot git submodules
    git -C sciplot submodule init
    git -C sciplot config --local submodule.deps/doxystrap.url "${srcdir}/doxystrap"
    git -C sciplot config --local submodule.deps/gnuplot-palettes.url "${srcdir}/gnuplot-palettes"
    git -C sciplot -c protocol.file.allow='always' submodule update
}

build() {
    # sciplot (currently needs version 0.2)
    cmake -B build-sciplot -S sciplot \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH="${srcdir}/install-sciplot" \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING="3.5.0" \
        -DSCIPLOT_BUILD_DOCS:BOOL='OFF' \
        -DSCIPLOT_BUILD_EXAMPLES:BOOL='OFF' \
        -DSCIPLOT_BUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build-sciplot --target install
    
    # libsurvive
    # NOTE: tests fails to pass when using 'None' build type
    export sciplot_DIR="${srcdir}/install-sciplot"
    export CXXFLAGS+=" -isystem${srcdir}/install-sciplot/include"
    cmake -B build-libsurvive -S libsurvive \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTS:BOOL='ON' \
        -DENABLE_api_example:BOOL='OFF' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build-libsurvive
}

check() {
    ctest --test-dir build-libsurvive --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build-libsurvive
    mv "${pkgdir}/usr/bin"/{,survive-}sensors-readout
    rm -r "${pkgdir}/usr"/{include/{cnkalman,cnmatrix},lib/{lib{cnkalman,cnmatrix,mpfit}.a,pkgconfig/{cnkalman,cnmatrix}.pc}}
    install -D -m644 libsurvive/useful_files/81-vive.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D -m644 libsurvive/survive_autocomplete.sh "${pkgdir}/usr/share/bash-completion/completions/libsurvive"
    install -D -m644 libsurvive/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
