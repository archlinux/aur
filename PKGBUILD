#!/hit/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

#_fragment="#branch=2.0.5-beta-maintenance"

pkgname=appleseed-git
pkgver=2.1.0.beta.r283.g8c894f29d
pkgrel=5
epoch=1
pkgdesc="Physically-based global illumination rendering engine primarily designed for animation and visual effects (development vesion)."
arch=(i686 x86_64)
url="https://appleseedhq.net"
license=('MIT')
provides=('appleseed')
conflicts=('appleseed')
depends=(python2 python embree qt5-base boost{,-python2}-libs openexr opencolorio1 openimageio openshadinglanguage xerces-c zlib)
makedepends=(boost{,-python2} cmake git ninja)
options=()
source=("${pkgname}::git+https://github.com/appleseedhq/appleseed.git${_fragment}"
        "boost_107400.patch"
        "cmake.extra.install.dirs.remove.patch"
        osl_1.11.8.patch::"https://github.com/appleseedhq/appleseed/pull/2900.patch"
        "oiio_cxx_std_14.patch"
        "openexr3.patch"
        "opencolorio1.patch"
        "openimageio.patch"
        "appleseed.studio_wrap"
        "appleseed.cli_wrap"
        )
sha256sums=('SKIP'
            '8e7d453ced2a58b162b6e8e2ace09916755b70821837b2c7502a3417f03a25a3'
            '87b987f006e45d11cc4dfec2bd37fd2b760fd2bdbf06f48e7d467cbca9b2b301'
            '0171eaa9ec499ecf74ac8878dbacfb28f81094e9a7bed46819314613e6ae7133'
            '194902d8c32f23155dddd4205ce3744852e0b86fc22e74739ce5ab7bf97924a7'
            'b6ed6ca0034a2ec81ecf8f44e11dba7b3469130a3106fcca58318174003e2642'
            '881b53983e24ade13480d2be2cfe10990890286cd9910c14e83284da427a1713'
            'e0c1730745e756a85d633ab1dd50c39b1f744b173b50ca38595d4ee9325b5670'
            '8f6f7dfc816b10079692f27e717a80c05c7fe94ad6149a3d78859fefe808996f'
            '6f80a201373610facce02b0bd6764af2c1730d6f39932117767e3dcfa7b72804')
b2sums=('SKIP'
        '8461888dc541113700f377379b0e688bdbc6a5b79bfda4c1b061c2e3811a03c43583272862d6b084f092c6bb372c15b31d2a25849b9e2d89d1e3ed657f680846'
        '85d278ea12672e44657fbfe8695744508db88cea54dbc93410632b05175c94a5e29e28dfb739ba88ec10a2449ff499484854ba177db03f5e41b24d2b8e6b9328'
        'cc21c08931d4e5060bbf9b8d2732e68eb28edc923e952db09665e2f63a0918e24f6d35f39a2ea2048a6b5ad67833df08bc9a5e1fea065e1df975ca5e40d414f0'
        'e999b4aaf4efcb3671de7f197d9ab92fd90cee34aaf879d30f959c88cea55416b0715ce85ce0452203484e4b336aed453ecff9166e12b9da9170101a3118138c'
        '9499c09e99fba96958861f1da7833728850c5581cf371a8f6994012288445d8fd24ec3cfe4f9e22a5860c930d91e710ffed9b33ba3cf2d8385ffa1cda4909528'
        '6a92e81297d3bdc8c8b77034d9dac1864dd59b106503b6c711fbdd04122ef8374b908054844ec2999ba6a845363afebf566b2769cf306843c8bc017453e54de1'
        '316300d0540c16c3bcaf1ea37ee470957c35ff995129dafc28249db4526f07a22b67058fd4abbc685691604716048fef039661ba06f5515fff858f7c16d2906e'
        'b87bd4812393340507c642470084764d770a593cb868538cb8580710dc4d1ae7708db6749a7034afcbd2b78af8498264299e1352df695b47b31277711ca66c87'
        '47a3ff0cee076be409111f860b93ac638999da5ed7e6cda1ca7dfdb3efa34d92b7720612855471939c742be69c5a6c413d1de022b6f6c764780c47b064aef93f')

pkgver() {
  git -C "${srcdir}/${pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" apply -v "${srcdir}"/{boost_107400,cmake.extra.install.dirs.remove,osl_1.11.8,oiio_cxx_std_14,open{exr3,colorio1,imageio}}.patch
  sed '/python37/s/37/310/' -i "${srcdir}/${pkgname}"/src/appleseed.python/CMakeLists.txt
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
CMAKE_FLAGS=( -DWITH_EMBREE=ON
              -DCMAKE_BUILD_TYPE=Ship
              -DCMAKE_INSTALL_PREFIX=/opt/appleseed
              -DWITH_PYTHON3_BINDINGS=ON
              -DUSE_STATIC_EMBREE=OFF
              -DUSE_STATIC_EXR=OFF
              -DUSE_STATIC_BOOST=OFF
              -DUSE_STATIC_OCIO=OFF
              -DUSE_STATIC_OIIO=OFF
              -DUSE_STATIC_OSL=OFF
              -DWARNINGS_AS_ERRORS=OFF
              -DWITH_BENCH=OFF
              -DINSTALL_TESTS=OFF
              -DINSTALL_API_EXAMPLES=OFF
              -DPYTHON3_INCLUDE_DIR="/usr/include/python${_pyver}"
              -Wno-dev
            )
  grep -qw    avx /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX=ON)
  grep -qw   avx2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_AVX2=ON)
  grep -qw   f16c /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_F16C=ON)
  grep -qw sse4_2 /proc/cpuinfo && CMAKE_FLAGS+=(-DUSE_SSE42=ON)

  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}/${pkgname}" -B build -G Ninja
# shellcheck disable=SC2086 # allow MAKEFLAGS to carry multiple flags
  ninja -C build ${MAKEFLAGS:--j1}
}

package() {
  # Application
  DESTDIR="${pkgdir}" ninja -C build install
  install -D -m644 "${srcdir}/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Wrapper scripts
  install -D -m755 appleseed.studio_wrap -T "${pkgdir}/usr/bin/appleseed.studio"
  install -D -m755 appleseed.cli_wrap -T "${pkgdir}/usr/bin/appleseed.cli"
}

# vim:set ts=2 sw=2 et:
