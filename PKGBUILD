# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=sherpa-onnx
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=1.12.14
pkgrel=1
pkgdesc="Speech-to-text, text-to-speech, speaker diarization, and VAD using next-gen Kaldi with onnxruntime without Internet connection."
arch=("x86_64" "aarch64" "arm" "riscv64")
url="https://github.com/k2-fsa/${pkgbase}"
license=("Apache-2.0")
depends=("jack" "onnxruntime" "protobuf")
makedepends=("cargs" "cmake" "ninja" "pybind11" "python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "asio-asio-1-24-0.tar.gz::https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-24-0.tar.gz"
        "cppinyin-0.10.tar.gz::https://github.com/pkufool/cppinyin/archive/refs/tags/v0.10.tar.gz"
        "cppjieba-sherpa-onnx-2024-04-19.tar.gz::https://github.com/csukuangfj/cppjieba/archive/refs/tags/sherpa-onnx-2024-04-19.tar.gz"
        "eigen-3.4.0.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz"
        "espeak-ng-f6fed6c58b5e0998b8e68c6610125e2d07d595a7.zip::https://github.com/csukuangfj/espeak-ng/archive/f6fed6c58b5e0998b8e68c6610125e2d07d595a7.zip"
        "hclust-cpp-2024-09-29.tar.gz::https://github.com/csukuangfj/hclust-cpp/archive/refs/tags/2024-09-29.tar.gz"
        "kaldi-decoder-0.2.10.tar.gz::https://github.com/k2-fsa/kaldi-decoder/archive/refs/tags/v0.2.10.tar.gz"
        "kaldi-native-fbank-1.22.1.tar.gz::https://github.com/csukuangfj/kaldi-native-fbank/archive/refs/tags/v1.22.1.tar.gz"
        "kaldifst-1.7.17.tar.gz::https://github.com/k2-fsa/kaldifst/archive/refs/tags/v1.7.17.tar.gz"
        "openfst-sherpa-onnx-2024-06-19.tar.gz::https://github.com/csukuangfj/openfst/archive/refs/tags/sherpa-onnx-2024-06-19.tar.gz"
        "piper-phonemize-78a788e0b719013401572d70fef372e77bff8e43.zip::https://github.com/csukuangfj/piper-phonemize/archive/78a788e0b719013401572d70fef372e77bff8e43.zip"
        "pa_stable_v190700_20210406.tgz::http://files.portaudio.com/archives/pa_stable_v190700_20210406.tgz"
        "simple-sentencepiece-0.7.tar.gz::https://github.com/pkufool/simple-sentencepiece/archive/refs/tags/v0.7.tar.gz"
        "websocketpp-b9aeec6eaf3d5610503439b4fae3581d9aff08e8.zip::https://github.com/zaphoyd/websocketpp/archive/b9aeec6eaf3d5610503439b4fae3581d9aff08e8.zip")
sha256sums=('0672ff3963c24a3afe4ca23405fb43d154331a55384078162b68c8153f8086a2'
            'cbcaaba0f66722787b1a7c33afe1befb3a012b5af3ad7da7ff0f6b8c9b7a8a5b'
            'abe6584d7ee56829e8f4b5fbda3b50ecdf49a13be8e413a78d1b0d5d5c019982'
            '03e5264687f0efaef05487a07d49c3f4c0f743347bfbf825df4b30cc75ac5288'
            '8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72'
            '70cbf4050e7a014aae19140b05e57249da4720f56128459fbe3a93beaf971ae6'
            'abab51448a3cb54272aae07522970306e0b2cc6479d59d7b19e7aee4d6cedd33'
            'a3d602edc1f422acfe663153faf3f0a716305ec1f95b8fcf9d28d301d6827309'
            'b292ddd1fa121f28371d11c14dd016c59c54b3f0dbb2bb2cfdc82d562564d0f5'
            'c4b701a23a400bda8032586b02c7e0d5e813a765832df60c23e6df9e62b010f4'
            '5c98e82cc509c5618502dde4860b8ea04d843850ed57e6d6b590b644b268853d'
            '89641a46489a4898754643ce57bda9c9b54b4ca46485fdc02bf0dc84b866645d'
            '47efbf42c77c19a05d22e627d42873e991ec0c1357219c0d74ce6a2948cb2def'
            '1748a822060a35baa9f6609f84efc8eb54dc0e74b9ece3d82367b7119fdc75af'
            '1385135ede8191a7fbef9ec8099e3c5a673d48df0c143958216cd1690567f583')
noextract=( $(echo "${source[@]:1}" | sed -E 's|:\S+||g') )

prepare() {
    cd "${pkgbase}-${pkgver}"
    for file in ${noextract[@]}; do
        ln -sf ../"${file}" "${file}"
    done
    sed -i "s|include(cargs)|find_package(Cargs CONFIG REQUIRED)|" c-api-examples/CMakeLists.txt
    sed -i "s|    ./|    lib/pkgconfig|" CMakeLists.txt
    echo 'find_package(pybind11 REQUIRED)' > cmake/pybind11.cmake
}

build() {
    local base_args=(
        --compile-no-warning-as-error
        -Wno-dev
        -G Ninja
        -DCMAKE_BUILD_TYPE=Release
        -DSHERPA_ONNX_USE_PRE_INSTALLED_ONNXRUNTIME_IF_AVAILABLE=ON
    )
    if [[ $CARCH == x86_64 ]]; then
        base_args+=( -DSHERPA_ONNX_ENABLE_GPU=ON )
    fi

    cd "${pkgbase}-${pkgver}"
    cmake "${base_args[@]}" \
        -Bbuild_bin \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSHERPA_ONNX_ENABLE_BINARY=ON \
        -DSHERPA_ONNX_ENABLE_PYTHON=OFF
    cmake --build build_bin
    
    export SHERPA_ONNX_CMAKE_ARGS="${base_args[@]} -DSHERPA_ONNX_ENABLE_BINARY=OFF"
    python -m build --wheel --no-isolation
}

package_sherpa-onnx() {
    provides=("${pkgname}=${pkgver}")

    cd "${pkgbase}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build_bin
    install -Dm644 {README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    rm -rf "${pkgdir}/usr/share/vim"        "${pkgdir}/usr/lib/pkgconfig/espeak-ng.pc"
}

package_python-sherpa-onnx() {
    pkgdesc+=" (Python bindings)"
    depends=("python-click" "python-onnxruntime" "${pkgbase}=${pkgver}")

    cd "${pkgbase}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 {README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
