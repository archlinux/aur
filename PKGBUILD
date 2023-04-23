# Maintainer : doragasu <doragasu at hotmail dot com>
# Original submitter: speps <speps at aur dot archlinux dot org>

_pkg=p7zip
_commit=53abfeb6f1919fce3e65f21e37340153d2e4fe10
_ver=17.04
pkgname=lib7zip
pkgver=3.0.0_${_ver}
pkgrel=3
pkgdesc="A library using 7z.dll/7z.so(from 7-Zip) to handle different archive types."
arch=(i686 x86_64)
url="https://github.com/stonewell/lib7zip"
license=('MPL')
makedepends=('cmake' 'libtool')
options=('!libtool')
source=("git+https://github.com/stonewell/${pkgname}.git"
        "https://github.com/p7zip-project/${_pkg}/archive/refs/tags/v${_ver}.tar.gz"
        "fix_build_errs.patch")
sha256sums=('SKIP'
            'ea029a2e21d2d6ad0a156f6679bd66836204aa78148a4c5e498fe682e77127ef'
            '4c3f39beea4142283d76c2652d01ceaa647717d72359f75b9e7164082ba3a12d')

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout ${_commit}
    patch -p1 < ../fix_build_errs.patch

    # point to p7zip source
    export P7ZIP_SOURCE_DIR="${srcdir}/${_pkg}-${_ver}"

    cmake -DBUILD_SHARED_LIB=ON \
	    -DP7ZIP_SOURCE_DIR=${P7ZIP_SOURCE_DIR} \
	    -DCMAKE_BUILD_TYPE=RELEASE
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}/src"

    # Provided CMakeLists does not install files, so install manually
    install -Dm755 ${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so
    install -Dm644 ${pkgname}.h ${pkgdir}/usr/include/${pkgname}.h
}
