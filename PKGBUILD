# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>
# Maintainer: David Florness <david at florness dot com>

pkgbase='python-dataclasses-json'
pkgname=('python-dataclasses-json')
_module='dataclasses-json'
pkgver='0.6.7'
pkgrel=2
pkgdesc='Easily serialize Python Data Classes to and from JSON'
url='https://github.com/lidatong/dataclasses-json'
depends=(
    'python'
    'python-marshmallow'
    'python-typing_inspect'
)
optdepends=()
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-poetry-dynamic-versioning'
)
checkdepends=(
    'python-hypothesis'
    'python-pytest-mypy'
)
license=('MIT')
arch=('any')
source=(
    "https://github.com/lidatong/dataclasses-json/archive/refs/tags/v${pkgver}.tar.gz"
    # f30f604cbd4a is the latest commit of https://github.com/lidatong/dataclasses-json/pull/565
    "https://github.com/lidatong/dataclasses-json/compare/v0.6.7..f30f604cbd4a.diff"
)
sha256sums=('33518eac8d2dcf6a46c97dace4411e591a2443d3e3a1bfd87c51ee032f65d9e0'
            '84076bb4bc7204e106398463c7295b1555a52815b0d7842d2047b3f298063459')
export POETRY_DYNAMIC_VERSIONING_BYPASS="$pkgver"

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    awk '/^diff --git a\// {keep=0} /^diff --git a\/dataclasses_json/ {keep=1} /^diff --git a\/tests/ {keep=1} { if (keep) print } ' "${srcdir}/v0.6.7..f30f604cbd4a.diff" > "${srcdir}/py314-min.diff"
    patch -Np1 -i "${srcdir}/py314-min.diff"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
