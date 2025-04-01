# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=shutilwhich

pkgname=python-shutilwhich
pkgver=1.1.0
pkgrel=9
pkgdesc="A copy & paste backport of Python 3.3's shutil.which function."

arch=("any")
license=("PSF")
url="https://github.com/mbr/shutilwhich"

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/mbr/$_name/refs/heads/master/LICENSE"
)
sha256sums=('4292a973312c58ca1935ea75d7bd378b17668ef6aacfc812d00019e0726dea44'
            'a5e91eb1396daf80ad69801436d6fa7029141a7e05083af681ff54a57a6d7f9e')

depends=(
    "python"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
    "python-virtualenv"
)

build () {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"

    python -m venv --system-site-packages venv
    source venv/bin/activate
    pip install ./dist/*.whl
    python -m pytest
    rm -rf venv
}

package () {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
