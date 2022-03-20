#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
_fragment=${FRAGMENT:-#branch=master}
# shellcheck disable=SC2015
((DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_OPENCL=ON")
} || {
  depends+=(opencl-icd-loader)
  makedepends+=(opencl-headers)
  optdepends+=("opencl-driver: for gpu acceleration")
}
# shellcheck disable=SC2015
((DISABLE_CUDA)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda)
}

_name="luxcorerender"
pkgname=${_name}-git
pkgver=2.6.r27.g8a048104b
epoch=2
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio openvdb)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
conflicts=(luxcorerender)
provides=(luxrays "luxcorerender=${pkgver%.r*}")
options=('!buildflags')
source=("${_name}::git+https://github.com/LuxCoreRender/LuxCore.git${_fragment}"
        "01-glfw.patch"
        "02-boost107400.patch::https://github.com/LuxCoreRender/LuxCore/pull/483.patch"
        "03-python.patch"
        "05-clang-isnan-isinf.patch"
        "06-openexr3.patch"
        "07-silence-compiler-warnings.patch"
        "08-silence-preprocessing.patch"
        "09-openvdb.patch"
        "10-spdlog.patch"
        "11-openimageio.patch"
        )
sha256sums=('SKIP'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            'f5fc0bbeb09c95750da6ca668ea2f26b84998c57c9abb8ac0a3d96131017f66d'
            '7c2cf9dd881fb738e468599a4babc445cfb0a5146d3b74519449b4a1a9602c07'
            '763b41b8fd401c584efd147616d0b4eb4d30c76a7e9072a6c6a03189147530ad'
            '96d2bf957f7a0dfa3c25bd9345d7ca18d4fd89f7a6d3cae946eaf0d623917171'
            '8b7083d8aeedb2adecf078e06da028120c2f8354280c7ec7424b304ab3fd29bd'
            'f81448ae200a3bd549dd551fd6f5db9bff4bd07270bb91e57672d2b1275e938b'
            '33bde7ca00b08ce568d07d70bf324104abe0b38f22e81531de459e98723828b4'
            '10375ea78ab9c1454211992179368a9fa84b79700a4a2ef2b47cb2f1c908699b'
            'bdf0e8167a4e26cc251846b4b8a8827571f8ac9478f7a2400f6776bfe6b99375')
b2sums=('SKIP'
        '2903992389c61fc4720cde8a011d0b637de647a7c9e701609968c01a8ab904277dfb27a90179d4cfcf98382973542e59d1384580236c25f6568aaa7b6ba90528'
        '3057084619ac9067883b820d6ca4cb896155b587a09b689aa2a0dd1139478577164cfe90d5165d84cb88850b35fc5721ad76568764f555bd5c05b8e394c95b48'
        '8539531d52cbe02edd600ae02d179888a36ef0caac806c6951a7a68404bf5575e5afc451d1f6b250b6e3970d088a25396f26a442ef01e3af98ae338a9fd1dc76'
        'a2aae60cee2911c1fa45bdaa670cd04b552fe34624f62eaafc2ceaf648e283ed62e4bb0567dacf9733b6ef05e657514bda7a98800d735f32a15cb8fd452e150b'
        '58e2e5f6706f17040a7674f6ae81c49e4bdac586228c51374615e7821a70cad8f508bdbd1dbb9d53db98713e5cb456c9b065512199385becdcaf7cb9bd7c1f4b'
        '7b15d54811fd1d8ef908963abd76fe552f6149ea32e6f83eaecc6f0636d5e58ece857f86828bf650a2f762a02ca58640ff60dd0f9268666033da67be6e5e7ae1'
        '8e35b9a826592b1a2f2adaa7400cf6cae1c43f04edec7f6a84f2a7c67b56d762685d484863c8f5b49cf55ed6c91c2d3935e851a4446415cc420104707e06201a'
        '0b93c67f7a5c7d1a8f3e62eb94f70a5b93b1c2f7cdbce99dd5444ac52f27aa7198ed9a3172efbea382dd7a7f8aeb97fe54acecafc41bb48ac34379952867724e'
        '798b7e21d44f8c68022b5f212f0235ef1558629db2d7356128b23736a9f97009cc85f48c77e30f5908832da46204d54444f0221675e917d3e3f85c0027c547dd'
        '537301a740c8cbbb45905d28d8fb58069e3839020208e911515a4c0e7aba39bf3d5d53699ee54b42efead2d499b30f1fb77e5dde3aa7faadd0ac9bd45445f8dd')

pkgver() {
# shellcheck disable=SC2164
  cd "${srcdir}/${_name}"
# shellcheck disable=SC2015
  git describe --long --tags --match luxcorerender* | sed 's/^luxcorerender_v//;s/\(alpha\|beta\|rc\)/\.\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  #git -C "${srcdir}/${_name}" revert --no-commit 5d963d0b32a30d76ac193e8198647b74cd9a2e12
  for patch in "${srcdir}"/*.patch; do
    msg2  "apply $patch..."
    patch -Np1 -d "${srcdir}"/${_name} -i "$patch"
  done
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  CMAKE_FLAGS+=(-DCMAKE_CXX_STANDARD=14)
  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}"/${_name} -B build -G Ninja
# shellcheck disable=SC2046
  ninja $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}") -C "${srcdir}/build"
}

package() {
  cd "${srcdir}"/build

  install -d -m755 "${pkgdir}"/usr/{bin,include,lib}
  install -m755 bin/* "${pkgdir}"/usr/bin
  install -m644 lib/* "${pkgdir}"/usr/lib
  cp -a "${srcdir}"/${_name}/include "${pkgdir}"/usr
  for file in "${pkgdir}"/usr/include/*/*.in; do mv "$file" "${file%.in}"; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=$(python -c 'from sys import version_info;print("/usr/lib/python{}.{}".format(version_info.major,version_info.minor))')
  install -d -m755 "${pkgdir}/${_pypath}"
  mv "${pkgdir}"/usr/lib/pyluxcore.so "${pkgdir}/${_pypath}"
}
# vim:set ts=2 sw=2 et:
