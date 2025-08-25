# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>
# Contributor: Firepal <firepal@cyberdude.com>

pkgname=wivrn-multilib-git
pkgver=25.8.62.g8f8e583
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets. (32-bit support)"
arch=('x86_64')
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
makedepends=('cmake' 'git' 'gcc-multilib' 'ninja' 'pkgconf')
provides=('wivrn-server')
conflicts=('wivrn-server')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/WiVRn"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/WiVRn"

    # 64-bit build with server
    cmake -B build64 -S . \
        -DWIVRN_BUILD_CLIENT=OFF \
        -DWIVRN_BUILD_SERVER=ON \
        -DWIVRN_OPENXR_MANIFEST_TYPE=filename \
        -DWIVRN_USE_PIPEWIRE=ON \
        -DWIVRN_USE_NVENC=ON \
        -DWIVRN_USE_VAAPI=ON \
        -DWIVRN_USE_VULKAN_ENCODE=ON \
        -DWIVRN_USE_X264=ON \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -G Ninja
    cmake --build build64

    # 32-bit build
    export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
    export CFLAGS="-m32 ${CFLAGS}"
    export CXXFLAGS="-m32 ${CXXFLAGS}"
    export LDFLAGS="-m32 ${LDFLAGS}"
    cmake -B build32 -S . \
        -DWIVRN_BUILD_CLIENT=OFF \
        -DWIVRN_BUILD_SERVER=OFF \
        -DWIVRN_BUILD_SERVER_LIBRARY=ON \
        -DWIVRN_OPENXR_MANIFEST_TYPE=filename \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DVulkan_LIBRARY=/usr/lib32/libvulkan.so \
        -DVulkan_INCLUDE_DIR=/usr/include \
        -G Ninja
    cmake --build build32
}

package() {
    echo "Installing 32-bit libraries"
    DESTDIR="$pkgdir" cmake --install WiVRn/build32
    echo "Moving 32-bit libraries from /usr/lib to /usr/lib32"
    mkdir -p "$pkgdir/usr/lib32"
    mv "$pkgdir/usr/lib/wivrn" "$pkgdir/usr/lib32/wivrn"

    echo "Installing 64-bit libraries and server"
    DESTDIR="$pkgdir" cmake --install WiVRn/build64

    echo "Adding ld.so.conf entry"
    # ld.so.conf file
    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/wivrn.conf" <<EOF
/usr/lib/wivrn
/usr/lib32/wivrn
EOF
}
