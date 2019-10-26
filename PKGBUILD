# Author: mosra <mosra@centrum.cz>
pkgname=magnum-examples-git
pkgver=2019.10.r0.g4a83ecb
pkgrel=1
pkgdesc="Examples for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('custom:Public Domain')
depends=('magnum-git' 'magnum-plugins-git' 'magnum-integration-git' 'magnum-extras-git' 'box2d' 'bullet' 'openal')
makedepends=('cmake' 'git')
provides=('magnum-examples')
conflicts=('magnum-examples')
source=("git+git://github.com/mosra/magnum-examples.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_AREALIGHTS_EXAMPLE=ON \
        -DWITH_AUDIO_EXAMPLE=ON \
        -DWITH_BOX2D_EXAMPLE=ON \
        -DWITH_BULLET_EXAMPLE=ON \
        -DWITH_CUBEMAP_EXAMPLE=ON \
        -DWITH_IMGUI_EXAMPLE=OFF \
        -DWITH_MOTIONBLUR_EXAMPLE=ON \
        -DWITH_MOUSEINTERACTION_EXAMPLE=ON \
        -DWITH_PRIMITIVES_EXAMPLE=ON \
        -DWITH_PICKING_EXAMPLE=ON \
        -DWITH_SHADOWS_EXAMPLE=ON \
        -DWITH_TEXT_EXAMPLE=ON \
        -DWITH_TEXTUREDTRIANGLE_EXAMPLE=ON \
        -DWITH_TRIANGLE_EXAMPLE=ON \
        -DWITH_TRIANGLE_PLAIN_GLFW_EXAMPLE=OFF \
        -DWITH_TRIANGLE_VULKAN_EXAMPLE=ON \
        -DWITH_VIEWER_EXAMPLE=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    # Install the UNLICENSE because Arch has no pre-defined license for Public
    # Domain
    install -D -m644 "${srcdir}/${pkgname%-git}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
