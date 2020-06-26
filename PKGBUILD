# Author: mosra <mosra@centrum.cz>
pkgname=magnum-examples-git
pkgver=2019.10.r171.g0b8cf1d
pkgrel=1
pkgdesc="Examples for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('custom:Public Domain')
depends=('magnum-git' 'magnum-plugins-git' 'magnum-integration-git' 'magnum-extras-git' 'box2d' 'bullet' 'openal')
makedepends=('cmake' 'git' 'ninja')
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
        -DWITH_ANIMATED_GIF_EXAMPLE=ON \
        -DWITH_ARCBALL_EXAMPLE=ON \
        -DWITH_AREALIGHTS_EXAMPLE=ON \
        -DWITH_AUDIO_EXAMPLE=ON \
        -DWITH_BOX2D_EXAMPLE=ON \
        -DWITH_BULLET_EXAMPLE=ON \
        -DWITH_CUBEMAP_EXAMPLE=ON \
        -DWITH_DART_EXAMPLE=OFF \
        -DWITH_FLUIDSIMULATION2D_EXAMPLE=ON \
        -DWITH_FLUIDSIMULATION3D_EXAMPLE=ON \
        -DWITH_IMGUI_EXAMPLE=ON \
        -DWITH_MOTIONBLUR_EXAMPLE=ON \
        -DWITH_MOUSEINTERACTION_EXAMPLE=ON \
        -DWITH_OCTREE_EXAMPLE=ON \
        -DWITH_PRIMITIVES_EXAMPLE=ON \
        -DWITH_PICKING_EXAMPLE=ON \
        -DWITH_RAYTRACING_EXAMPLE=ON \
        -DWITH_SHADOWS_EXAMPLE=ON \
        -DWITH_TEXT_EXAMPLE=ON \
        -DWITH_TEXTUREDTRIANGLE_EXAMPLE=ON \
        -DWITH_TRIANGLE_EXAMPLE=ON \
        -DWITH_TRIANGLE_PLAIN_GLFW_EXAMPLE=ON \
        -DWITH_TRIANGLE_SOKOL_EXAMPLE=ON \
        -DWITH_TRIANGLE_VULKAN_EXAMPLE=ON \
        -DWITH_VIEWER_EXAMPLE=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install

    # Install the UNLICENSE because Arch has no pre-defined license for Public
    # Domain
    install -D -m644 "${srcdir}/${pkgname%-git}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
