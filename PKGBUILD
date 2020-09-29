# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_tensorrt_tag=20.09
_cudaver=11.0
_cudnnver=8.0
_graphsurgeonver=0.4.5
_uffver=0.6.9
_ubuntuver=18.04
_protobuf_branch=3.8.x
_protobuf_ver=3.12.4
_cub_tag=1.8.0
_onnx_tensorrt_branch=7.1
_onnx_branch=rel-1.6.0
_onnx_ver=1.7.0

pkgbase=tensorrt
pkgname=('tensorrt' 'tensorrt-doc')
pkgver=7.2.0.14
pkgrel=2
pkgdesc='A platform for high-performance deep learning inference using NVIDIA hardware'
arch=('x86_64')
url='https://github.com/NVIDIA/TensorRT/'
license=('custom' 'Apache')
makedepends=('git' 'cmake' 'poppler' 'pybind11' 'python' 'python-pip' 'zlib'
             'cuda' 'cudnn')
source=("local://TensorRT-${pkgver}.Ubuntu-${_ubuntuver}.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=${_tensorrt_tag}"
        'protobuf-protocolbuffers'::"git+https://github.com/protocolbuffers/protobuf.git#branch=${_protobuf_branch}"
        "git+https://github.com/NVIDIA/cub.git#tag=${_cub_tag}"
        "git+https://github.com/onnx/onnx-tensorrt.git#branch=${_onnx_tensorrt_branch}"
        "git+https://github.com/onnx/onnx.git#branch=${_onnx_branch}"
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/google/benchmark.git'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-fix-cub-deprecation-huge-warnings.patch')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('5681d6f7d4a6d6b9ef7239caa5a0508748e6f6cade77cb4d48f89e133295ab60'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ccfbaaba52f67e0e6536a05f3df3f6618620d255513cfca3a07f5935b624e26b'
            'ea25bb1b188d53cbfbec35d242ab2a2fa8d6009c547c9f5f67bc2f1ad127ceac'
            '6a12e65113b6c1814a73be85b96b4be365850dcdf772f9a3c66476f8647b5ba1')

prepare() {
    # tensorrt git submodules
    git -C TensorRT submodule init
    git -C TensorRT config --local submodule.parsers/onnx.url         "${srcdir}/onnx-tensorrt"
    git -C TensorRT config --local submodule.third_party/protobuf.url "${srcdir}/protobuf-protocolbuffers"
    git -C TensorRT config --local submodule.third_party/cub.url      "${srcdir}/cub"
    git -C TensorRT submodule update
    
    # fix error: the type <type> of ‘constexpr’ variable ‘getMatrixOp’ is not literal
    git -C TensorRT/parsers/onnx config --local advice.detachedHead false
    git -C TensorRT/parsers/onnx checkout "release/${_onnx_tensorrt_branch}"
    
    # onnx-tensorrt git submodule
    git -C TensorRT/parsers/onnx submodule init
    git -C TensorRT/parsers/onnx config --local submodule.third_party/onnx.url "${srcdir}/onnx"
    git -C TensorRT/parsers/onnx submodule update
    
    # https://github.com/onnx/onnx/issues/2481
    git -C TensorRT/parsers/onnx/third_party/onnx config --local advice.detachedHead false
    git -C TensorRT/parsers/onnx/third_party/onnx checkout "v${_onnx_ver}"
    
    # onnx git submodules
    git -C TensorRT/parsers/onnx/third_party/onnx submodule init
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/pybind11.url  "${srcdir}/pybind11"
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/benchmark.url "${srcdir}/benchmark"
    git -C TensorRT/parsers/onnx/third_party/onnx submodule update
    
    # protobuf
    mkdir -p build/third_party.protobuf/src
    cp -a "protobuf-cpp-${_protobuf_ver}.tar.gz" build/third_party.protobuf/src
    
    patch -d TensorRT -Np1 -i "${srcdir}/010-tensorrt-use-local-protobuf-sources.patch"
    patch -d TensorRT -Np1 -i "${srcdir}/020-tensorrt-fix-cub-deprecation-huge-warnings.patch"
    
    pdftotext -layout "TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.pdf"
}

build() {
    cmake -B build -S TensorRT \
        -DBUILD_ONNX_PYTHON:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTRT_LIB_DIR="${srcdir}/TensorRT-${pkgver}/lib" \
        -DGPU_ARCHS='52 53 60 61 62 70 72 75 80' \
        -DPROTOBUF_VERSION="${_protobuf_ver}" \
        -DCUDA_VERSION="$_cudaver" \
        -DCUDNN_VERSION="$_cudnnver" \
        -Wno-dev
    make -C build
    
    cd TensorRT/tools/onnx-graphsurgeon
    python setup.py build
}

package_tensorrt() {
    depends=('cuda' 'cudnn')
    optdepends=('python-numpy: for graphsurgeon, onnx_graphsurgeon and uff python modules'
                'python-onnx: for onnx_graphsurgeon python module'
                'python-protobuf: for uff python module and convert-to-uff tool'
                'python-tensorflow-cuda: for graphsurgeon and uff python modules and convert-to-uff tool')
    
    mkdir -p "${pkgdir}/usr/lib"
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    cp -a "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -a "TensorRT-${pkgver}/lib"/lib{myelin,nv{infer,parsers}}{*.so*,*_static.a} "${pkgdir}/usr/lib"
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 build/libnvcaffeparser_static.a -t "${pkgdir}/usr/lib"
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    PIP_CONFIG_FILE='/dev/null' pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location \
        "TensorRT-${pkgver}/graphsurgeon/graphsurgeon-${_graphsurgeonver}-py2.py3-none-any.whl" \
        "TensorRT-${pkgver}/uff/uff-${_uffver}-py2.py3-none-any.whl"
    python -O -m compileall "${pkgdir}/usr/lib/python${_pyver}/site-packages"/{graphsurgeon,uff}
    
    cd TensorRT/tools/onnx-graphsurgeon
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    
    install -D -m644 "${srcdir}/TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}

package_tensorrt-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    license=('custom')
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Best-Practices.pdf"  -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Developer-Guide.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Release-Notes.pdf"   -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Support-Matrix-Guide.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a "TensorRT-${pkgver}/doc"/{cpp,python} "${pkgdir}/usr/share/doc/${pkgbase}"
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
