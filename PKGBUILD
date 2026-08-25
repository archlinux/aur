# Maintainer: Kazoku <k4zoku@pm.me>

_pkgbase=dearsql
_vcpkg_commit=77df67cfff9c12ccfdb52284e07c87c75092f723
_mongo_patch_commit=bd93b56711a393a3c498991e023f94b7542832bb
pkgname=${_pkgbase}-git
pkgver=0.4.14.r0.g1bc158f
pkgrel=1
pkgdesc="Cross-platform SQL database client (git version)"
arch=('x86_64')
url="https://github.com/dunkbing/dearsql"
license=('FSL')
depends=('freetds' 'gtk4' 'libepoxy' 'libx11')
makedepends=(
    'autoconf'
    'autoconf-archive'
    'automake'
    'cmake'
    'curl'
    'git'
    'gnutls'
    'krb5'
    'libltdl'
    'libtirpc'
    'ninja'
    'pkgconf'
    'python'
)
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=('!lto' '!debug')
source=(
    "${_pkgbase}::git+${url}.git"
    "vcpkg-${_vcpkg_commit}.tar.gz::https://github.com/microsoft/vcpkg/archive/${_vcpkg_commit}.tar.gz"
    "mongo-cmake-4.4.patch::https://raw.githubusercontent.com/microsoft/vcpkg/${_mongo_patch_commit}/ports/mongo-c-driver/cmake-4.4.patch"
)
sha256sums=('SKIP'
            '0edebdc4f04b88ec608b1a35bff67132d4686e4059bb06a528c2664a5436937e'
            '138092b6f9a01ea46325fa55813350578719cf901c56e69166d7466ef2d03d84')

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${_pkgbase}" submodule update --init --recursive
    if [[ -d "vcpkg-${_vcpkg_commit}" ]]; then
        rm -rf vcpkg
        mv "vcpkg-${_vcpkg_commit}" vcpkg
    fi
    sed -i '/"builtin-baseline":/d' "${_pkgbase}/vcpkg.json"
    rm -rf vcpkg-overlay
    mkdir -p vcpkg-overlay/mongo-c-driver
    cp -a vcpkg/ports/mongo-c-driver/. vcpkg-overlay/mongo-c-driver/
    cp "$srcdir/mongo-cmake-4.4.patch" \
        vcpkg/ports/mongo-c-driver/
    cp "$srcdir/mongo-cmake-4.4.patch" \
        vcpkg-overlay/mongo-c-driver/
    sed -i \
        '/remove_abs_patch.cmake/a\        mongo-cmake-4.4.patch' \
        vcpkg-overlay/mongo-c-driver/portfile.cmake

    ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
}
build() {
    export VCPKG_ROOT="$srcdir/vcpkg"
    export VCPKG_BUILD_TYPE=release
    export VCPKG_DISABLE_METRICS=1
    export VCPKG_DOWNLOADS="$srcdir/vcpkg-downloads"
    export CFLAGS="${CFLAGS} -Wno-error=override-init"

    cmake -S "${srcdir}/${_pkgbase}" -B "${srcdir}/build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVCPKG_BUILD_TYPE=release \
        -DVCPKG_TARGET_TRIPLET=x64-linux \
        -DVCPKG_OVERLAY_PORTS="${srcdir}/vcpkg-overlay" \
        -DVCPKG_OVERLAY_TRIPLETS="${srcdir}/${_pkgbase}/cmake/triplets"
    cmake --build "${srcdir}/build" --target "${_pkgbase}"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build" --prefix /usr
    install -Dm644 "${srcdir}/${_pkgbase}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
