# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

desktop_arch=(i686 x86_64)
# Let me know what ARM architectures are compatible
mobile_arch=()

pkgname=mir
_actual_ver=0.9.0
_extra_ver=+15.04.20141125
pkgver=${_actual_ver}${_extra_ver}
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

source=("https://launchpad.net/ubuntu/+archive/primary/+files/mir_${_actual_ver}${_extra_ver}.orig.tar.gz"
        0001-Build-fixes.patch)
sha512sums=('9ffb51f2acc6749652b6e20631337e82b4a2fac653e7a83a652834550f8ad94552d1663df72c0fb4fbe032abe0cd72b8a44faedacc2587e566494f7a75b6e8e8'
            '46e2dad6390efeb96370b29be2a7ad85ff4234c0ca926337db25cbc2e0e0f395d8d656decd1d60289b321f2774b87e30095edb5d8ed35e45aa7b07187b35beb6')

prepare() {
    cd "mir-${_actual_ver}${_extra_ver}"

    patch -p1 -i ../0001-Build-fixes.patch
}

build() {
    cd "mir-${_actual_ver}${_extra_ver}"

    local params=(
        -DCMAKE_C_COMPILER=gcc
        -DCMAKE_CXX_COMPILER=g++
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
  make
}

package() {
    cd "mir-${_actual_ver}${_extra_ver}"
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
