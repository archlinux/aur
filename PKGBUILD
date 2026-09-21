# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pyre-extensions
_pkgname=pyre_extensions
pkgver=0.0.32
pkgrel=2
pkgdesc="Type system extensions for use with the pyre type checker"
arch=('any')
url="https://pyre-check.org"
license=('MIT')
depends=(
    'python'
    'python-typing_inspect'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=('python-pytest')
# This is the last upstream pyre_extensions change immediately preceding the
# 0.0.32 publication. Its package sources and LICENSE match the published release;
# only the generated distribution metadata are absent from the monorepo.
_commit=a0661eba1582932402518f52b698491a1e890057
_repo_srcdir="pyre-check-$_commit"
_archive="pyre-extensions-$pkgver"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/facebook/pyre-check/archive/$_commit.tar.gz"
    'pyre-extensions-pyproject.toml'
)
sha256sums=(
    'f63b6f16e955733c0cfbaaceb420d468b46e691817267c567ba5a1b7d6b79719'
    'c8f681a8d0ca27e4336abc5f29482e1085e44c14bdde3e1ade1421303c7e8d4a'
)

prepare() {
    cd "$srcdir"
    rm -rf "$_archive"
    install -d "$_archive"
    cp -a "$_repo_srcdir/pyre_extensions" "$_archive/"
    install -Dm644 "$_repo_srcdir/LICENSE" "$_archive/LICENSE"
    install -Dm644 pyre-extensions-pyproject.toml "$_archive/pyproject.toml"
}

build() {
    cd "$srcdir/$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_archive"
    PYTHONPATH="$PWD" pytest -ra pyre_extensions/tests
}

package() {
    cd "$srcdir/$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
