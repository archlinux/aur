# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Actionless Loveless <actionless DOT loveless PLUS aur AT gmail MF com>

_pkgname="python-tts"
pkgname="${_pkgname}-git"
pkgver=0.22.0.r9.gdbf1a08a
pkgrel=3
pkgdesc="Coqui deep learning toolkit for Text-to-Speech, battle-tested in research and production"
url="https://github.com/coqui-ai/TTS"
license=("MPL2")
arch=("any")
provides=("tts" "$_pkgname")
conflicts=("$_pkgname")
depends=("cython"
         "python"
         "python-numpy"
         "python-scipy"
         "python-pytorch"
         "python-torchaudio"
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
         "python-flask"
         "python-pysbd"
         "python-coqui-trainer"
         "python-coqpit"
         "python-gruut"
         "python-jieba"
         "pypinyin"
         "python-jamo-git"
         "python-bangla"
         "python-bnnumerizer"
         "python-bnunicodenormalizer"
         "python-mutagen"
)
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("python-umap-learn: for notebooks"
            "python-pandas: for notebooks"
            "python-matplotlib: for training"
            "python-mecab: for japanese"
            "python-unidic-lite: for japanese"
            "python-nltk: for korean"
            #"python-g2pkk: for korean"
            #"python-k_diffusion: for tortoise"
            "python-einops: for tortoise"
            "python-transformers: for tortoise"
)
options=("!strip")
source=(
    "$_pkgname::git+https://github.com/coqui-ai/TTS/"
    headless.patch
)
b2sums=('SKIP'
        '41813f228115bbe34b868d0cdf7b069c3eef4d51a1d32f9cc3c2698c5007cc5a43c06e53cf5ea297631e577ba8c285f33a8e8c191f16ba0a1184006a0fbeadba')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit 2
    set -o pipefail
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g' || echo 0.0.1
}


prepare(){
    cd "${srcdir}/${_pkgname}" || exit 2
    # remove hardcoded versions
    git checkout -- '*'
    sed -i "setup.py" \
        -e "s|3.12|4.0|g"
    sed -i "requirements.txt" \
        -re "s|cython==[0-9]+\.[0-9]+\.[0-9]+|cython|g" \
        -re "s|numpy==[0-9]+\.[0-9]+\.[0-9]+|numpy|g"
    sed -i "pyproject.toml" \
        -re 's|"cython.*",|"cython",|g' \
        -re "s|numpy==[0-9]+\.[0-9]+\.[0-9]+|numpy|g"
    # apply patch for using the lib on headless server:
    git apply "${srcdir}/headless.patch"
}

build(){
    cd "${srcdir}/${_pkgname}" || exit 2
    python -m build --wheel --no-isolation
}

package(){
    cd "${srcdir}/${_pkgname}" || exit 2
    python -m installer --destdir="$pkgdir" dist/*.whl
}
