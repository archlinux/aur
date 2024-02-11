pkgname=awlib-git
pkgver=r2249.4d488895
pkgrel=1
pkgdesc="C++ helper library"
arch=('i686' 'x86_64')
depends=('glfw')
makedepends=('git' 'cmake' 'gcc')
url="https://git.absurdworlds.org/awlib.git"
license=('LGPLv3')
source=('git+https://github.com/absurdworlds/awlib.git')
provides=('awlib')
conflicts=('awlib')
sha256sums=('SKIP')
options+=('!strip' 'debug')

pkgver() {
  cd ${pkgname%-git}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#prepare() {
# cd "${srcdir}"/${pkgname%-git}
# cp Config.mk{.in,}
#}

build() {
 cmake -B build -S "${srcdir}/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DAW_ENABLE_GRAPHICS:BOOL=ON \
        -DAW_SPLIT_INCLUDES:BOOL=OFF \
        -DAW_INCLUDE_PREFIX:STRING="" \
        -Wno-dev
 cmake --build build
}

check() {
 ctest --test-dir build --output-on-failure
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
