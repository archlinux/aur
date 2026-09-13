# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-onnx-simplifier
_pkgname=onnxsim
pkgver=0.7.3
pkgrel=1
pkgdesc='Simplify your ONNX model by removing redundant operators'
arch=('x86_64')
url='https://github.com/onnxsim/onnxsim'
license=('Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'MIT')
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'python'
    'python-numpy'
    'python-onnx'
    'python-onnxruntime'
    'python-protobuf'
    'python-rich'
    'python-typing_extensions'
)
makedepends=(
    'cmake'
    'nanobind'
    'ninja'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-onnxscript'
    'python-pytest'
    'python-pytorch'
    'python-torchvision'
)
optdepends=(
    'python-pytorch: export and simplify PyTorch models with onnxsim.test_utils'
)
provides=('python-onnxsim')
# The stable-ABI wheel contains no usable debug symbols; makepkg would
# otherwise create an empty debug package with a dangling build-id symlink.
options=('!debug')
_optimizer_commit=972c91efc7f21e4ea8e36036bf3e1794ee36ec6d
_onnx_commit=512e5d4e7836f0a9147d4df7c86f258b8f393965
_protobuf_version=31.1
_abseil_version=20250127.0
source=(
    "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "onnx-optimizer-$_optimizer_commit.tar.gz::https://github.com/onnx/optimizer/archive/$_optimizer_commit.tar.gz"
    "onnx-$_onnx_commit.tar.gz::https://github.com/onnx/onnx/archive/$_onnx_commit.tar.gz"
    "protobuf-$_protobuf_version.tar.gz::https://github.com/protocolbuffers/protobuf/releases/download/v$_protobuf_version/protobuf-$_protobuf_version.tar.gz"
    "abseil-cpp-$_abseil_version.tar.gz::https://github.com/abseil/abseil-cpp/archive/refs/tags/$_abseil_version.tar.gz"
    'offline-torchvision-tests.patch'
)
sha256sums=(
    'd1d84518a430be1ca0a7c8b17bbea0b09fa6c6365cac71b28289a81e78df3f52'
    'f540cef42ba15d3d05d5a3fc98c4fab51871ac4069ea354721d8fce2af038243'
    'dc21e3dea21bb296d29ae11b0c567ab38b2492e59bc0dae55f7c96dc6d21860b'
    '12bfd76d27b9ac3d65c00966901609e020481b9474ef75c7ff4601ac06fa0b82'
    '16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8'
    '7bdac7e41b8d71f409c2c030e37afdf429308f16015c79611d58f6c4039b68a4'
)

prepare() {
    cd "$_pkgname-$pkgver"

    # GitHub release archives do not include submodules. Populate the exact
    # commits recorded by the v0.7.3 tag from separately checksummed sources.
    rm -rf third_party/onnx-optimizer
    install -d third_party/onnx-optimizer/third_party/onnx
    cp -a "$srcdir/optimizer-$_optimizer_commit/." third_party/onnx-optimizer/
    rm -rf third_party/onnx-optimizer/third_party/onnx
    install -d third_party/onnx-optimizer/third_party/onnx
    cp -a "$srcdir/onnx-$_onnx_commit/." \
        third_party/onnx-optimizer/third_party/onnx/

    # Shape(start/end) creates a sliced dimension vector. The optimizer must
    # index that vector, not the unsliced input dimensions, for a later Slice.
    sed -i 's/const auto \&d = dims_of_shape_node_input\[slice_start\];/const auto \&d = result_of_shape_op[slice_start];/g' \
        third_party/onnx-optimizer/onnxoptimizer/passes/eliminate_slice_after_shape.h
    # Reshape is only composable when the second shape does not copy zero
    # dimensions from the intermediate tensor. Unknown shapes may contain
    # such zeros too; preserve the first reshape unless safety is proven.
    python - <<'PY'
from pathlib import Path
p=Path('third_party/onnx-optimizer/onnxoptimizer/passes/eliminate_consecutive_idempotent_ops.h')
s=p.read_text()
old='''          node->input(0)->uses().size() == 1) {
        return true;'''
new='''          node->input(0)->uses().size() == 1) {
        if (node->kind() == kReshape &&
            !(node->hasAttribute(Symbol("allowzero")) &&
              node->i(Symbol("allowzero")) == 1)) {
          const auto* shape = FetchConstantTensor(node->input(1));
          if (!shape || shape->elem_type() != TensorProto_DataType_INT64)
            return false;
          for (const auto dim : ParseTensorData<int64_t>(shape))
            if (dim == 0) return false;
        }
        return true;'''
assert s.count(old)==1
p.write_text(s.replace(old,new))
PY
    install -m644 /dev/stdin tests/test_shape_slice_regression.py <<'PY'
import numpy as np
import onnxruntime as ort
import pytest
from onnx import TensorProto, helper
from onnxsim import simplify
from onnxsim.onnx_simplifier import C

@pytest.mark.parametrize('step,end', [(1, 1), (-1, -3)])
def test_slice_uses_shape_start_offset(step, end):
    constants = [helper.make_tensor(name, TensorProto.INT64, [1], [value])
                 for name, value in [('starts', 0), ('ends', end), ('axes', 0), ('steps', step)]]
    model = helper.make_model(helper.make_graph([
        helper.make_node('Shape', ['x'], ['shape'], start=1),
        helper.make_node('Slice', ['shape', 'starts', 'ends', 'axes', 'steps'], ['y']),
    ], 'shape_slice', [helper.make_tensor_value_info('x', TensorProto.FLOAT, [2, 3, 'N'])],
    [helper.make_tensor_value_info('y', TensorProto.INT64, [1])], initializer=constants),
    opset_imports=[helper.make_opsetid('', 18)], ir_version=10)
    optimized, _ = simplify(model, skip_constant_folding=True,
        skipped_optimizers=[p for p in C._list_optimizers() if p != 'eliminate_slice_after_shape'])
    for graph in (model, optimized):
        session = ort.InferenceSession(graph.SerializeToString(), providers=['CPUExecutionProvider'])
        inputs = {'x': np.zeros((2, 3, 4), dtype=np.float32)} if session.get_inputs() else {}
        np.testing.assert_array_equal(session.run(None, inputs)[0], [3])

@pytest.mark.parametrize('dynamic', [False, True])
def test_consecutive_reshape_zero_copies_intermediate_dimension(dynamic):
    inputs=[helper.make_tensor_value_info('x', TensorProto.FLOAT, ['N', 3, 4])]
    constants=[helper.make_tensor('first', TensorProto.INT64, [2], [3, -1])]
    if dynamic:
        inputs.append(helper.make_tensor_value_info('second', TensorProto.INT64, [2]))
    else:
        constants.append(helper.make_tensor('second', TensorProto.INT64, [2], [0, -1]))
    model=helper.make_model(helper.make_graph([
        helper.make_node('Reshape',['x','first'],['middle']),
        helper.make_node('Reshape',['middle','second'],['y'])
    ],'reshape_zero',inputs,[helper.make_tensor_value_info('y',TensorProto.FLOAT,[3,None])],initializer=constants),
    opset_imports=[helper.make_opsetid('',18)],ir_version=10)
    optimized,_=simplify(model,skip_constant_folding=True,
        skipped_optimizers=[p for p in C._list_optimizers() if p!='eliminate_consecutive_idempotent_ops'])
    x=np.arange(24,dtype=np.float32).reshape(2,3,4)
    for graph in (model,optimized):
        session=ort.InferenceSession(graph.SerializeToString(),providers=['CPUExecutionProvider'])
        feed={'x':x}
        if dynamic: feed['second']=np.array([0,-1],dtype=np.int64)
        np.testing.assert_array_equal(session.run(None,feed)[0],x.reshape(3,8))
PY

    # The release archive's VERSION file is stale (0.6.2).
    printf '%s\n' "$pkgver" > VERSION

    # torchvision's deprecated pretrained=False leaves pretrained backbone
    # weights enabled in current releases, causing four tests to access the
    # network. Explicit None values preserve those tests as offline coverage.
    patch -Np1 -i "$srcdir/offline-torchvision-tests.patch"
}

build() {
    cd "$_pkgname-$pkgver"

    # A private static protobuf avoids duplicate ONNX descriptor registration
    # with python-onnx's protobuf at import time. Supply protobuf and the Abseil
    # version it fetches as local sources so CMake cannot access the network.
    export CMAKE_GENERATOR=Ninja
    export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-$(nproc)}"
    export CMAKE_ARGS="\
        -DONNXSIM_BUILTIN_ORT=OFF \
        -DONNX_OPT_USE_SYSTEM_PROTOBUF=OFF \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_PROTOBUF=$srcdir/protobuf-$_protobuf_version \
        -DFETCHCONTENT_SOURCE_DIR_ABSL=$srcdir/abseil-cpp-$_abseil_version"
    export ONNXSIM_RELEASE="$pkgver"

    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _site_packages
    _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/test-root" "$srcdir/test-run"
    python -m installer --destdir="$srcdir/test-root" dist/*.whl
    install -d "$srcdir/test-run"
    cp -a tests "$srcdir/test-run/"
    # QNN tests import their source-shipped helpers before applying the
    # upstream unavailable-provider skip. Preserve that relative layout.
    cp -a scripts "$srcdir/test-run/"
    cd "$srcdir/test-run"

    # test_timm.py unconditionally downloads pretrained Swin weights from the
    # live network. All self-contained upstream tests run against the staged wheel.
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        PATH="$srcdir/test-root/usr/bin:$PATH" \
        python -m pytest -v tests --ignore=tests/test_timm.py

    # Exercise the staged wheel on a representative constant-folding workflow.
    PYTHONPATH="$srcdir/test-root$_site_packages" \
        PATH="$srcdir/test-root/usr/bin:$PATH" \
        python - <<'PY'
import numpy as np
import onnx
import onnxruntime as ort
from onnx import TensorProto, helper, numpy_helper
from onnxsim import simplify

x = helper.make_tensor_value_info("x", TensorProto.FLOAT, [2])
y = helper.make_tensor_value_info("y", TensorProto.FLOAT, [2])
c2 = numpy_helper.from_array(np.array([2.0], dtype=np.float32), name="c2")
c3 = numpy_helper.from_array(np.array([3.0], dtype=np.float32), name="c3")
graph = helper.make_graph(
    [
        helper.make_node("Add", ["c2", "c3"], ["c5"]),
        helper.make_node("Mul", ["x", "c5"], ["y"]),
    ],
    "constant-folding",
    [x],
    [y],
    [c2, c3],
)
model = helper.make_model(
    graph, opset_imports=[helper.make_opsetid("", 13)], ir_version=10
)
simplified, check_ok = simplify(model, check_n=1)
assert check_ok
assert [node.op_type for node in simplified.graph.node] == ["Mul"]
onnx.checker.check_model(simplified)
session = ort.InferenceSession(
    simplified.SerializeToString(), providers=["CPUExecutionProvider"]
)
actual = session.run(None, {"x": np.array([1.0, 4.0], dtype=np.float32)})[0]
np.testing.assert_allclose(actual, np.array([5.0, 20.0], dtype=np.float32))
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
        third_party/onnx-optimizer/third_party/onnx/LICENSES/BSD-2-Clause.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD-2-Clause"
    install -Dm644 "$srcdir/protobuf-$_protobuf_version/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.protobuf"
    install -Dm644 "$srcdir/protobuf-$_protobuf_version/third_party/utf8_range/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.utf8-range"
    install -Dm644 "$srcdir/abseil-cpp-$_abseil_version/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.abseil"
    install -Dm644 /usr/share/licenses/nanobind/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.nanobind"
}
