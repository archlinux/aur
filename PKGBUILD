# Maintainer: Yonggang Li <gnaggnoyil@gmail.com>

pkgname=azure-storage-cpp
pkgdesc='Microsoft Azure Storage Client Library for C++'
pkgver=7.5.0
# A rebuild is needed each time boost has its version updated.
# Note: cpprestsdk itself doesn't link with and boost library files. But
# azure-storeage-cpp will.
pkgrel=5
arch=('x86_64')
url='https://github.com/Azure/azure-storage-cpp'
license=('APACHE')
depends=(
    #'pkgconf'
    'libxml2'
    #'util-linux-libs'
    'util-linux' # Depending on uuid on Ubuntu means depending on util-linux on Archlinux
    #'boost-libs'
    'boost'
    'cpprestsdk'
    # 'openssl' is already a dependency of aur/cpprestsdk
    # 'xz' is already a dependency of zstd -> boost-libs and libxml2. Still no idea why liblzma.so
    # got linked to libazurestorage.so
    # 'icu' is already a dependency of libxml2. Still no idea why libicudata.so ,libicui18n.so and
    # libicuuc.so got linked to libazurestorage.so
)
# Testing requires some actual azure storage account information so it cannot be run when making
# a package.
#checkdepends=(
#    'unittestpp'
#)
makedepends=(
    'cmake'
)
# We need to find a proper way of generating debug info before we allow this
# option. By far we are not sure how debug option affects the packaging process
# since we only know they'll add `DEBUG_XXXFLAGS` environment variable. `zstd`
# doesn't seems to contain anything unexpected though. Is is possible that the
# created debug package are collected from the original "packaging XXX" process?
# Header only libraries in this repo such as `thrust-rapidsai` and `rmm` will
# not do a debug packaging. Not sure if it means something.
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Azure/azure-storage-cpp/archive/v${pkgver}.tar.gz")
sha256sums=('446a821d115949f6511b7eb01e6a0e4f014b17bfeba0f3dc33a51750a9d5eca5')

build() {
    _cmake_args=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        #-DBUILD_TESTS=OFF \ # Default is OFF
    )

    cd "${srcdir}"
    mkdir -p build
    cd build

    cmake ${_cmake_args[@]} "${srcdir}/${pkgname}-${pkgver}/Microsoft.WindowsAzure.Storage"
    cmake --build . --config Release
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" make install

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
