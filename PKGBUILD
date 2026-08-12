pkgname=awlib
pkgver=2026.08.07.r47.g48dc12b2
pkgrel=1
pkgdesc="C++ helper library"
arch=('i686' 'x86_64')
depends=('glfw' 'libpng')
makedepends=('git' 'cmake' 'gcc')
url="https://git.absurdworlds.org/awlib.git"
license=('LGPLv3')
source=('git+https://github.com/absurdworlds/awlib.git')
sha256sums=('SKIP')
options+=('!strip' 'debug')

pkgver() {
  cd ${pkgname}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#prepare() {
# cd "${srcdir}"/${pkgname}
# cp Config.mk{.in,}
#}

build() {
 cmake -B build -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DAW_ENABLE_GRAPHICS:BOOL=ON \
        -DAW_ENABLE_IMAGE:BOOL=ON \
        -DAW_ENABLE_MESH:BOOL=ON \
        -DAW_ENABLE_HUDF:BOOL=ON \
        -DAW_SPLIT_INCLUDES:BOOL=OFF \
        -DAW_INCLUDE_PREFIX:STRING="" \
        -Wno-author
 cmake --build build
}

check() {
 ctest --test-dir build --output-on-failure
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
