# Maintainer: Constantine Evans <const@costi.eu>
#
# Note: you probably want to install the binary version of NUPACK 4, not this source build.  See below for
# more details.
#
# NUPACK is available under a restricted license that is largely similar to the BSD 3-clause license, updated
# to address web applications, but with the notable exception that it allows for use and redistribution 
# "non-commercial academic purposes only".  Furthermore, access to the downloads requires requires a username
# and password that can be obtained through (free) registration, and sources and binary wheels are intentionally
# not in PyPI.  While the license appears to allow for redistribution, in the interest of following the authors' 
# wishes, this PKGBUILD does provide the source code automatically.
#
# To use this PKGBUILD, if you can agree to the non-commercial academic license, register for a username and 
# password at https://www.nupack.org/downloads, download the NUPACK 4 zip file there, and place the zip file 
# in the same directory as this PKGBUILD.
#
# Note that this PKGBUILD is for *source* installation, which may be significantly more complicated than simply
# installing a binary wheel, also available from the Nupack website.  The intention of this PKGBUILD is to attempt
# to make source installation work smoothly in Arch Linux, using Arch and AUR packages as much as possible, and
# allowing installation in circumstances (for example, more recent Python versions) where binary wheels may not
# be suitable.  The PKGBUILD makes certain changes to the build process:
#
# - The default build process uses a bundled vcpkg to build and install a number of external dependencies.  This
#   build process did not work on Arch the last time I tried it.  The PKGBUILD removes vcpkg from the build process
#   entirely, and instead uses Arch and AUR packages.  In many cases, this means that newer versions of those
#   dependencies are used than in the normal build process, which may cause breakages.
# - NUPACK 4 relies on an older version of TBB, and newer versions removed parts of the API it uses.  This PKGBUILD
#   thus requires an older version of TBB, which may cause problems for other packages on your system.
# - One error message in NUPACK 4 does not work well with newer versions of spdlog and fmt, and so is commented out.
# - SIMD support is currently disabled, as (a) libsimdpp is not currently in the AUR, and (b) when installed (I have
#   a PKGBUILD for it locally), NUPACK 4 has build errors wwhen NUPACK_SIMD=ON that I don't currently understand.

pkgname=nupack4
pkgver=4.0.0.28
pkgrel=1
pkgdesc="Software suite for the analysis and design of nucleic acid structures, devices, and systems."
url="https://nupack.org"
license=('Custom')

arch=('x86_64')

depends=(
    'armadillo'
    'tbb2019'
    'gecode'
    'nlohmann-json'
    'jsoncpp'
    'tclap'
    'spdlog'
    'boost'
    'boost-libs'
    'python'
    'python-scipy'
    'python-pandas'
)

DLAGENTS=("file::/usr/bin/echo ${BOLD}${RED} Unable to find %u, please read the PKGBUILD ${ALL_OFF}" $DLAGENTS[@])

source=("nupack-4.0.0.28.zip::file://nupack-4.0.0.28.zip" "disable-vcpkg.patch" "disable-broken-logger.patch")

sha256sums=('4b15e4773cbe9dd5bee6afaa1085170fc8e2cee9de711f8603d66575be83cbe1'
            'f9dac1f4a8cb26f3c11fa5cbf39de4feee34f5914023cc8c93950c88dca5f12b'
            '9dd038b73b9d34050b208a93b4521ee661e7f4d7ccd49ba4ae40ff85b8d441d2')

prepare() {
	cd "nupack-$pkgver"
    patch --forward --strip=1 --input=../disable-vcpkg.patch
    patch --forward --strip=1 --input=../disable-broken-logger.patch
}

build() {
    cmake -B build -S "nupack-${pkgver}/source" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DNUPACK_SIMD=OFF \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -Wno-dev
    cmake --build build --target nupack-python
}

# check() {
# 	cd "$pkgname-$pkgver/source"
# 	make -k check
# }

package() {
    cd "build"
    python setup.py install --root="$pkgdir" --optimize=1
    cd ..
    install -Dm644 "nupack-${pkgver}/source/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
