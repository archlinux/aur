# Maintainer: Popolon <Popolon aL popolon.org>

pkgname=erhe-git
_pkgname=erhe
pkgver=r1.90cbe1b
pkgrel=1
pkgdesc="C++ library for modern OpenGL experiments"
url="https://github.com/tksuoran/erhe"
arch=('x86_64' 'aarch64' 'riscv32' 'riscv64' 'i386' 'i686' 'armv7h' 'armv6h' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
license=('MIT')
depends=('libpng' 'libjpeg' 'libwebp' 'libx11' 'libxrandr' 'libxi' 'libxinerama' 'libxcursor' 'mesa' 'wayland' 'wayland-protocols'
        'python' 'sdl' 'plutosvg' 'pipewire' 'jack' 'freetype2' 'openvr') # webgpu doesn"t work with it either: 'wgpu-native-git')
makedepends=('ninja' 'cmake' 'simdjson' 'glm' 'vulkan-headers')
source=("${_pkgname}::git+https://github.com//tksuoran/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}/"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  case "$CARCH" in
    x86_64)
      ;;
    aarch64)
      ARCHOPTS="\
        -DSDL_AVX=ON \
        -DSDL_AVX2=ON \
        -DSDL_ROCKCHIP=ON \
	-DSDL_OPENGL=ON \
      "
      ;;
    riscv64)
      ARCHOPTS="\
        -DSDL_VIVANTE=ON \
      "
      ;;
  esac
    
    cmake -S . -B build ${ARCHOPTS} \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DSDL_EXAMPLES=ON \
     -DSDL_JACK_SHARED=ON \
     -DSDL_KMSDRM_SHARED=ON \
     -DSDL_LIBICONV=ON \
     -DSDL_OPENGLES=ON \
     -DSDL_OPENVR=ON \
     -DSDL_PIPEWIRE_SHARED=ON \
     -DSDL_RENDER=ON \
     -DSDL_RENDER_GPU=ON \
     -DSDL_RENDER_VULKAN=ON \
     -DSDL_WASAPI=ON \
     -DSDL_XINPUT=ON
}

build() {
    cd ${_pkgname}
    cmake --build build/
}

package() {
    cd ${_pkgname}
    #install already existing libs
    #DESTDIR="$pkgdir" cmake --install build
    install -D655 build/src/editor/editor ${pkgdir}/usr/bin/erhe-editor
    install -D655 build/src/editor/net-test ${pkgdir}/usr/bin/erhe-net-test
}
