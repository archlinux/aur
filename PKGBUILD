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
pkgver=2.6
#_rel="rc1"
[ -n "${_rel}" ] && _pkgver=${pkgver}${_rel} && pkgver+=".${_rel}" || _pkgver=${pkgver}
_name=LuxCore-${pkgname}_v${_pkgver}
epoch=2
pkgrel=4
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio openvdb openmp)
optdepends+=("pyside2: for pyluxcoretools gui")
makedepends+=(boost cmake doxygen git ninja pyside2-tools)
provides=(luxrays)
source=("https://github.com/LuxCoreRender/LuxCore/archive/${pkgname}_v${_pkgver}.tar.gz"
        "0001-glfw.patch"
        "0002-boost107400.patch"
        "0003-python.patch"
        "0004-cpplib.patch"
        "0005-clang-isnan-isinf.patch"
        "0006-openexr3.patch"
        "0007-silence-compiler-warnings.patch"
        "0008-silence-preprocessing.patch"
        "0009-openvdb.patch"
        "0010-spdlog.patch"
        "0011-openimageio.patch"
        "0012-opencolorio.patch"
        )
sha256sums=('b844989b8229bf02f3c8aa6845be6a587aa5ae55a45861591119ad0e1a195867'
            '844bd21fde9b8922df10a2eae35f7cd1b52670e9fbe82e65b0860f91793eb16b'
            '208504a682188825f153abd6bfc6954dcd5c9ddf41d5685d4e1962c78a78e5e3'
            '225f680681e5c48d39d25861312f56e09468f00fce86e42ec34317d2141007b4'
            '9e4e0c2c4893a2c5b0c639dc303b38427038e473cf8ffc6f8f57bb90b19410e3'
            'b04cbc01919853d9a4a9b776691e7e8e0cb0e10cc0bf18278d8889d8fa0f95f0'
            'ad2bc28399315a87ad63a167f4edd6581765ba64a31046a6d169edba6dd50dee'
            '0958971643fd36c56e9ecbf8b1542035af7cf64e657937df8a159fa6b27bb4b0'
            '01beadfc9571c133f423736520ffb5d808de9be2271cd879028a88fd2be50b83'
            '3699cd2e7ac266acec780ebd6481f5faa53b14d4b22fff1cdd7519d9b830f410'
            '09a127677aa7154a2b1147ef685ec5e8a426ef743c5af7efcf929e3591ba001b'
            '75362c66901937fa2af038a9cea5494299284e2caaffedbd0d82ce9556b0ecd7'
            '406dc6c28541f701e47f2b71766ce255f9af1633fe175f0580d33f78156bb526')
b2sums=('ead966b0df7bb72ac9aa2aefb1e5f2dd020156a8e66f67aeff75d29606072ea7b147ddc4d6effea687baf4653e670bd3ad93fc9c7b0e7cac340cb1d5976adb14'
        '50d6416bf4e66438d92bfe23505114c55940e8b4411b4ac01adb7c30a200701d01a4f40519e9f29a57414cd9f28a6410353439caa83aab2fc09191b820c1a9d1'
        'db7b8450f032276ba49e1510fb7ee33bd64f1249661bfb66ecf6107baaf691c474c0d213256e6307831c6157a67192cd1e9d4483f24306ccf3a9a6c4f82b3a08'
        '57db881f3217b5247030c48e542b504d33909467f81f72ed45951c0a09074b06f54ebdd39fa73f40863ab9f808e80b928f51c720ec1a90eb036ab1684199b1da'
        'a5589bc99841646223faaf2ff82c63e5eb9ff67ed218e2e7f06076ef6cf3c981954fc4a0f1fc8a1c391114916dde1e1903333fd18969dc7ec5f105f10eb42698'
        '98391453940571cf68a31378a7c36c12a107de418c1ee0971ed62c665bc34558c52ce333b2fdf854d44bc1f833183518d7fb0ae8b21984f4a15416a7e085a96d'
        '6658015968bcb040e8dea19c415737e66b3d8bceaf504d0b7990226cbe5210b5858262e928d0666691c2ce220905f22eea1a6989ac1e90505c029c4e86f714f1'
        'b99c2c4e46533b1f7c72d6beb36cf0e7aef070141fb03c544731f1dbaee03f746f0cfb5888301ab39594482b86516a177d301e85a365b3db9e4bccfc62adca79'
        '4dda3fd00f391003f600c73f8ac0812b44800e9c4b239ab58339e2b990e519439414951e71679b6faa95b5c7ff7abb9033ce936c1e792a1245e106a89b6f00d6'
        '486a69b96da727b8a0185f2d5665b3b75187a91043d640eae431a576c9604d4f478f92a5624b78b1e1edc870827bb12d02a8b1b5433dfd89ade81e8c9208f602'
        '73d0ba48c5d242dd3ba58119b1bdc4669bdaa58abe945eddd7f8180dc4510e2dc4fcdc32c55f562fa6282e00d6a8d23b378b51c28e99e1c6dcc5584c3e5133c9'
        '7dbc862cf58454143f62511d843df380dd51ded785143cba60a7d7f8af603e104e19c49891ee1326a700ef07d7ce882e63fe7b4d87f5c056c61222f9f1f36fef'
        'fd1ebf116a1d79c5faacb9b9b38751897ec76f427a1a872bb746430cbc5aa2e3a84a60adc66fc64ca63286b64b512500034c1ba819b58175f9cc2e7ff90deb67')

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
