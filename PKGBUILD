# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-draccus
_pkgname=draccus
pkgver=0.11.6
pkgrel=1
pkgdesc="Slightly opinionated framework for simple dataclass-based configurations"
arch=('any')
url="https://github.com/dlwh/draccus"
license=('MIT')
depends=(
    'python'
    'python-mergedeep'
    'python-yaml'
    'python-toml'
    'python-typing_inspect'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-pytest-xdist'
    'python-syrupy'
)
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'python314-argparse-types.patch'
)
sha256sums=(
    'a9d501d0262b75e56b6b8fa3c0ee3414e4fdc66766493677d3ef2ec20419eca5'
    '57d3a28a0502eb3ba1aa9fdfe5182063d8a0fd4c0ca92fc7e4f7a92522edb4ea'
)

prepare() {
    cd "$_pkgname-$pkgver"
    patch -Np1 -i ../python314-argparse-types.patch
}

build() {
    cd "$_pkgname-$pkgver"
    rm -rf build dist ./*.egg-info
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    rm -rf "$srcdir/draccus-check" "$srcdir/draccus-test-suite" \
        "$srcdir/draccus-pytest-tmp"
    python -m installer --destdir="$srcdir/draccus-check" dist/*.whl
    mkdir -p "$srcdir/draccus-test-suite"
    cp -a tests "$srcdir/draccus-test-suite/tests"

    cd "$srcdir/draccus-test-suite"
    PYTHONPATH="$srcdir/draccus-check$site_packages" \
        python -m pytest -v \
        -p no:randomly \
        --basetemp="$srcdir/draccus-pytest-tmp" \
        --doctest-modules \
        --ignore=tests/draccus_choice_plugins \
        --snapshot-warn-unused \
        tests
}

package() {
    cd "$_pkgname-$pkgver"

    local site_packages
    site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir$site_packages"/{examples,tests}
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
