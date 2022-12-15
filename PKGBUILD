# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the TensorRT
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/tensorrt/

pkgbase=tensorrt
pkgname=('tensorrt' 'python-tensorrt')
pkgver=8.5.2.2
_ossver=8.5.2
_cudaver=11.8
_cudnnver=8.6
_protobuf_ver=3.20.1
_pybind11_ver=2.9.2
_graphsurgeon_ver=0.4.6
_uffver=0.6.9
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom:NVIDIA-SLA' 'Apache')
makedepends=('git' 'cmake' 'cuda' 'cudnn' 'python' 'python-build' 'python-installer' 'python-onnx'
             'python-setuptools' 'python-wheel')
source=("local://TensorRT-${pkgver}.Linux.${CARCH}-gnu.cuda-${_cudaver}.cudnn${_cudnnver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=${_ossver}"
        'protobuf-protocolbuffers'::'git+https://github.com/protocolbuffers/protobuf.git'
        'cub-nvlabs'::'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/onnx/onnx-tensorrt.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/google/benchmark.git'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-fix-python.patch'
        'TensorRT-SLA.txt')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('3afe62acd4bf2444e9133d3514814d32cf585668c61cbee5497983a6009d81aa'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9'
            'ea25bb1b188d53cbfbec35d242ab2a2fa8d6009c547c9f5f67bc2f1ad127ceac'
            'ab18bcaebc59620a0b97b67c4bfb7646d9310fffbeb15b8441552c600b0212c9'
            'a3e33bbee568e03e7f32481df930c78edc95b49b6b667b37db57cedb1967faed')

prepare() {
    # tensorrt git submodules
    git -C TensorRT submodule init
    git -C TensorRT config --local submodule.parsers/onnx.url         "${srcdir}/onnx-tensorrt"
    git -C TensorRT config --local submodule.third_party/protobuf.url "${srcdir}/protobuf-protocolbuffers"
    git -C TensorRT config --local submodule.third_party/cub.url      "${srcdir}/cub-nvlabs"
    git -C TensorRT -c protocol.file.allow='always' submodule update
    
    # onnx-tensorrt git submodule
    git -C TensorRT/parsers/onnx submodule init
    git -C TensorRT/parsers/onnx config --local submodule.third_party/onnx.url "${srcdir}/onnx"
    git -C TensorRT/parsers/onnx -c protocol.file.allow='always' submodule update
    
    # onnx git submodules
    git -C TensorRT/parsers/onnx/third_party/onnx submodule init
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/pybind11.url  "${srcdir}/pybind11"
    git -C TensorRT/parsers/onnx/third_party/onnx config --local submodule.third_party/benchmark.url "${srcdir}/benchmark"
    git -C TensorRT/parsers/onnx/third_party/onnx -c protocol.file.allow='always' submodule update
    
    git -C pybind11 config --local advice.detachedHead false
    
    # protobuf
    mkdir -p build/third_party.protobuf/src
    cp -af "protobuf-cpp-${_protobuf_ver}.tar.gz" build/third_party.protobuf/src
    
    patch -d TensorRT -Np1 -i "${srcdir}/010-tensorrt-use-local-protobuf-sources.patch"
    patch -d TensorRT -Np1 -i "${srcdir}/020-tensorrt-fix-python.patch"
}

build() {
    export CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build -S TensorRT \
        -DBUILD_ONNX_PYTHON:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTRT_LIB_DIR="${srcdir}/TensorRT-${pkgver}/lib" \
        -DGPU_ARCHS='53 60 61 62 70 72 75 80 86' \
        -DPROTOBUF_VERSION="$_protobuf_ver" \
        -DCUDA_VERSION="$_cudaver" \
        -DCUDNN_VERSION="$_cudnnver" \
        -Wno-dev
    make -C build
    
    # python bindings
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    local -x PYTHON_MAJOR_VERSION="${_pyver%%.*}"
    local -x PYTHON_MINOR_VERSION="${_pyver#*.}"
    local -x TARGET_ARCHITECTURE="$CARCH"
    local -x TRT_OSSPATH="${srcdir}/TensorRT"
    local -x CUDA_ROOT='/opt/cuda'
    local -x ROOT_PATH="${srcdir}/TensorRT"
    local -x EXT_PATH="$srcdir"
    local -x TRT_NONOSS_ROOT="${srcdir}/TensorRT-${pkgver}"
    git -C pybind11 checkout v${_pybind11_ver}
    cd TensorRT/python
    ./build.sh
    
    # python tools (pytorch-quantization currently fails to build)
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy #pytorch-quantization
    do
        cd "${srcdir}/TensorRT/tools/${_dir}"
        python -m build --wheel --no-isolation
    done
}

package_tensorrt() {
    depends=('cuda' 'cudnn')
    
    make -C build DESTDIR="$pkgdir" install
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    install -D -m644 "TensorRT-${pkgver}/lib/libnvinfer_builder_resource.so.${pkgver%.*}" -t "${pkgdir}/usr/lib"
    install -D -m644 build/libnv{caffeparser,infer_plugin}_static.a -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/lib"/libnv{infer,parsers}{.so*,_static.a} "${pkgdir}/usr/lib"
    ln -s "libnvinfer_builder_resource.so.${pkgver%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so.${pkgver%%.*}"
    ln -s "libnvinfer_builder_resource.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so"
    
    install -D -m644 TensorRT-SLA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    install -D -m644 TensorRT/NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    license=('custom' 'Apache')
    depends=('python' 'python-numpy' 'python-pycuda' 'tensorrt')
    optdepends=('python-onnx: for onnx_graphsurgeon python module'
                'python-onnxruntime: for onnx_graphsurgeon and polygraphy python modules'
                'python-protobuf: for polygraphy and uff python modules'
                'python-tensorflow-cuda: for graphsurgeon, polygraphy and uff python modules and convert-to-uff tool')
    
    local _dir
    for _dir in "TensorRT-${pkgver}"/{graphsurgeon,uff} \
                 TensorRT/{python/build/dist,tools/{onnx-graphsurgeon,Polygraphy}/dist}
    do
        cd "${srcdir}/${_dir}"
        python -m installer --destdir="$pkgdir" *.whl
    done
    
    local _sitepkgs
    local _sitepkgs=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../${_sitepkgs/\/usr\//}/tensorrt-${pkgver}.dist-info/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-tensorrt"
    ln -s "../../../${_sitepkgs/\/usr\//}/graphsurgeon-${_graphsurgeon_ver}.dist-info/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-graphsurgeon"
    ln -s "../../../${_sitepkgs/\/usr\//}/uff-${_uffver}.dist-info/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-uff"
    install -D -m644 "${srcdir}/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-NVIDIA-SLA"
    install -D -m644 "${srcdir}/TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    install -D -m644 "${srcdir}/TensorRT/NOTICE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
