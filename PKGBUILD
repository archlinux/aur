# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.31.0
pkgrel=1
pkgdesc='A tool for visualizing and tracking your machine learning experiments'
arch=('x86_64')
url='https://wandb.ai'
license=('MIT')
options=(!lto)
depends=(
    'python-click'
    'python-opentelemetry-api'
    'python-opentelemetry-exporter-otlp-proto-http'
    'python-opentelemetry-sdk'
    'python-packaging'
    'python-platformdirs'
    'python-protobuf'
    'python-pydantic'
    'python-requests'
    'python-typing_extensions'
    'python-xxhash'
    'python-yaml'
)
makedepends=('cargo' 'gcc' 'go>=1.27.2' 'python-build' 'python-hatchling'
             'python-installer' 'python-wheel')
optdepends=(
    'python-boto3: AWS artifact and launch integration'
    'python-moviepy: logging videos'
    'python-numpy: logging multi-dimensional arrays'
    'python-openai: OpenAI fine-tuning integration'
    'python-pillow: logging images'
    'python-rdkit: logging cheminformatical data'
    'python-soundfile: logging audios'
)
provides=('python-wandb')
conflicts=('python-wandb-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wandb/wandb/archive/refs/tags/v$pkgver.tar.gz"
        'fix-libc-detection.patch'
        'disable-diagnostic-reporting.patch')
sha256sums=('1d8425d1c39c078ad472750afd14110000d189cf67aceb9670b9357b4fe0d347'
            'SKIP'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 < "$srcdir/fix-libc-detection.patch"
    patch -p1 < "$srcdir/disable-diagnostic-reporting.patch"
    sed -i -E 's/\.dev[0-9]+//' wandb/__init__.py{,i}

    # NOTE The preview EvalTable client is not packaged in Arch or AUR.
    sed -i '/# Pin exact cwevals version during preview as API is subject to change./,+1d' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    GOFLAGS="${GOFLAGS:+$GOFLAGS }-trimpath" python -m build -nw
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=$PWD python -c 'import wandb'
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir="$pkgdir" \
        dist/$_pkgname-$pkgver-*.whl
}
