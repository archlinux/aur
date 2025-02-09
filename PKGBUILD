# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=tensorrt
pkgname=('tensorrt' 'python-tensorrt')
pkgver=10.8.0.43
_cudaver=12.8
_protobuf_ver=3.20.1
_pybind11_ver=2.9.2
_onnx_graphsurgeon_ver=0.5.5
_polygraphy_ver=0.49.18
_tensorflow_quantization_ver=0.2.0
pkgrel=2
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('Apache-2.0' 'LicenseRef-NVIDIA-SOFTWARE-DEVELOPMENT-KITS')
makedepends=('git' 'cmake' 'cuda' 'cudnn' 'patchelf' 'python' 'python-build' 'python-installer'
             'python-onnx' 'python-setuptools' 'python-wheel')
source=("https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/${pkgver%.*}/tars/TensorRT-${pkgver}.Linux.${CARCH}-gnu.cuda-${_cudaver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=v${pkgver%.*}"
        'protobuf-protocolbuffers'::'git+https://github.com/protocolbuffers/protobuf.git'
        'cub-nvlabs'::'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/onnx/onnx-tensorrt.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/google/benchmark.git'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-fix-python.patch'
        'TensorRT-LICENSE-AGREEMENT.txt')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('577d6d8af538153414b9867c666b4f65852fc2eb1e7c0ea3a206e5fafbc7d49e'
            'f0a68a71766fb36936d849789ae381bd0bdb21d01f465abd805e3720ed60a001'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9'
            'ba94c0685216fe9566f7989df98b372e72a8da04b66d64380024107f2f7f4a8f'
            '3bedc30fcfa6bdbae9f42cb66df8207655a3d4c901eb31dcd0186c834f619bcf'
            '64907f271b91655a28f3c9f3555a3c645b23d878f41063192a9d2a67f752205a')

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
        -G 'Unix Makefiles' \
        -DBUILD_ONNX_PYTHON:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTRT_LIB_DIR="${srcdir}/TensorRT-${pkgver}/lib" \
        -DGPU_ARCHS='50 52 53 60 61 62 70 72 75 80 86 87 89 90 100 101 120' \
        -DPROTOBUF_VERSION="$_protobuf_ver" \
        -Wno-dev
    cmake --build build
    
    # python bindings
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    local -x TENSORRT_MODULE='tensorrt'
    local -x PYTHON_MAJOR_VERSION="${_pyver%%.*}"
    local -x PYTHON_MINOR_VERSION="${_pyver#*.}"
    local -x TARGET_ARCHITECTURE="$CARCH"
    local -x TRT_OSSPATH="${srcdir}/TensorRT"
    local -x CUDA_ROOT='/opt/cuda'
    local -x ROOT_PATH="${srcdir}/TensorRT"
    local -x EXT_PATH="$srcdir"
    local -x TRT_NONOSS_ROOT="${srcdir}/TensorRT-${pkgver}"
    git -C pybind11 checkout "v${_pybind11_ver}"
    cd TensorRT/python
    ./build.sh
    
    # python tools
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy tensorflow-quantization
    do
        cd "${srcdir}/TensorRT/tools/${_dir}"
        python -m build --wheel --no-isolation
    done
}

package_tensorrt() {
    depends=('cuda' 'cudnn')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    install -D -m644 build/libnvinfer_plugin_static.a -t "${pkgdir}/usr/lib"
    install -D -m644 "TensorRT-${pkgver}/lib"/libnvinfer_{builder_resource.so."${pkgver%.*}",vc_plugin_static.a} -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/lib"/libnvinfer{,_dispatch,_lean}{.so*,_static.a} "${pkgdir}/usr/lib"
    ln -s "libnvinfer_builder_resource.so.${pkgver%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so.${pkgver%%.*}"
    ln -s "libnvinfer_builder_resource.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so"
    
    local _file
    for _file in "${pkgdir}/usr/bin"/* "${pkgdir}/usr/lib"/libnvinfer_{builder_resource,dispatch,lean}".so.${pkgver%.*}"
    do
        if readelf -l "$_file" | grep -A1 'GNU_STACK' | tail -n1 | grep -q 'E'
        then
            patchelf --clear-execstack "$_file"
        fi
    done
    
    install -D -m644 TensorRT/NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 TensorRT-LICENSE-AGREEMENT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    license+=('LicenseRef-Custom')
    depends=('python' 'python-numpy' 'tensorrt')
    optdepends=('python-onnx: for onnx_graphsurgeon python module'
                'python-onnxruntime: for onnx_graphsurgeon and polygraphy python modules'
                'python-protobuf: for polygraphy and tensorflow-quantization python modules'
                'python-tensorflow-cuda: for polygraphy python module'
                'python-tf2onnx: for tensorflow-quantization python module')
    provides=("python-onnx-graphsurgeon=${_onnx_graphsurgeon_ver}"
              "python-polygraphy=${_polygraphy_ver}"
              "python-tensorflow-quantization=${_tensorflow_quantization_ver}")
    
    python -m installer --destdir="$pkgdir" TensorRT/python/build/bindings_wheel/dist/*.whl
    
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy tensorflow-quantization
    do
        python -m installer --destdir="$pkgdir" "TensorRT/tools/${_dir}/dist"/*.whl
    done
    
    install -D -m644 TensorRT/NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 TensorRT-LICENSE-AGREEMENT.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-NVIDIA-SOFTWARE-DEVELOPMENT-KITS"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    ln -s "../../../lib/python${_pyver}/site-packages/tensorrt-${pkgver%.*}.dist-info/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-python-tensorrt"
}
