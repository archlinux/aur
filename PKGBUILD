# Maintainer: devome <evinedeng@hotmail.com>

pkgbase=sherpa-onnx
pkgname=("${pkgbase}" "python-${pkgbase}")
pkgver=1.10.46
pkgrel=1
pkgdesc="Speech-to-text, text-to-speech, speaker diarization, and VAD using next-gen Kaldi with onnxruntime without Internet connection."
arch=("x86_64" "aarch64" "arm" "riscv64")
url="https://github.com/k2-fsa/${pkgbase}"
license=("Apache-2.0")
depends=("jack" "onnxruntime<1.20.0")
makedepends=("cargs" "cmake" "ninja" "openmpi" "pybind11" "python-build" "python-installer" "python-setuptools" "python-wheel")
optdepends=("openmpi: Distributed memory parallelization"
            "cuda: nVidia GPU acceleration"
            "cudnn: nVidia GPU acceleration"
            "nccl: nVidia GPU acceleration")
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "asio-asio-1-24-0.tar.gz::https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-24-0.tar.gz"
        "cppjieba-sherpa-onnx-2024-04-19.tar.gz::https://github.com/csukuangfj/cppjieba/archive/refs/tags/sherpa-onnx-2024-04-19.tar.gz"
        "eigen-3.4.0.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz"
        "espeak-ng-f6fed6c58b5e0998b8e68c6610125e2d07d595a7.zip::https://github.com/csukuangfj/espeak-ng/archive/f6fed6c58b5e0998b8e68c6610125e2d07d595a7.zip"
        "hclust-cpp-2024-09-29.tar.gz::https://github.com/csukuangfj/hclust-cpp/archive/refs/tags/2024-09-29.tar.gz"
        "kaldi-decoder-0.2.6.tar.gz::https://github.com/k2-fsa/kaldi-decoder/archive/refs/tags/v0.2.6.tar.gz"
        "kaldi-native-fbank-1.20.0.tar.gz::https://github.com/csukuangfj/kaldi-native-fbank/archive/refs/tags/v1.20.0.tar.gz"
        "kaldifst-1.7.11.tar.gz::https://github.com/k2-fsa/kaldifst/archive/refs/tags/v1.7.11.tar.gz"
        "openfst-sherpa-onnx-2024-06-19.tar.gz::https://github.com/csukuangfj/openfst/archive/refs/tags/sherpa-onnx-2024-06-19.tar.gz"
        "piper-phonemize-78a788e0b719013401572d70fef372e77bff8e43.zip::https://github.com/csukuangfj/piper-phonemize/archive/78a788e0b719013401572d70fef372e77bff8e43.zip"
        "pa_stable_v190700_20210406.tgz::http://files.portaudio.com/archives/pa_stable_v190700_20210406.tgz"
        "simple-sentencepiece-0.7.tar.gz::https://github.com/pkufool/simple-sentencepiece/archive/refs/tags/v0.7.tar.gz"
        "websocketpp-b9aeec6eaf3d5610503439b4fae3581d9aff08e8.zip::https://github.com/zaphoyd/websocketpp/archive/b9aeec6eaf3d5610503439b4fae3581d9aff08e8.zip")
sha256sums=('82b3d2f661ccf15e027dad14e0701cb6b74ae4bdaa9e4bc519ffa19bf28080e9'
            'cbcaaba0f66722787b1a7c33afe1befb3a012b5af3ad7da7ff0f6b8c9b7a8a5b'
            '03e5264687f0efaef05487a07d49c3f4c0f743347bfbf825df4b30cc75ac5288'
            '8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72'
            '70cbf4050e7a014aae19140b05e57249da4720f56128459fbe3a93beaf971ae6'
            'abab51448a3cb54272aae07522970306e0b2cc6479d59d7b19e7aee4d6cedd33'
            'b13c78b37495cafc6ef3f8a7b661b349c55a51abbd7f7f42f389408dcf86a463'
            'c6195b3cf374eef824644061d3c04f6b2a9267ae554169cbaa9865c89c1fe4f9'
            'b43b3332faa2961edc730e47995a58cd4e22ead21905d55b0c4a41375b4a525f'
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
}

build() {
    local base_args=(
        --compile-no-warning-as-error
        -Wno-dev
        -G Ninja
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_BUILD_TYPE=None
        -DSHERPA_ONNX_USE_PRE_INSTALLED_ONNXRUNTIME_IF_AVAILABLE=ON
    )
    if [[ $CARCH == x86_64 ]]; then
        base_args+=( -DSHERPA_ONNX_ENABLE_GPU=ON )
    fi

    cd "${pkgbase}-${pkgver}"
    cmake "${base_args[@]}" \
        -B build \
        -D BUILD_SHARED_LIBS=ON \
        -D SHERPA_ONNX_ENABLE_PYTHON=OFF
    cmake --build build
    
    export SHERPA_ONNX_CMAKE_ARGS="${base_args[@]}"
    python -m build --wheel --no-isolation
}

package_sherpa-onnx() {
    provides=("${pkgbase}=${pkgver}")

    cd "${pkgbase}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 {README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/${pkgbase}"
    mv "${pkgdir}/usr/${pkgbase}.pc"        "${pkgdir}/usr/lib/pkgconfig/${pkgbase}.pc"
    rm -rf "${pkgdir}/usr/share/vim"        "${pkgdir}/usr/lib/pkgconfig/espeak-ng.pc"
}

package_python-sherpa-onnx() {
    depends=("python-click" "${pkgbase}=${pkgver}")

    cd "${pkgbase}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 {README,CHANGELOG}.md -t "${pkgdir}/usr/share/doc/python-${pkgbase}"
    rm -rf "${pkgdir}/usr/bin"
}
