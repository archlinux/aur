# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Actionless Loveless <actionless DOT loveless PLUS aur AT gmail MF com>

_pkgname="python-tts"
pkgname="${_pkgname}-git"
pkgver=0.22.0.r9.gdbf1a08a
pkgrel=6
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
	torch2.6.patch
)
b2sums=('SKIP'
        '1dfef5cde2f801f3b6db4b15a8f636767f32b5a0ef8bb5fe74f81fb739c5b47397226fd35dbc661ab6d57928ea9cc9fac67feeca86b473b79575696f53db4bb0'
        '002e8a8a2ac6eabab5eb203d0dfbf81719bcac6afa2a844a3a7d0ebce7707540dddafdb22242ec0a614cc0f03d3b2fcd40a946ffbf1b98a1afb738f5da57b0aa')

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
    git apply "${srcdir}/torch2.6.patch"
}

build(){
    cd "${srcdir}/${_pkgname}" || exit 2
	rm -f dist/*.whl
    python -m build --wheel --no-isolation
}

package(){
    cd "${srcdir}/${_pkgname}" || exit 2
    python -m installer --destdir="$pkgdir" dist/*.whl
}
