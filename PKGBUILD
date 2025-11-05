# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-wandb
_pkgname=${pkgname#python-}
pkgver=0.22.3
pkgrel=1
pkgdesc='A tool for visualizing and tracking your machine learning experiments'
arch=('x86_64')
url='https://wandb.ai'
license=('MIT')
options=(!lto)
depends=(
    'python-click'
    'python-gitpython'
    'python-packaging'
    'python-platformdirs'
    'python-protobuf'
    'python-pydantic'
    'python-requests'
    'python-sentry_sdk'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=('cargo' 'gcc' 'go' 'python-build' 'python-hatchling'
             'python-wheel')
optdepends=(
    'python-moviepy: logging videos'
    'python-numpy: logging multi-dimensional arrays'
    'python-pillow: logging images'
    'python-rdkit: logging cheminformatical data'
    'python-soundfile: logging audios'
)
provides=('python-wandb')
conflicts=('python-wandb-git')
install="python-wandb.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/wandb/wandb/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51fbbfbc48c0af260692e5b125dd3a95902e27f5ebb4dddb4d4afe540c58df83')

prepare() {
    cd "$_pkgname-$pkgver"
    sed -i -E 's/\.dev[0-9]+//' wandb/__init__.py{,i}
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build -nw
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH=$PWD python -c 'import wandb'
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*.whl
}
