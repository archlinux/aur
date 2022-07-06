# Author: mosra <mosra@centrum.cz>
pkgname=magnum-examples-git
pkgver=2020.06.r155.g7710aec6
pkgrel=1
pkgdesc="Examples for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('custom:Public Domain')
depends=('magnum-git' 'magnum-plugins-git' 'magnum-integration-git' 'magnum-extras-git' 'box2d' 'bullet' 'openal')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-examples')
conflicts=('magnum-examples')
source=("git+https://github.com/mosra/magnum-examples.git")
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
        -DMAGNUM_WITH_ANIMATED_GIF_EXAMPLE=ON \
        -DMAGNUM_WITH_ARCBALL_EXAMPLE=ON \
        -DMAGNUM_WITH_AREALIGHTS_EXAMPLE=ON \
        -DMAGNUM_WITH_AUDIO_EXAMPLE=ON \
        -DMAGNUM_WITH_BOX2D_EXAMPLE=ON \
        -DMAGNUM_WITH_BULLET_EXAMPLE=ON \
        -DMAGNUM_WITH_CUBEMAP_EXAMPLE=ON \
        -DMAGNUM_WITH_DART_EXAMPLE=OFF \
        -DMAGNUM_WITH_FLUIDSIMULATION2D_EXAMPLE=ON \
        -DMAGNUM_WITH_FLUIDSIMULATION3D_EXAMPLE=ON \
        -DMAGNUM_WITH_IMGUI_EXAMPLE=ON \
        -DMAGNUM_WITH_MOTIONBLUR_EXAMPLE=ON \
        -DMAGNUM_WITH_MOUSEINTERACTION_EXAMPLE=ON \
        -DMAGNUM_WITH_OCTREE_EXAMPLE=ON \
        -DMAGNUM_WITH_PICKING_EXAMPLE=ON \
        -DMAGNUM_WITH_PRIMITIVES_EXAMPLE=ON \
        -DMAGNUM_WITH_RAYTRACING_EXAMPLE=ON \
        -DMAGNUM_WITH_SHADOWS_EXAMPLE=ON \
        -DMAGNUM_WITH_TEXT_EXAMPLE=ON \
        -DMAGNUM_WITH_TEXTUREDQUAD_EXAMPLE=ON \
        -DMAGNUM_WITH_TRIANGLE_EXAMPLE=ON \
        -DMAGNUM_WITH_TRIANGLE_PLAIN_GLFW_EXAMPLE=ON \
        -DMAGNUM_WITH_TRIANGLE_SOKOL_EXAMPLE=OFF \
        -DMAGNUM_WITH_TRIANGLE_VULKAN_EXAMPLE=ON \
        -DMAGNUM_WITH_VIEWER_EXAMPLE=ON \
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
