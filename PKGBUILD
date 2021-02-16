# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libsurvive
pkgver=0.3
pkgrel=1
pkgdesc='Tracking system for Lighthouse and Vive based devices'
arch=('x86_64')
url='https://github.com/cntools/libsurvive/'
license=('MIT')
depends=('cblas' 'lapacke' 'libpcap' 'libusb' 'libx11' 'zlib')
optdepends=('xr-hardware: for acessing additional devices')
makedepends=('git' 'cmake')
_data_commit=ada091a19a90742fc0042d5b094e2aee76ed12d0
source=("https://github.com/cntools/libsurvive/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/jdavidberger/libsurvive-extras-data.git#commit=${_data_commit}"
        '010-libsurvive-cmake-fixes.patch')
sha256sums=('ed32911962f93f70a15980f5e9b57174af1b9e6d230102faf1acf97411380d56'
            'SKIP'
            '1d2e8f0cb26619af8aed59498f942070fa33ec9afa19bfde7d6beb157df83344')

prepare() {
    mkdir -p build/src/test_cases
    ln -s ../../../libsurvive-extras-data build/src/test_cases/libsurvive-extras-data
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-libsurvive-cmake-fixes.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
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
    rm "${pkgdir}/usr/lib"/lib{minimal_opencv,mpfit}.a
    install -D -m644 "${pkgname}-${pkgver}/useful_files/81-vive.rules" -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D -m644 "${pkgname}-${pkgver}/survive_autocomplete.sh" "${pkgdir}/usr/share/bash-completion/completions/libsurvive"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
