# Maintainer: Lumaku <lumaku@mailbox.org>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
pkgname=python-huggingface-hub-git
pkgver=1.21.0.r2538.g1e41293
pkgrel=1
pkgdesc='Client library to download and publish models on the huggingface.co hub'
arch=('any')
url='https://github.com/huggingface/huggingface_hub'
license=('Apache-2.0')
depends=(
    'python'
    'python-click'
    'python-filelock'
    'python-fsspec'
    'python-httpx'
    'python-packaging'
    'python-pyyaml'
    'python-tqdm'
    'python-typer'
    'python-typing_extensions'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-env'
    'python-pytest-mock'
    'python-pytest-xdist'
    'python-jedi'
)
optdepends=(
    'python-torch: PyTorch-related features'
    'python-gradio: Gradio-related features'
    'python-authlib: OAuth support'
    'python-fastapi: OAuth support'
    'python-hf-xet: Xet storage backend'
    'python-jinja: Model/dataset cards templating'
    'python-numpy: Inference features'
    'python-pillow: Inference image features'
    'python-toml: fastai utilities'
)
provides=("python-huggingface-hub=${pkgver}")
conflicts=("python-huggingface-hub")
source=("${pkgname}::git+${url}")
b2sums=('SKIP')


pkgver() {
    cd "${pkgname}"
    local _ver _rev _sha
    _ver="$(git tag --list 'v*' --sort=-version:refname | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | head -1 | sed 's/^v//')"
    _rev="$(git rev-list --count HEAD)"
    _sha="$(git rev-parse --short=7 HEAD)"
    printf "%s.r%s.g%s" "${_ver}" "${_rev}" "${_sha}"
}


prepare() {
    cd "${pkgname}"
    git clean -dfx
}


build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}


check() {
    cd "${pkgname}"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" --ignore=tests/fixtures
}


package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:

