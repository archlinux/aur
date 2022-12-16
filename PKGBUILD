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
pkgrel=7
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends+=(blosc boost-libs embree glfw gtk3 openimagedenoise openimageio openvdb fmt python spdlog)
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
        "0010-openimageio.patch"
        "0011-opencolorio.patch"
        "0012-boost179-fstream.patch"
        "0013-spdlog.patch"
        )
sha256sums=('b844989b8229bf02f3c8aa6845be6a587aa5ae55a45861591119ad0e1a195867'
            '488e3bf2aac0c412643bbc91248de4fe83f13936cd4b8f963d0d782a52aa3301'
            '4f501087867efa1fbd7803f0620e39fb25b0e718f63596e1b4d832a58e746aae'
            '1bb10a3d9c7139699ffab0e11621addb65891b73121c3ba67cf782e609169e2a'
            '1a3d922a95f305077a33af3b7a3f1a7e8af1a21b8dfc78bcc039353a79e94411'
            '273ae005ba86f2df0750cc278ed64a8ec33bbaa7f32ffd2c4eb12bf2feb6da0c'
            '45c09e893d6fa31f5af77c1db5e99261a630a4b866ce6a6448f2644f0ff15f57'
            '73ac844cd78bf20d625f0250e5555ef59de3cd749efc8baaa23b0cb87052c226'
            'c8f368a597cc657e42da19d275d7f86d85e718cc94a67e3db307cef51a8540ec'
            'de3caaa28ccc56041eb8e048a9d6db4862a890fd26f01f5ba716e8b453627fc3'
            '5cce35bc5a2dddbe4576a1764545502528a1043ed46e22300f3ffd708e04514e'
            '403436261b647a43bf4e3f7c6bd10d414145197371b044b5ed41e11f33262f15'
            '98c63144e59a43ec20a3958406f104d5310cd9551e5a5c6563a845b5059a3bdb'
            '8d4d4233096d301e22f6611f8af90ac34be998a71e67673b3f548ba1079d6289')
b2sums=('ead966b0df7bb72ac9aa2aefb1e5f2dd020156a8e66f67aeff75d29606072ea7b147ddc4d6effea687baf4653e670bd3ad93fc9c7b0e7cac340cb1d5976adb14'
        'c79c24b2e73b13927b40ffd7ff114ffefc78fd2d6d0b2151f2b35d8784f07aa1b1f48370828ca127ff9ae77aa408363c19ef319dbb41db7fe5a81982466ea91a'
        'bb540e093ed3e714b703df48c2611953947d45b59683358c5254e3fceb8612103c05953a43cf4410189a6143d41bd829ba26f0df2bb7f0542be55611ac1c395b'
        '15d0c8325bd130cd75d178c9e144340e9a1677fecb6fbd06d75d41d8a2838223707e33dc5fa1027c2b1be7a7c8f1e376c5613d7426a74115aed9bfe8bd1a6d08'
        '284afde4f854c689fc1dabde8e0e6beba8ad896027aabc390ebf5811d97d7cc0022733698cdfbacfee496458fad006009a04d20080cacccba5b33a2c8a57564f'
        '12344286fe26359f5a82073ce5d5507cc981c6d9661e2ace31f3a38ac91fd4458d9d739142695f5380b2e60b75651060693191bf6133fd7c8916827733e3679b'
        '1b8d6097d9b35778b5ce6c706f6c98a42d5bd4c1f4045464412dfd3d4bd6b224b6e845d40425cc85c55a219303131c0d354f429d2ca1e62287f29c8d098392e0'
        'ce9185f920f0a94aaf88c1ff71f83f3433e79f065e2a8070028e7a3d4a2b1c535faa9fed452b2a4ae31fffeafe4de1aa346ac6d4f045379b709e90a8c31275ec'
        '2af04224058508e7c51236eec752c400ac9ec602016f07fee5ec4cbe643a405bdf592ded7e55c8d4fc97aa5aa8ca40256da191f8fbbcffc5b089f0b37981d6bb'
        'ae6741724b805cfa23c8939148c49003fdd6cd2ecff58acb36d1a587ad6956ff417f652b42d9e2fd56c73de5cb6c6175a3a662d670ee7861500f1af0a68251d6'
        'cd8fee59875514a22391c0fa5cf85022a33a3dc017d638372c25b0b7f5a1b485f235e872c1d01f6c73277b3526406ead157b76a8d9fa76647e0997744436d0ff'
        'c18566140d5e85caeafbe443cee237d0a1e012742bbad47733de23ff38e64241b87e9fe961cbbe48997b8445804f36032da695596770abfcd5cda33e2a3fb335'
        '0affefa29a68a719e307edb5307935b63805bd8e842b9a1db0dce807f64a576f8b3ba7feafea238adee3875b53d3d1ec997880e88707d1f973396060c6dae46d'
        'cabf93834f26e1585ca8a2003227483c1ed66f7a2edcfcc12d4ed9eaf85247d4f18e6e341c70ffb4305b2ae21a843390aa275faec0bc46e319a3c4d1a5d50e78')

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
