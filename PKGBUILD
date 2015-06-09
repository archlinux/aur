# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

desktop_arch=(i686 x86_64)
# Let me know what ARM architectures are compatible
mobile_arch=()

pkgname=mir-bzr
pkgver=2189
pkgrel=1
pkgdesc="Ubuntu's new display server"
arch=(${desktop_arch[@]} ${mobile_arch[@]})
url="https://launchpad.net/mir"
# Server is GPL, client is LGPL, various other files are BSD and Apache
license=(GPL LGPL BSD Apache)

depends=(boost gflags google-glog liburcu lttng-ust libxkbcommon protobuf)
# At the moment, Mir does require Mesa's libGL
depends+=(glm mesa-libgl mesa)

if in_array "${CARCH}" "${desktop_arch[@]}"; then
    depends+=(libdrm)
elif in_array "${CARCH}" "${desktop_arch[@]}"; then
    # Currently unpackaged. Presumably, Ubuntu's fork will need to be used
    depends+=(libhybris)
fi

makedepends=(cmake30 doxygen graphviz libxslt umockdev)
makedepends+=(mir)

source=(mir::bzr+https://code.launchpad.net/~mir-team/mir/development-branch
        0001-Build-fixes.patch)
sha512sums=('SKIP'
            '3ab08f33eaebf324e718f0caa803b7317b42cb7de0acf1178e7e657b25252ea190283d1028779a8785fb276e60dc2459b72c9d6878ca41b8cd16ae01b97b1b26')

pkgver() {
    cd mir
    bzr revno
}

prepare() {
    cd mir

    patch -t -p1 -i ../0001-Build-fixes.patch

    sed -i 's/-Werror//g' CMakeLists.txt
}

build() {
    cd mir

    local params=(
        -DCMAKE_C_COMPILER=/usr/bin/gcc
        -DCMAKE_CXX_COMPILER=/usr/bin/g++
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
        -DCMAKE_BUILD_TYPE=Release
        -DMIR_ENABLE_TESTS=NO
        `# doxygen crashes # -DBUILD_DOXYGEN=YES`)
  
    if in_array "${CARCH}" "${desktop_arch[@]}"; then
        params+=(
            -DMIR_PLATFORM=mesa
        )
    elif in_array "${CARCH}" "${mobile_arch[@]}"; then
        params+=(
            -DMIR_RUN_ACCEPTANCE_TESTS=OFF
            -DMIR_RUN_INTEGRATION_TESTS=OFF
            -DMIR_PLATFORM='android;mesa'
        )
    fi

  cmake-3.0 . "${params[@]}"
  make -j1
}

package() {
    cd mir
    make DESTDIR="${pkgdir}/" install

    # Install examples
    install -dm755 "${pkgdir}"/usr/share/doc/mir/examples/
    install -m644 examples/basic.c            \
                  examples/flicker.c          \
                  examples/graphics.h         \
                  examples/graphics_utils.cpp \
                  examples/mir_image.h        \
                  examples/scroll.cpp         \
                  examples/README             \
                  "${pkgdir}"/usr/share/doc/mir/examples/

    platform_types=(platform4driver client8driver)
    platforms=(mesa android)

    install -dm755 "${pkgdir}"/etc/ld.so.conf.d/

    for i in "${platform_types[@]}"; do
        for j in "${platforms[@]}"; do
            dir="/usr/lib/mir/${i}/${j}"
            if [[ -d "${pkgdir}${dir}" ]]; then
                echo "${dir}" >> "${pkgdir}"/etc/ld.so.conf.d/mir.conf
            fi
        done
    done
}
