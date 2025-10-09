pkgname=intel-ipu7-camera-hal-git
_pkgname=ipu7-camera-hal
pkgver=r48.feed915
pkgrel=1
pkgdesc="Intel IPU7 camera HAL"
arch=('x86_64')
url="https://github.com/intel/ipu7-camera-hal"
license=('unknown')
depends=('intel-ipu7-dkms-git' 'intel-ipu7-camera-bin')
makedepends=('git' 'cmake' 'jsoncpp')
provides=(ipu7-camera-hal)
source=("git+${url}.git" "patch-cmake35-xedrm.diff")
sha256sums=('SKIP'
            '53db02482c9680d2678c9019a29bb1a348546e1d6b130f7533ea3f3c20538988')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 <"${srcdir}/patch-cmake35-xedrm.diff"

    mkdir -p "$srcdir/$_pkgname/include/drm/"
    cp "/usr/lib/modules/$(uname -r)/build/include/uapi/drm/xe_drm.h" "$srcdir/$_pkgname/include/drm/"
}

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname" || return 1

    cmake -B "./build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_CAMHAL_ADAPTOR=ON \
        -DBUILD_CAMHAL_PLUGIN=ON \
        -DIPU_VERSIONS="ipu7x;ipu75xa" \
        -DUSE_STATIC_GRAPH=ON \
        -DUSE_STATIC_GRAPH_AUTOGEN=ON
    cd ./build || return 1

    make -j"$(nproc)"
}

package() {
    cd "$srcdir/$_pkgname/build" || return 1
    # DESTDIR="$pkgdir" cmake --install build
    make install DESTDIR="$pkgdir"
}
