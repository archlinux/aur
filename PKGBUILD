# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

_cudaver=11.0
_cudnnver=8.0
_graphsurgeonver=0.4.5
_uffver=0.6.9
_ubuntuver=18.04
_protobuf_branch=3.8.x
_protobuf_ver=3.12.3
_cub_branch=1.8.0
_onnx_tensorrt_branch=7.1
_onnx_branch=rel-1.6.0
_onnx_ver=1.7.0

pkgbase=tensorrt
pkgname=('tensorrt' 'tensorrt-doc')
pkgver=7.1.3.4
pkgrel=2
pkgdesc='A platform for high-performance deep learning inference using NVIDIA hardware'
arch=('x86_64')
url='https://github.com/NVIDIA/TensorRT/'
license=('custom' 'Apache')
makedepends=('git' 'cmake' 'poppler' 'pybind11' 'python' 'python-pip'
             'cuda' 'cudnn')
source=("local://TensorRT-${pkgver}.Ubuntu-${_ubuntuver}.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=${pkgver%.*}"
        'protobuf-protocolbuffers'::"git+https://github.com/protocolbuffers/protobuf#branch=${_protobuf_branch}"
        "git+https://github.com/NVlabs/cub#branch=${_cub_branch}"
        "git+https://github.com/onnx/onnx-tensorrt#branch=${_onnx_tensorrt_branch}"
        "git+https://github.com/onnx/onnx#branch=${_onnx_branch}"
        'git+https://github.com/pybind/pybind11'
        'git+https://github.com/google/benchmark'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-fix-cub-deprecation-huge-warnings.patch')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('f13c6e2f82fda1ed3becac6230ec2048764fe8d302b20a29ae3b1e280c7aac69'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4ef97ec6a8e0570d22ad8c57c99d2055a61ea2643b8e1a0998d2c844916c4968'
            'ea25bb1b188d53cbfbec35d242ab2a2fa8d6009c547c9f5f67bc2f1ad127ceac'
            'bfc2230de7d1afa97febd2bc74c0cca019d86c303008533c347c18c20dea5cd7')

prepare() {
    # tensorrt git submodules
    git -C TensorRT submodule init
    git -C TensorRT config --local submodule.parsers/onnx.url         "${srcdir}/onnx-tensorrt"
    git -C TensorRT config --local submodule.third_party/protobuf.url "${srcdir}/protobuf-protocolbuffers"
    git -C TensorRT config --local submodule.third_party/cub.url      "${srcdir}/cub"
    git -C TensorRT submodule update
    
    # fix error: the type <type> of ‘constexpr’ variable ‘getMatrixOp’ is not literal
    git -C TensorRT/parsers/onnx checkout "release/${_onnx_tensorrt_branch}"
    
    # onnx-tensorrt git submodule
    git -C TensorRT/parsers/onnx submodule init
    git -C TensorRT/parsers/onnx config --local submodule.third_party/onnx.url "${srcdir}/onnx"
    git -C TensorRT/parsers/onnx submodule update
    
    # https://github.com/onnx/onnx/issues/2481
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
}

package_tensorrt() {
    depends=('cuda' 'cudnn')
    optdepends=('python-numpy: for graphsurgeon and uff python modules'
                'python-tensorflow-cuda: for graphsurgeon and uff python modules'
                'python-protobuf: for uff python module')
    
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
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}

package_tensorrt-doc()
{
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
