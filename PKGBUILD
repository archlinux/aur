# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=tensorrt
pkgname=(
    'tensorrt'
    'python-tensorrt')
pkgver=10.13.3.9
_cudaver=13.0
_protobuf_ver=3.20.1
_pybind11_ver=2.9.2
_onnx_graphsurgeon_ver=0.5.8
_polygraphy_ver=0.49.24
_tensorflow_quantization_ver=0.2.0
pkgrel=3
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('Apache-2.0 AND LicenseRef-TensorRT-LICENSE-AGREEMENT')
makedepends=(
    'cmake'
    'cuda'
    'cudnn'
    'git'
    'python'
    'python-build'
    'python-installer'
    #'python-onnx'
    'python-setuptools'
    'python-wheel')
source=("https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/${pkgver%.*}/tars/TensorRT-${pkgver}.Linux.${CARCH}-gnu.cuda-${_cudaver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=v${pkgver%.*}"
        'git+https://github.com/protocolbuffers/protobuf.git'
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
sha256sums=('897261be948962c9eb5d3595625f91d85a9aa8b57601aed6efac3fd6d9ff6f53'
            '1e4212f419a02957ef67f7abf24b4b7fb7c10bd10a48d7a2f8e4ae9b6fae3972'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9'
            'ba94c0685216fe9566f7989df98b372e72a8da04b66d64380024107f2f7f4a8f'
            '42d46139486825242aa6db63b476f96ce52988978ff9dae67718f6be2d62efec'
            '64907f271b91655a28f3c9f3555a3c645b23d878f41063192a9d2a67f752205a')

prepare() {
    # tensorrt git submodules
    git -C TensorRT submodule init
    git -C TensorRT config --local submodule.parsers/onnx.url         "${srcdir}/onnx-tensorrt"
    git -C TensorRT config --local submodule.third_party/protobuf.url "${srcdir}/protobuf"
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
    local _cudaver_cmake
    local _cudnnver
    _cudaver_cmake="$(LC_ALL='C' pacman -Qi 'cuda' | awk '/^Version/ { print $3 }' | grep -oE '^([0-9]+\.){2}[0-9]')"
    _cudnnver="$(LC_ALL='C' pacman -Qi 'cudnn' | awk '/^Version/ { print $3 }' | grep -oE '^[0-9]+\.[0-9]+')"
    
    export CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build -S TensorRT \
        -G 'Unix Makefiles' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCUDA_VERSION:STRING="$_cudaver_cmake" \
        -DCUDNN_VERSION:STRING="$_cudnnver" \
        -DGPU_ARCHS:STRING='75 80 86 87 89 90 100 103 110 120 121' \
        -DONNX_BUILD_PYTHON:BOOL='ON' \
        -DPROTOBUF_VERSION:STRING="$_protobuf_ver" \
        -DTRT_LIB_DIR:STRING="${srcdir}/TensorRT-${pkgver}/lib" \
        -Wno-dev
    cmake --build build
    
    # python bindings
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[:2])')"
    local -x TENSORRT_MODULE='tensorrt'
    local -x PYTHON_MAJOR_VERSION="${_pyver%%.*}"
    local -x PYTHON_MINOR_VERSION="${_pyver#*.}"
    local -x TARGET_ARCHITECTURE="$CARCH"
    local -x TRT_OSSPATH="${srcdir}/TensorRT"
    local -x CUDA_ROOT='/opt/cuda'
    local -x ROOT_PATH="${srcdir}/TensorRT"
    local -x EXT_PATH="$srcdir"
    local -x TRT_LIBPATH="${srcdir}/TensorRT-${pkgver}/lib"
    git -C pybind11 checkout "v${_pybind11_ver}"
    cd TensorRT/python
    ./build.sh
    
    # python tools
    # python-onnx (for onnx-graphsurgeon) currently gives an undefined symbol error with the following import used by the build system:
    # >>> from onnx.onnx_cpp2py_export import ONNX_ML
    local _dir
    for _dir in Polygraphy tensorflow-quantization #onnx-graphsurgeon
    do
        cd "${srcdir}/TensorRT/tools/${_dir}"
        python -m build --wheel --no-isolation
    done
}

_package_license() {
    install -D -m644 TensorRT/NOTICE -t "${1}/usr/share/licenses/${2}"
    install -D -m644 TensorRT-LICENSE-AGREEMENT.txt "${1}/usr/share/licenses/${2}/TensorRT-LICENSE-AGREEMENT"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${1}/usr/share/licenses/${2}/ACKNOWLEDGEMENTS"
}

package_tensorrt() {
    depends=(
        'cuda'
        'cudnn'
        'gcc-libs'
        'glibc')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    install -D -m644 build/libnvinfer_plugin_static.a -t "${pkgdir}/usr/lib"
    install -D -m644 "TensorRT-${pkgver}/lib"/libnvinfer_{builder_resource.so."${pkgver%.*}",vc_plugin_static.a} -t "${pkgdir}/usr/lib"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/lib"/libnvinfer{,_dispatch,_lean}{.so*,_static.a} "${pkgdir}/usr/lib"
    ln -s "libnvinfer_builder_resource.so.${pkgver%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so.${pkgver%%.*}"
    ln -s "libnvinfer_builder_resource.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource.so"
    
    _package_license "$pkgdir" "$pkgname"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    license=("${license[0]} AND LicenseRef-Python-TensorRT-LICENSE-AGREEMENT")
    depends=(
        'gcc-libs'
        'glibc'
        'python'
        'python-numpy'
        'tensorrt')
    optdepends=(
        'python-colored: for onnx_graphsurgeon and polygraphy python modules'
        'python-ml-dtypes: for onnx_graphsurgeon python module'
        #'python-onnx: for onnx_graphsurgeon python module'
        'python-onnxruntime: for onnx_graphsurgeon python module'
        'python-protobuf: for polygraphy python modules'
        'python-tensorflow-cuda: for polygraphy and tensorflow-quantization python modules'
        'python-tf2onnx: for tensorflow-quantization python module')
    provides=(
        #"python-onnx-graphsurgeon=${_onnx_graphsurgeon_ver}"
        "python-polygraphy=${_polygraphy_ver}"
        "python-tensorflow-quantization=${_tensorflow_quantization_ver}")
    
    python -m installer --destdir="$pkgdir" TensorRT/python/build/bindings_wheel/dist/*.whl
    
    local _dir
    for _dir in Polygraphy tensorflow-quantization #onnx-graphsurgeon
    do
        python -m installer --destdir="$pkgdir" "TensorRT/tools/${_dir}/dist"/*.whl
    done
    
    _package_license "$pkgdir" "$pkgname"
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    ln -sr "${pkgdir}${_sitepkgs}/tensorrt-${pkgver%.*}.dist-info/licenses/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Python-TensorRT-LICENSE-AGREEMENT"
}
