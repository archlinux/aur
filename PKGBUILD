# Maintainer: Julian Reyes <contacto@julianreyes.co>
# Contributor: Roald Clark <roaldclark@gmail.com>

pkgname=krita-ai-diffusion
pkgver=1.53.0.r6.gdda58d1
pkgrel=1
pkgdesc="A plugin to use generative AI in image painting and editing workflows from within Krita"
arch=('any')
url="https://github.com/Acly/krita-ai-diffusion"
license=('GPL-3.0-or-later')
depends=(
    'krita'
    'python-pyqt6'
    'qt6-imageformats'
)
makedepends=(
    'git'
    'git-lfs'
    'uv'
)
checkdepends=(
    'openssl'
)
install=krita-ai-diffusion.install
_commit=dda58d1c63e361207ccec085efbc34dbd32f1654
source=("${pkgname}::git+${url}.git#commit=${_commit}"
        "fix-it-json-syntax.patch")
sha256sums=('cc8354e0d0e19a417950e6825bb9974fe9cb3dc34c5206c0f4dcec12c3781025'
            '55fdda2a4349e4a271cf7dc5bd5d2171d6a1c18ab19bad58f0d033e0a8cf51ef')

# If `git lfs install` was run before, `makepkg` may error
# Set this env var to resolve
export GIT_LFS_SKIP_SMUDGE=1

prepare() {
    # The plugin itself will run inside Krita's embedded Python,
    # and only has access to the Python standard library and Qt5
    cd "${srcdir}/${pkgname}"
    patch -Np1 -i ../fix-it-json-syntax.patch
    git submodule update --init --recursive
    git lfs install --local
    git remote add network-origin "${url}.git"
    git lfs fetch network-origin
    git lfs checkout
    uv venv --python 3.12 .venv
    source .venv/bin/activate
    uv pip install -r requirements.txt
}

build() {
    cd "${srcdir}/${pkgname}"
    source .venv/bin/activate
    python scripts/package.py
}

check() {
    cd "${srcdir}/${pkgname}"
    source .venv/bin/activate
    if [[ $(vercmp "${pkgver}" "1.21.0") -gt 0 ]]; then
        python scripts/download_models.py --minimal scripts/downloads
    else
        python scripts/download_models.py --minimal scripts/docker/downloads
    fi
    python -m pytest tests/test_server.py -vs --test-install
    python -m pytest tests -vs --ci
}

package() {
    cd "${srcdir}/${pkgname}"/scripts/.package
    install -d -m 755 "${pkgdir}"/usr/share/krita/pykrita/
    cp -r {ai_diffusion,ai_diffusion.desktop} "${pkgdir}"/usr/share/krita/pykrita/
    install -D -m 644 ai_diffusion/ai_diffusion.action -t "${pkgdir}"/usr/share/krita/actions/
}
