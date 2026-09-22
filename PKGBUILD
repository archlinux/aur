# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname=python-open-clip-torch
_pkgname=open_clip
pkgver=3.3.0
pkgrel=2
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)"
arch=('any')
url="https://github.com/mlfoundations/open_clip"
license=('MIT')
depends=(
    'python'
    'python-pytorch'
    'python-torchvision'
    'python-regex'
    'python-ftfy'
    'python-tqdm'
    'python-huggingface-hub'
    'python-numpy'
    'python-safetensors'
    'python-timm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-pdm-backend'
    # The public WebDataset recipe uses setuptools without declaring it.
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-braceexpand'
    'python-fsspec'
    'python-pandas'
    'python-pillow'
    'python-pytest'
    'python-requests'
    'python-transformers'
    # Trial the public 0.2 series with the retained shard and training tests.
    'python-webdataset>=0.2.86'
    'python-webdataset<0.3'
)
optdepends=(
    'python-pandas: for training functionality'
    'python-webdataset: for training with webdataset'
    'python-transformers: for training with transformers models'
    'python-fsspec: for remote filesystem support in training'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mlfoundations/open_clip/archive/refs/tags/v$pkgver.tar.gz"
        'webdataset-url-list.patch')
sha256sums=('5b72b5ea0a5bb4581a95d75487983fa20ebcf18b60261cc126e127f1eb1abffa'
            '201c7ffb1ed633b590c21eb1556b8d5d01060927fc19b67494924701f9b0eec7')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 --fuzz=0 -i "$srcdir/webdataset-url-list.patch"
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    local _site
    _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl

    export CUDA_VISIBLE_DEVICES=''
    export OMP_NUM_THREADS=2 MKL_NUM_THREADS=2 OPENBLAS_NUM_THREADS=2
    export PYTHONPATH="$srcdir/_check$_site:$PWD/tests"

    # These six download tests mock all network I/O. The seventh fetches a live
    # Hugging Face model and image and therefore cannot run in an offline build.
    pytest -v tests/test_download_pretrained.py \
        --deselect=tests/test_download_pretrained.py::DownloadPretrainedTests::test_download_pretrained_from_hfh

    # Pooling is self-contained; the other parametrized HF encoder cases fetch
    # four live model configurations and pretrained checkpoints.
    pytest -v tests/test_hf_model.py::test_poolers

    # Upstream regression inference requires unpublished expected-output files,
    # while inference_simple downloads multi-gigabyte pretrained checkpoints.
    # Exercise every remaining self-contained suite. MT5 training alone fetches
    # a live Hugging Face tokenizer/model; the other training tests are synthetic.
    # Python 3.14 changed POSIX multiprocessing from fork to forkserver. These
    # upstream tests intentionally use local lambda preprocessors and were
    # authored for fork, so select it explicitly for the test process.
    python -c 'import multiprocessing as mp, pytest, sys; mp.set_start_method("fork"); raise SystemExit(pytest.main(sys.argv[1:]))' \
        -v tests/test_num_shards.py tests/test_training_simple.py tests/test_wds.py \
        --deselect=tests/test_training_simple.py::test_training_mt5

    python - <<'PY'
import torch
from PIL import Image
import open_clip

torch.manual_seed(17)
model, _, preprocess = open_clip.create_model_and_transforms(
    "ViT-B-32", pretrained=None, device="cpu"
)
model.eval()
tokenizer = open_clip.get_tokenizer("ViT-B-32")
image = preprocess(Image.new("RGB", (224, 224), (48, 96, 160))).unsqueeze(0)
text = tokenizer(["a blue test image", "a red test image"])
with torch.no_grad():
    image_features = model.encode_image(image, normalize=True)
    text_features = model.encode_text(text, normalize=True)
    scores = image_features @ text_features.T
assert image_features.shape == (1, 512)
assert text_features.shape == (2, 512)
assert scores.shape == (1, 2)
assert torch.isfinite(scores).all()
assert torch.allclose(image_features.norm(dim=-1), torch.ones(1), atol=1e-5)
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
