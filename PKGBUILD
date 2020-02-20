# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

_ver="v19.11" #switch to last blender supported version, latest is "v20.02"
_fragment="#tag=$_ver"

pkgname=usd
pkgver=${_ver#v}
pkgrel=1
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://www.openusd.org"
license=('Apache')
eval depends=('boost-libs' 'glew' 'openexr' 'opensubdiv' 'pyside2' "python2{,-opengl}")
eval makedepends=('boost' 'cmake' 'git' 'intel-tbb' 'ninja' "python2-{jinja,pyside-tools}")
provides=("usd=${pkgver}")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        "boost_python2.patch"
        "blender.patch")
sha256sums=('SKIP'
            '92ff2922bf2a615e3279f1fb834dd1f0a356f843ce511efbeaf9797578409d49'
            'a4b92e59eb6330109f65d1b168ad0c4b1292c5317f579dcbf0594df22ffbc587')

prepare() {
  git -C USD apply -v ${srcdir}/{boost_python2,blender}.patch
}

#pkgver() {
#  git -C USD describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  _CMAKE_FLAGS+=(
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
    -DPXR_BUILD_TESTS:BOOL=OFF
#   -DPXR_ENABLE_PYTHON_SUPPORT:BOOL=OFF
    -DPXR_BUILD_MONOLITHIC:BOOL=ON          # Required by blender-2.83
    -DPXR_PYTHON_SHEBANG:STRING="/usr/bin/python2"
                )
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"
  ninja -C build $([ -v MAKEFLAGS ] || echo -j1)
}

#check() {
#  ninja -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
