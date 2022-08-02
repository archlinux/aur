# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libsurvive
pkgver=1.0
pkgrel=2
pkgdesc='Tracking system for Lighthouse and Vive based devices'
arch=('x86_64')
url='https://github.com/cntools/libsurvive/'
license=('MIT')
depends=('cblas' 'cnmatrix-git' 'lapacke' 'libpcap' 'libusb' 'libx11' 'sciplot' 'zlib')
optdepends=('xr-hardware: for acessing additional devices')
makedepends=('git' 'cmake' 'eigen')
_data_commit=5cc2fc085d11ef98ad5936a745d4a42954b207ca
source=("git+https://github.com/cntools/libsurvive.git#tag=v${pkgver}"
        'git+https://github.com/cntools/cnkalman.git'
        'git+https://github.com/cntools/cnmatrix.git'
        "git+https://github.com/jdavidberger/libsurvive-extras-data.git#commit=${_data_commit}")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p build/src/test_cases
    ln -s ../../../libsurvive-extras-data build/src/test_cases/libsurvive-extras-data
    
    git -C libsurvive submodule init
    git -C libsurvive config --local submodule.libs/cnkalman.url "${srcdir}/cnkalman"
    git -C libsurvive submodule update
    git -C libsurvive/libs/cnkalman submodule init
    git -C libsurvive/libs/cnkalman config --local submodule.libs/cnmatrix.url "${srcdir}/cnmatrix"
    git -C libsurvive/libs/cnkalman submodule update
}

build() {
    # NOTE: tests fails to pass when using 'None' build type
    cmake -B build -S libsurvive \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTS:BOOL='ON' \
        -DENABLE_api_example:BOOL='OFF' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {    
    make -C build DESTDIR="$pkgdir" install
    mv "${pkgdir}/usr/bin"/{,survive-}sensors-readout
    rm -r "${pkgdir}/usr"/{include/{cnkalman,cnmatrix},lib/{lib{cnkalman,cnmatrix,mpfit}.a,pkgconfig/{cnkalman,cnmatrix}.pc}}
    install -D -m644 libsurvive/useful_files/81-vive.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D -m644 libsurvive/survive_autocomplete.sh "${pkgdir}/usr/share/bash-completion/completions/libsurvive"
    install -D -m644 libsurvive/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
