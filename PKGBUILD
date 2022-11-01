# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.63
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader' 'bullet' 'physfs')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
source=("git+https://github.com/Try/OpenGothic#commit=15d89bca24c04bfdf287d9b5ec12a65c9cb69a49" #tag=v0.63
        "git+https://github.com/Try/Tempest.git#commit=827449a81776ecfc8e6b34314abf5d5eb9b5134b"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=d4ffcdc8a34d3f61f22e4b283b4c100f5adf4b82"
        "git+https://github.com/Try/ZenLib.git#commit=65b2c1f34e3d3dcd4dd6e6e1c9526996f76e0fe3"
        "bullet_dynamic.diff"
        "zenlib_dynamic_physfs.diff"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5aa822c283aefa0da9c75ae87e37ec66d50e71f65191187bb15e48a43fb6ea713278dd4a056e9ad04a25a622cdd85834ba5e2c4bf60bd178a46ce4eaba082981'
            '331db32a87762503d4b6abda25369497e8e8660ea381b4363a7a6fccda65d4b1595f83fb27e05f368a943b2b00968ecb5ae8f2323a40ac85f37d68ed4bb172d0')
options=('!emptydirs')

prepare() {
  cd "${srcdir}/ZenLib"
  patch -p1 -i "$srcdir/zenlib_dynamic_physfs.diff"

  cd "${srcdir}/OpenGothic"
  patch -p1 -i "$srcdir/bullet_dynamic.diff"
  rmdir lib/ZenLib
  ln -sf "$srcdir"/ZenLib/ lib/ZenLib
  
  rmdir lib/Tempest
  ln -sf "$srcdir"/Tempest lib/Tempest
  
  rmdir lib/TinySoundFont
  ln -sf "$srcdir"/TinySoundFont lib/TinySoundFont
}

build() {
  cd "OpenGothic"
  cmake -B build \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=None \
    -DOpenGL_GL_PREFERENCE='GLVND' \
    -DPHYSFS_BUILD_SHARED='OFF' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSPIRV_CROSS_STATIC=OFF \
    -DSPIRV_CROSS_SHARED=OFF \
    -DSPIRV_CROSS_CLI=OFF
  make -C build
}

package() {
  cd "OpenGothic"
  DESTDIR="${pkgdir}" make -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

