# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>

_name=tensorboardx
pkgname=python-tensorboardx
pkgver=2.6.5
pkgrel=2
pkgdesc="Tensorboard for PyTorch"
arch=('any')
url="https://github.com/lanpa/tensorboardX"
license=('MIT')
depends=(
    'python'
    'python-numpy'
    'python-packaging'
    'python-protobuf'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
checkdepends=(
    'python-crc32c'
    'python-matplotlib'
    'python-onnx'
    'python-pillow'
    'python-pytest'
    'python-pytorch'
    'python-soundfile'
    'ruff'
    'tensorboard'
)
optdepends=(
    'python-crc32c: speed up'
    'python-matplotlib: render matplotlib figures'
    'python-onnx: log ONNX graphs'
    'python-pillow: image, embedding and Comet image support'
    'python-pytorch: log PyTorch graphs and tensors'
    'python-soundfile: 200x speed up the add_audio() function'
)
_archive="tensorboardX-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c6f18c3612786e2a23c34ac16de99ee88de1ff7227e5e665855da6eefb7b8054')

build() {
    cd "${srcdir}/${_archive}"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_archive}"

    local _check="${srcdir}/_check"
    local _site
    rm -rf "${_check}"
    python -m installer --destdir="${_check}" dist/*.whl
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    # Run the upstream suite against the staged wheel. Only the two S3 modules
    # are excluded: upstream pins moto<5, while Arch provides moto 5.x, and S3
    # support is not part of TensorBoardX's declared core dependencies.
    PYTHONPATH="${_check}${_site}" pytest -v tests \
        --ignore=tests/test_embedding.py \
        --ignore=tests/test_record_writer.py

    # Write a real event stream and decode its TFRecord-framed Event protobuf,
    # proving that the installed writer preserves tag, step and scalar value.
    PYTHONPATH="${_check}${_site}" python - <<'PY'
import struct
import tempfile
from pathlib import Path

from tensorboardX import SummaryWriter
from tensorboardX.proto.event_pb2 import Event

with tempfile.TemporaryDirectory() as directory:
    with SummaryWriter(directory) as writer:
        writer.add_scalar("train/loss", 0.25, 7)
        writer.flush()

    events = []
    event_file = next(Path(directory).glob("events.out.tfevents.*"))
    with event_file.open("rb") as stream:
        while header := stream.read(8):
            length = struct.unpack("<Q", header)[0]
            stream.read(4)  # masked CRC of the length
            payload = stream.read(length)
            stream.read(4)  # masked CRC of the payload
            event = Event()
            event.ParseFromString(payload)
            events.append(event)

    scalar = next(
        event for event in events
        if event.summary.value and event.summary.value[0].tag == "train/loss"
    )
    assert scalar.step == 7
    assert scalar.summary.value[0].simple_value == 0.25
PY
}

package() {
    cd "${srcdir}/${_archive}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
