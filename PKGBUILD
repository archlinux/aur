# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=tensorrt
pkgname=('tensorrt' 'python-tensorrt')
pkgver=9.2.0.5
_commit=7cb87c8983309c91ab66d5cd082bb5bb40026649
_cudaver=12.2
_protobuf_ver=3.20.1
_pybind11_ver=2.9.2
_python_build=post12.dev5
_onnx_graphsurgeon_ver=0.4.0
_polygraphy_ver=0.49.0
_tensorflow_quantization_ver=0.2.0
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('custom: NVIDIA TensorRT SLA' 'Apache')
makedepends=('git' 'cmake' 'cuda' 'cudnn' 'python' 'python-build' 'python-installer' 'python-onnx'
             'python-setuptools' 'python-wheel')
source=("https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/${pkgver%.*}/tensorrt-${pkgver}.linux.${CARCH}-gnu.cuda-${_cudaver}.tar.gz"
        "git+https://github.com/NVIDIA/TensorRT.git#commit=${_commit}"
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
sha256sums=('3dd505a9e0d0adf9257080b543f51d91df736dbd1f75417b9dde1a7b7a5d87f2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'dddd73664306d7d895a95e1cf18925b31b52785e468727e4635b45edae5166f9'
            'ba94c0685216fe9566f7989df98b372e72a8da04b66d64380024107f2f7f4a8f'
            'bb17f9b11fe3d95fe0dfcf0ca2f5bd9fdb80e31e0ae1153c88162f2c54830f2b'
            '5f68360b4ac4758d207e30fec89c5e829d45bb4c27cae99e3fa6d2b170789370')

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
        -DCUDNN_ROOT_DIR='/usr' \
        -DGPU_ARCHS='50 52 53 60 61 62 70 72 75 80 86 87 89 90' \
        -DPROTOBUF_VERSION="$_protobuf_ver" \
        -Wno-dev
    cmake --build build
    
    # python bindings (fails to build with python 3.11)
    #local _pyver
    #_pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    #local -x PYTHON_MAJOR_VERSION="${_pyver%%.*}"
    #local -x PYTHON_MINOR_VERSION="${_pyver#*.}"
    #local -x TARGET_ARCHITECTURE="$CARCH"
    #local -x TRT_OSSPATH="${srcdir}/TensorRT"
    #local -x CUDA_ROOT='/opt/cuda'
    #local -x ROOT_PATH="${srcdir}/TensorRT"
    #local -x EXT_PATH="$srcdir"
    #local -x TRT_NONOSS_ROOT="${srcdir}/TensorRT-${pkgver}"
    #git -C pybind11 checkout "v${_pybind11_ver}"
    #cd TensorRT/python
    #./build.sh
    
    # python tools (pytorch-quantization currently fails to build)
    local _dir
    for _dir in onnx-graphsurgeon Polygraphy tensorflow-quantization #pytorch-quantization
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
    
    install -D -m644 TensorRT/NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 TensorRT-SLA.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    license=('custom' 'Apache')
    depends=('python' 'python-numpy' 'tensorrt')
    optdepends=('python-onnx: for onnx_graphsurgeon python module'
                'python-onnxruntime: for onnx_graphsurgeon and polygraphy python modules'
                'python-protobuf: for polygraphy and tensorflow-quantization python modules'
                'python-tensorflow-cuda: for polygraphy python module'
                'python-tf2onnx: for tensorflow-quantization python module')
    provides=("python-onnx-graphsurgeon=${_onnx_graphsurgeon_ver}"
              "python-polygraphy=${_polygraphy_ver}"
              "python-tensorflow-quantization=${_tensorflow_quantization_ver}")
    
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    python -m installer --destdir="$pkgdir" "TensorRT-${pkgver}/python/tensorrt-${pkgver%.*}.${_python_build}-cp${_pyver/./}-none-linux_${CARCH}.whl"
    
    local _dir
    for _dir in TensorRT/tools/{onnx-graphsurgeon,Polygraphy,tensorflow-quantization}/dist
    do
        cd "${srcdir}/${_dir}"
        python -m installer --destdir="$pkgdir" *.whl
    done
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])' | sed 's|^/usr/|../../../|')"
    install -D -m644 "${srcdir}/TensorRT/NOTICE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "${srcdir}/TensorRT-SLA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-NVIDIA-TENSORRT-SLA"
    install -D -m644 "${srcdir}/TensorRT-${pkgver}/doc/Acknowledgements.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ACKNOWLEDGEMENTS"
    ln -s "${_sitepkgs}/tensorrt-${pkgver%.*}.${_python_build}.dist-info/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-python-tensorrt"
}
