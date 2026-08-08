# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=tensorrt
pkgname=(
    'tensorrt'
    'tensorrt-cross-builder-libs'
    'python-tensorrt')
pkgver=11.2.1.2
_cudaver=13.3
_protobuf_ver=3.20.3 # https://github.com/NVIDIA/TensorRT/blob/v11.2/CMakeLists.txt#L321
_onnx_graphsurgeon_ver=0.6.2
_polygraphy_ver=0.49.27
_tensorflow_quantization_ver=0.2.0
pkgrel=1
pkgdesc='A platform for high-performance deep learning inference on NVIDIA hardware'
arch=('x86_64')
url='https://developer.nvidia.com/tensorrt/'
license=('Apache-2.0 AND LicenseRef-TensorRT-LICENSE-AGREEMENT')
makedepends=(
    'cmake'
    'cuda'
    'cudnn'
    'git'
    'nvidia-utils' # for satisfying namcap
    'python'
    'python-build'
    'python-installer'
    'python-ml-dtypes'
    'python-onnx'
    'python-pip'
    'python-setuptools'
    'python-typing_extensions'
    'python-wheel')
source=("https://developer.nvidia.com/downloads/compute/machine-learning/tensorrt/${pkgver%.*}/tars/TensorRT-Enterprise-${pkgver}-Linux-${CARCH}-cuda-${_cudaver}-Release-external.tar.zst"
        "git+https://github.com/NVIDIA/TensorRT.git#tag=v$(grep -oE '[0-9]+\.[0-9]+' <<< "$pkgver" | head -n1)"
        'git+https://github.com/protocolbuffers/protobuf.git'
        'cub-nvlabs'::'git+https://github.com/NVlabs/cub.git'
        'git+https://github.com/onnx/onnx-tensorrt.git'
        'git+https://github.com/onnx/onnx.git'
        "https://github.com/google/protobuf/releases/download/v${_protobuf_ver}/protobuf-cpp-${_protobuf_ver}.tar.gz"
        'git+https://github.com/pybind/pybind11.git'
        '010-tensorrt-use-local-protobuf-sources.patch'
        '020-tensorrt-use-local-pybind11-sources.patch'
        'TensorRT-LICENSE-AGREEMENT.txt')
noextract=("protobuf-cpp-${_protobuf_ver}.tar.gz")
sha256sums=('1db0fc9f3d04dae4b9262f4dfb10a19616d88577eec7f2535ac7be01a470e807'
            '3cda5fcb6b1f7384506bc519d24e0c0ca6c4ad93bd0623e674a096cdfb366443'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e51cc8fc496f893e2a48beb417730ab6cbcb251142ad8b2cd1951faa5c76fe3d'
            'SKIP'
            'ba94c0685216fe9566f7989df98b372e72a8da04b66d64380024107f2f7f4a8f'
            '34e9eeb150e9682bd42bebd31aef8b66b1150b6a8774c488687ea38273a9b409'
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
    
    # protobuf
    mkdir -p build/third_party.protobuf/src
    cp -af "protobuf-cpp-${_protobuf_ver}.tar.gz" build/third_party.protobuf/src

    patch -d TensorRT -Np1 -i "${srcdir}/010-tensorrt-use-local-protobuf-sources.patch"
    patch -d TensorRT -Np1 -i "${srcdir}/020-tensorrt-use-local-pybind11-sources.patch"
}

build() {
    local _cudnnver
    _cudnnver="$(LC_ALL='C' pacman -Qi 'cudnn' | awk '/^Version/ { print $3 }' | grep -oE '^[0-9]+\.[0-9]+')"
    
    export CXXFLAGS+=' -ffat-lto-objects'
    cmake -B build -S TensorRT \
        -G 'Unix Makefiles' \
        -DBUILD_PYTHON:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_CUDA_ARCHITECTURES:STRING='75;80;86;87;89;90;100;103;110;120;121' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCUDA_INCLUDE_DIR:STRING='/opt/cuda/include' \
        -DCUDNN_VERSION:STRING="$_cudnnver" \
        -DONNX_BUILD_PYTHON:BOOL='ON' \
        -DPROTOBUF_VERSION:STRING="$_protobuf_ver" \
        -DTRT_LIB_DIR:STRING="${srcdir}/TensorRT-${pkgver}/lib" \
        -Wno-author
    cmake --build build
    
    # python tools
    local _dir
    for _dir in Polygraphy tensorflow-quantization onnx-graphsurgeon
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
        'glibc'
        'libgcc'
        'libstdc++'
        'nvidia-utils')
    optdepends=(
        'tensorrt-cross-builder-libs: for cross building engine files')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 "TensorRT-${pkgver}/bin"/* -t "${pkgdir}/usr/bin"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/include" "${pkgdir}/usr"
    cp -dr --no-preserve='ownership' "TensorRT-${pkgver}/lib"/lib{nvinfer{,_dispatch,_lean},tensorrt_shim}.so* "${pkgdir}/usr/lib"
    
    local _arch
    for _arch in ptx sm{75,80,86,89,90,100,120}
    do
        install -D -m644 "TensorRT-${pkgver}/lib/libnvinfer_builder_resource_${_arch}.so.${pkgver%.*}" -t "${pkgdir}/usr/lib"
        ln -s "libnvinfer_builder_resource_${_arch}.so.${pkgver%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource_${_arch}.so.${pkgver%%.*}"
        ln -s "libnvinfer_builder_resource_${_arch}.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource_${_arch}.so"
    done
    
    mv -f "${pkgdir}/usr/python" "$srcdir"
    
    _package_license "$pkgdir" "$pkgname"
}

package_tensorrt-cross-builder-libs() {
    pkgdesc='Additional TensorRT libraries for cross building engine files'
    license=('LicenseRef-TensorRT-LICENSE-AGREEMENT')
    depends=(
        'glibc'
        'libgcc'
        'libstdc++')
    options=('!strip')
    
    local _arch
    for _arch in ptx sm{75,80,86,89,90,100,120}
    do
        install -D -m644 "TensorRT-${pkgver}/lib/libnvinfer_builder_resource_win_${_arch}.so.${pkgver%.*}" -t "${pkgdir}/usr/lib"
        ln -s "libnvinfer_builder_resource_win_${_arch}.so.${pkgver%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource_win_${_arch}.so.${pkgver%%.*}"
        ln -s "libnvinfer_builder_resource_win_${_arch}.so.${pkgver%%.*}" "${pkgdir}/usr/lib/libnvinfer_builder_resource_win_${_arch}.so"
    done
    
    _package_license "$pkgdir" "$pkgname"
}

package_python-tensorrt() {
    pkgdesc+=' (python bindings and tools)'
    license=("${license[0]} AND LicenseRef-Python-TensorRT-LICENSE-AGREEMENT")
    depends=(
        'glibc'
        'libgcc'
        'libstdc++'
        'python'
        'python-numpy'
        'tensorrt')
    optdepends=(
        'python-colored: for onnx_graphsurgeon and polygraphy python modules'
        'python-ml-dtypes: for onnx_graphsurgeon python module'
        'python-onnx: for onnx_graphsurgeon python module'
        'python-onnxruntime: for onnx_graphsurgeon python module'
        'python-protobuf: for polygraphy python module'
        'python-pytorch: for polygraphy python module'
        'python-tensorflow-cuda: for polygraphy and tensorflow-quantization python modules'
        'python-tf2onnx: for tensorflow-quantization python module')
    provides=(
        "python-onnx-graphsurgeon=${_onnx_graphsurgeon_ver}"
        "python-polygraphy=${_polygraphy_ver}"
        "python-tensorflow-quantization=${_tensorflow_quantization_ver}")
    
    python -m installer --destdir="$pkgdir" python/*.whl
    
    local _dir
    for _dir in Polygraphy tensorflow-quantization onnx-graphsurgeon
    do
        python -m installer --destdir="$pkgdir" "TensorRT/tools/${_dir}/dist"/*.whl
    done
    
    _package_license "$pkgdir" "$pkgname"
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    ln -sr "${pkgdir}${_sitepkgs}/tensorrt-${pkgver}.dist-info/licenses/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Python-TensorRT-LICENSE-AGREEMENT"
}
