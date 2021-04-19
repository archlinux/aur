#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Configuration
# shellcheck disable=SC2015
((DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_OPENCL=ON")
} || {
  depends+=(opencl-icd-loader)
  makedepends+=(opencl-headers)
  optdepends+=("opencl-driver: for gpu acceleration")
}
# shellcheck disable=SC2015
((DISABLE_CUDA||DISABLE_OPENCL)) && {
  CMAKE_FLAGS+=("-DLUXRAYS_DISABLE_CUDA=ON")
} || {
  makedepends+=(cuda)
}

pkgname=luxcorerender
pkgver=2.5
#_rel="rc1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_name=LuxCore-${pkgname}_v${_pkgver}
epoch=2
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
provides=(luxrays)
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "python.patch"
        "glfw.patch"
        "oidn124.patch"
        "boost107400.patch"
        "cpplib.patch"
        "clang.patch"
        "fix_isnan_isinf.patch::https://github.com/LuxCoreRender/LuxCore/pull/508.patch"
        )
sha256sums=('f0d7000ee155eb30f0008ddf3a4e5eaf71b37e5aed94922a5d8131873778eb77'
            'f639fb7e31056b6c7214e303c90fe06665572ffafc11e545f7c05128a8d85dc4'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            'aec4cb388ed25944ef64abc8bd1dbcaa2da989ac0cf06acc026c1f82a817fa92'
            '8a8a681cce3a3ff39536cb0cbfefed8ed61887665ce1f4b101b3a222a1da50f6'
            '7203f773f94d632923a992824c66741a64f07a07fad932f5623ac9a257aa73a5'
            'ea4b15887c12931f34f01079ec3e0ff4c14d70b73b42dbc81140e7e19776bcc7'
            '46ce376e155236acbf5f737df5e1ea50b0c7b1f18ae2398d0381d6fdbbc76fec')
b2sums=('3f28029cd7d2c49437b4e5b6ba5adc201f2e4bcf409450bb2a104d970c9dad5f300e81954ea10f13774a74a7fc1a08516832614674594e3078173b53609eda82'
        '348fa445b9ac7f738461543f8adadbb9a93dc2f75d96d0d26acbf7168290a0621224d6f11b3af77a6c6e492ae089e57770fc02a987af0748f5bb3e73b8d90f54'
        '2903992389c61fc4720cde8a011d0b637de647a7c9e701609968c01a8ab904277dfb27a90179d4cfcf98382973542e59d1384580236c25f6568aaa7b6ba90528'
        '67cf563120070fc675618bdc4da8b8b224bea42c50ac8aabbd3d6b254b4189f330d0f93678f02cd96748a1bb1560f5275ed4fb0c9b2066f67761027343da86ec'
        '04d1e78d044666720a9a099a9b95426ea06fe076354698f642a1a24df25bc27a033e6823a56cbdc21b695cba0e71446f4278c9a1474dba2cfa6aa91945950266'
        '1985ee3dbd596cf7ac4a3041b395792733d59c95de4226dc54ff33887db4ec4adc0ef877d294cf66da2926eb025166397fdf6ceb76bfd280932e3ecd9ae716ec'
        'a11fa313592ce3fb3d0c59deb3bfcec4209697626e830e0b89a398a4f1a97e47c41c39ed29f164902f183dbace7232378641f3dd43e7a7bdf84e787d043c9590'
        '9a5fa2c8233e053bae4ad277e3c4677dbe8eee654f0fdbd7545e9ae98a36f084d00c47460a036ec1d58aac73564223bd0160ee47553eda19d49bac85c9274360')

prepare() {
  for patch in "${srcdir}"/*.patch; do
    msg2  "apply $patch..."
    patch -Np1 -d "${srcdir}"/${_name} -i "$patch"
  done
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info.major,version_info.minor))")
  CMAKE_FLAGS+=("-DPYTHON_V=${_pyver}")
  cmake "${CMAKE_FLAGS[@]}" -S "${srcdir}"/${_name} -B build -G Ninja
# shellcheck disable=SC2086
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
