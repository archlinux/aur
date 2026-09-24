# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=tensorrt
pkgname=(
    'tensorrt'
    'tensorrt-cross-builder-libs'
    'python-tensorrt')
pkgver=11.3.0.99
_cudaver=13.4
_onnx_graphsurgeon_ver=0.6.2
_polygraphy_ver=0.53.6
_tensorflow_quantization_ver=2.2.1
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
        'git+https://github.com/pybind/pybind11.git'
        '010-tensorrt-use-local-pybind11-sources.patch'
        'TensorRT-LICENSE-AGREEMENT.txt')
sha256sums=('c383126a0e51e5962afac9caf97149a3c1908bf6b4e0ccc781a6eb6d984bf0c6'
            '9998b5f3b7ed8507709110c98b2d6c9cf279454e6c238165ffb27806d0492438'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0fe65836ca64e5b360ba5abb5db64e74266b98aa6287d2d4f1c686861acc2d2c'
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
    
    git -C TensorRT restore --source='v11.2' python/packaging/bindings_wheel/pyproject.toml
    git -C TensorRT restore --source='v11.2' tools/Polygraphy/setup.py
    
    patch -d TensorRT -Np1 -i "${srcdir}/010-tensorrt-use-local-pybind11-sources.patch"
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
        -DCMAKE_PREFIX_PATH:PATH="${srcdir}/TensorRT-${pkgver}" \
        -DCUDA_INCLUDE_DIR:STRING='/opt/cuda/include' \
        -DONNX_BUILD_PYTHON:BOOL='ON' \
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
