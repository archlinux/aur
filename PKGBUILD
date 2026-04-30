# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-maintainer: Evert Vorster <evorster at gmail dot com>

pkgname="coqui-tts"
_pkgname="${pkgname/-/_}"
pkgver=0.27.5
pkgrel=1
pkgdesc="Deep learning for Text to Speech"
url="https://github.com/idiap/coqui-ai-TTS"
license=("MPL-2.0")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts" "tts")
replaces=("python-tts" "tts")
depends=("python"
         "python-numpy"
         "python-scipy"
         "python-pytorch"
         "python-torchaudio"
         "python-torchcodec"
         "python-soundfile"
         "python-librosa"
         "python-numba"
         "python-inflect"
         "python-tqdm"
         "python-anyascii"
         "python-yaml"
         "python-fsspec"
         "python-aiohttp"
         "python-packaging"
         "python-pysbd"
         "python-matplotlib"
         "python-coqpit-config"
         "python-coqui-trainer"
         "python-monotonic-alignment-search"
         "python-ko-speech-tools"
         "python-einops"
         "python-transformers"
         "python-num2words"
         "python-typing_extensions"
         )
makedepends=("python-build" "python-installer" "python-wheel" "python-hatchling")
optdepends=("python-umap-learn: for notebooks"
            "python-pandas: for notebooks"
            "python-flask: for running the TTS server"
            "python-gruut: for german, spanish, french"
            "python-jieba: for chinese"
            "pypinyin: for chinese"
            "python-mecab: for japanese"
            "python-unidic-lite: for japanese"
            "python-jamo-git: for korean"
            "python-nltk: for korean"
            #"python-g2pkk: for korean"
            #"python-bangla: for bangla"
            #"python-bnnumerizer: for bangla"
            #"python-bnunicodenormalizer: for bangla"
            #"python-k_diffusion: for tortoise"
)
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('d49f9804e5b6faaf90fcc32f64e4a32bd47eb8168dbb6cb3fd430bf0483fddb09f13664f460a38daabb6f2dc3546dceec579b62e7c8a47f33c0e3858ce263d23')

prepare(){
 cd "$_pkgname-$pkgver"
 # transformers 5 removed isin_mps_friendly; PyTorch 2.4+ provides torch.isin.
 sed -i 's/from transformers\.pytorch_utils import isin_mps_friendly as isin/isin = torch.isin/' TTS/tts/layers/tortoise/autoregressive.py
}

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
