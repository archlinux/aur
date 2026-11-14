# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname=python-webdataset
_name=webdataset
# Upstream published 1.0.2 to PyPI without a Git tag. This is its exact
# version-bump commit ("Bump version: 1.0.1 -> 1.0.2", 2025-06-19).
_commit=0773837ecd298587fc89c4f944ef346ef1a6b619
pkgver=1.0.2
pkgrel=1
pkgdesc="High performance storage and I/O for deep learning and data processing"
arch=('any')
url="https://github.com/webdataset/webdataset"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-braceexpand'
    'python-numpy'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-imageio'
    'python-lmdb'
    'python-msgpack'
    'python-pillow'
    'python-pytest'
    'python-pytorch'
    'python-torchvision'
)
optdepends=(
    'python-pytorch: PyTorch IterableDataset, WebLoader and DataLoader integration'
    'python-pillow: image decoding and encoding'
    'python-torchvision: video decoding'
    'python-torchaudio: audio decoding'
    'python-msgpack: msgpack sample fields'
    'python-cbor: cbor sample fields'
    'python-lmdb: LMDB-backed sample caching'
    'python-pyzmq: multi-process loader (webdataset.multi)'
    'python-typeguard: runtime type checking helpers'
    'python-huggingface-hub: hf:// shard URLs'
    'curl: http, https, sftp and scp shard URLs'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/webdataset/webdataset/archive/$_commit.tar.gz")
sha256sums=('bcd142704bac5f4ae38b03af1ad741ac9c2f32111ab519896715098efa27977c')

build() {
    cd "$_name-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$_commit"
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    export PYTHONPATH="$srcdir/_check$_site"
    export CUDA_VISIBLE_DEVICES='' OMP_NUM_THREADS=2

    # Every case below streams shards from storage.googleapis.com (or another
    # live host); the rest of the suite uses the local testdata/ shards.
    local _remote=(
        tests/test_cache.py::TestStreamingOpen::test_remote_file
        tests/test_cache.py::TestFileCache::test_remote_file
        tests/test_compat.py::test_decoder
        tests/test_compat.py::test_cache_dir
        tests/test_compat.py::test_shard_syntax
        tests/test_compat.py::test_torchvision
        tests/test_compat.py::test_batched
        tests/test_compat.py::test_unbatched
        tests/test_decode.py::test_handlers
        tests/test_handlers.py::test_missing_throws2
        tests/test_loaders.py::test_dataloader
        tests/test_pipeline.py::test_dataloader
        tests/test_pipeline.py::test_decode_handlers
        tests/test_pipeline.py::test_decoder
        tests/test_pipeline.py::test_pipe
        tests/test_pipeline.py::test_torchvision
        tests/test_pipeline.py::test_batched
        tests/test_pipeline.py::test_unbatched
    )
    local _deselect=()
    local _test
    for _test in "${_remote[@]}"; do
        _deselect+=(--deselect "$_test")
    done
    python -m pytest -v -p no:cacheprovider "${_deselect[@]}" tests

    # Package-level check: write shards, read them back through the decoded
    # pipeline and a PyTorch DataLoader with worker processes. Python 3.14
    # starts the workers with forkserver, which re-imports the main module,
    # so this runs as a script file with a main guard, as user code must.
    cat > "$srcdir/_check_roundtrip.py" <<'PY'
import tempfile
from pathlib import Path

import numpy as np
import torch
import webdataset as wds


def main():
    assert "/_check/" in wds.__file__, wds.__file__
    with tempfile.TemporaryDirectory() as directory:
        pattern = str(Path(directory, "shard-%06d.tar"))
        with wds.ShardWriter(pattern, maxcount=10) as sink:
            for index in range(25):
                sink.write({"__key__": f"sample{index:04d}",
                            "npy": np.full((3, 4), index, dtype=np.float32),
                            "cls": index % 5,
                            "json": {"index": index}})
        shards = sorted(Path(directory).glob("shard-*.tar"))
        assert [p.name for p in shards] == ["shard-000000.tar", "shard-000001.tar", "shard-000002.tar"]
        urls = str(Path(directory, "shard-{000000..000002}.tar"))
        dataset = (wds.WebDataset(urls, shardshuffle=False)
                   .decode()
                   .to_tuple("npy", "cls", "json"))
        loader = torch.utils.data.DataLoader(dataset, batch_size=None, num_workers=2)
        seen = sorted((int(cls), meta["index"], float(array[0, 0])) for array, cls, meta in loader)
        assert seen == sorted((i % 5, i, float(i)) for i in range(25)), seen
    print("staged WebDataset shard write/read and DataLoader round trip passed")


if __name__ == "__main__":
    main()
PY
    python "$srcdir/_check_roundtrip.py"
}

package() {
    cd "$_name-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
