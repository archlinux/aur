# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

_ver="v20.02"
_fragment="#tag=$_ver"

pkgname=usd
pkgver=20.02.r0.gbe1a80f8c
pkgrel=1
pkgdesc="3D VFX pipeline interchange file format."
arch=('x86_64')
url="https://www.openusd.org"
license=('Apache')
eval depends=('boost-libs' 'glew' 'openexr' 'opensubdiv' 'pyside2' "python2{,-opengl}")
eval makedepends=('boost' 'cmake' 'git' 'intel-tbb' 'ninja' "python2-{jinja,pyside-tools}")
provides=("usd=${pkgver}")
source=("git+https://github.com/PixarAnimationStudios/USD.git${_fragment}"
        "boost_python2.patch")
sha256sums=('SKIP'
            '7aac699cf4bca264d1cd15ed4b02c327783ac83b5cbea9bf4606e2877fa5081c')

prepare() {
  git -C USD apply -v ${srcdir}/boost_python2.patch
}

#pkgver() {
#  git -C USD describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
  _CMAKE_FLAGS+=(
    -DPXR_BUILD_TESTS=OFF
                )
  cmake -S USD -B build -G Ninja "${_CMAKE_FLAGS[@]}"
  ninja -C build $([ -v MAKEFLAGS ] || echo -j1)
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
