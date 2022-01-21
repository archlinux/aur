# Maintainer: Arthur LAURENT <arthur.laurent4@gmail.com>
pkgname='shaderwriter-git'
pkgver=v1.0.0.r101.g9e74882
pkgrel=1
pkgdesc='Library used to write shaders from C++, and export them in either GLSL, HLSL or SPIR-V.'

arch=('any')
url="https://github.com/DragonJoker/ShaderWriter.git"
license=('MIT')

provides=('shaderwriter')
makedepends=('cmake' 'git')
conflicts=('shaderwriter-stable')

source=('git+https://github.com/DragonJoker/ShaderWriter.git')
sha256sums=('SKIP')

pkgver() {
  cd 'ShaderWriter' 
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd 'ShaderWriter'
    git submodule update --init
}

build() {
    cd 'ShaderWriter'
    cmake . \
	    -DCMAKE_BUILD_TYPE=Release \
	    -DPROJECTS_USE_PRECOMPILED_HEADERS=OFF \
	    -DSDW_BUILD_EXPORTER_HLSL=OFF \
	    -DSDW_BUILD_GLSL=ON \
	    -DSDW_BUILD_EXPORTER_SPIRV=ON \
	    -DSDW_BUILD_STATIC_EXPORTERS=OFF \
	    -DSDW_BUILD_STATIC_SDW=OFF \
	    -DSDW_GENERATE_SOURCE=OFF \
	    -DSDW_BUILD_VULKAN_LAYER=OFF \
	    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
    cmake --build .
}

package() {
    cd 'ShaderWriter'
    cmake --build . --target install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/shaderwriter/LICENSE"
}
