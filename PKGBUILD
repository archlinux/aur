# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

pkgbase=tensorrt
pkgname=('tensorrt' 'python-tensorrt' 'tensorrt-doc')
pkgver=8.2.1.8
_tensorrt_tag=8.2.1
_cudaver=11.4
_cudnnver=8.2
_protobuf_ver=3.17.3
_onnx_tag=1.8.1
_graphsurgeonver=0.4.5
_uffver=0.6.9
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom:NVIDIA-SLA' 'Apache')
makedepends=('git' 'cmake' 'poppler' 'cuda' 'cudnn' 'python' 'python-onnx'
             'python-pip' 'python-wheel')
source=("local://TensorRT-${pkgver}.Linux.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=${_tensorrt_tag}"
        'protobuf-protocolbuffers'::'git+https://github.com/protocolbuffers/protobuf.git'
        'cub-nvlabs'::'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/onnx/onnx-tensorrt.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/google/benchmark.git'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-fix-python.patch')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('3e9a9cc4ad0e5ae637317d924dcddf66381f4db04e2571f0f2e6ed5a2a51f247'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '51cec99f108b83422b7af1170afd7aeb2dd77d2bcbb7b6bad1f92509e9ccf8cb'
            'ea25bb1b188d53cbfbec35d242ab2a2fa8d6009c547c9f5f67bc2f1ad127ceac'
            '87084c3ed1cf59cbfbcff73e225597e0f12f8881517d10d41933560c0894ebdf')

prepare() {
    # tensorrt git submodules
    git -C TensorRT submodule init
    git -C TensorRT config --local submodule.parsers/onnx.url         "${srcdir}/onnx-tensorrt"
    git -C TensorRT config --local submodule.third_party/protobuf.url "${srcdir}/protobuf-protocolbuffers"
    git -C TensorRT config --local submodule.third_party/cub.url      "${srcdir}/cub-nvlabs"
    git -C TensorRT submodule update
    
    # onnx-tensorrt git submodule
    git -C TensorRT/parsers/onnx submodule init
    git -C TensorRT/parsers/onnx config --local submodule.third_party/onnx.url "${srcdir}/onnx"
    git -C TensorRT/parsers/onnx submodule update
    
    # https://github.com/onnx/onnx/issues/2481
    git -C TensorRT/parsers/onnx/third_party/onnx config --local advice.detachedHead false
    git -C TensorRT/parsers/onnx/third_party/onnx checkout "v${_onnx_tag}"
    
    # onnx git submodules
    git -C TensorRT/parsers/onnx/third_party/onnx submodule init
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/pybind11.url  "${srcdir}/pybind11"
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/benchmark.url "${srcdir}/benchmark"
    git -C TensorRT/parsers/onnx/third_party/onnx submodule update
    
    # protobuf
    mkdir -p build/third_party.protobuf/src
    cp -a "protobuf-cpp-${_protobuf_ver}.tar.gz" build/third_party.protobuf/src
    
    patch -d TensorRT -Np1 -i "${srcdir}/010-tensorrt-use-local-protobuf-sources.patch"
    patch -d TensorRT -Np1 -i "${srcdir}/020-tensorrt-fix-python.patch"
}

build() {
    export LDFLAGS+=' -L/usr/lib'
    cmake -B build -S TensorRT \
        -DBUILD_ONNX_PYTHON:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTRT_LIB_DIR="${srcdir}/TensorRT-${pkgver}/lib" \
        -DGPU_ARCHS='52 53 60 61 62 70 72 75 80 86' \
        -DPROTOBUF_VERSION="$_protobuf_ver" \
        -DCUDA_VERSION="$_cudaver" \
        -DCUDNN_VERSION="$_cudnnver" \
        -Wno-dev
    make -C build
    
    # python bindings
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    export PYTHON_MAJOR_VERSION="${_pyver%%.*}"
    export PYTHON_MINOR_VERSION="${_pyver#*.}"
    export TARGET_ARCHITECTURE="$CARCH"
    export TRT_OSSPATH="${srcdir}/TensorRT"
    export CUDA_ROOT='/opt/cuda'
    export ROOT_PATH="${srcdir}/TensorRT"
    export EXT_PATH="$srcdir"
    export TRT_NONOSS_ROOT="${srcdir}/TensorRT-${pkgver}"
    cd TensorRT/python
    ./build.sh
    
    # python tools (pytorch-quantization currently fails to build)
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy #pytorch-quantization
    do
        cd "${srcdir}/TensorRT/tools/${_dir}"
        python setup.py build
    done
    
    # license
    pdftotext -layout "${srcdir}/TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.pdf"
}

package_tensorrt() {
    depends=('cuda' 'cudnn')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    install -D -m644 build/libnv{caffeparser,infer_plugin}_static.a -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/lib"/libnv{infer,parsers}{.so*,_static.a} "${pkgdir}/usr/lib"
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    install -D -m644 TensorRT/NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    depends=('python' 'python-numpy' 'python-pycuda' 'tensorrt')
    optdepends=('python-onnx: for onnx_graphsurgeon python module'
                'python-onnxruntime: for onnx_graphsurgeon and polygraphy python modules'
                'python-protobuf: for polygraphy and uff python modules'
                'python-tensorflow-cuda: for graphsurgeon, polygraphy and uff python modules and convert-to-uff tool')
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    local _trt_major
    local _trt_minor
    local _trt_patch
    local _trt_build
    _trt_major="$(awk '/^#define NV_TENSORRT_MAJOR/ { print $3 }' TensorRT/include/NvInferVersion.h)"
    _trt_minor="$(awk '/^#define NV_TENSORRT_MINOR/ { print $3 }' TensorRT/include/NvInferVersion.h)"
    _trt_patch="$(awk '/^#define NV_TENSORRT_PATCH/ { print $3 }' TensorRT/include/NvInferVersion.h)"
    _trt_build="$(awk '/^#define NV_TENSORRT_BUILD/ { print $3 }' TensorRT/include/NvInferVersion.h)"
    local _trtver="${_trt_major}.${_trt_minor}.${_trt_patch}.${_trt_build}"
    
    PIP_CONFIG_FILE='/dev/null' pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location \
        "TensorRT-${pkgver}/graphsurgeon/graphsurgeon-${_graphsurgeonver}-py2.py3-none-any.whl" \
        "TensorRT-${pkgver}/uff/uff-${_uffver}-py2.py3-none-any.whl" \
        "TensorRT/python/build/dist/tensorrt-${_trtver}-cp${_pyver%%.*}${_pyver#*.}-none-linux_${CARCH}.whl"
    python -O -m compileall "${pkgdir}/usr/lib/python${_pyver}/site-packages"/{graphsurgeon,uff,tensorrt}
    
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy #pytorch-quantization
    do
        cd "${srcdir}/TensorRT/tools/${_dir}"
        python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    done
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/python${_pyver}/site-packages/tensorrt-${pkgver}.dist-info/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    install -D -m644 "${srcdir}/TensorRT/NOTICE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_tensorrt-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    license=('custom:NVIDIA-SLA')
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Developer-Guide.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Release-Notes.pdf"   -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-Support-Matrix-Guide.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/doc"/{cpp,python} "${pkgdir}/usr/share/doc/${pkgbase}"
    
    install -D -m644 "TensorRT-${pkgver}/doc/pdf/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}
