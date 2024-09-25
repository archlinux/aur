# Maintainer: Groctel <aur@taxorubio.com>
# Maintainer: Naveen M K <naveen521kk@gmail.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=manimpango

pkgname=python-manimpango
pkgver=0.6.0
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."

arch=("x86_64")
license=("MIT")
url="https://github.com/ManimCommunity/ManimPango"

source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('865fd14f7c8416cd6b013a7fce57b86ea1ecdb98f768d3a1a83913584f98e86a7af3e68ffc4feafbc375997a933eb8cb9294e7292ba6836e92ed361427aab0f5')

depends=(
    "cairo"
    "fontconfig"
    "glib2"
    "harfbuzz"
    "pango"
    "python"
    "python-gobject"
)
makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-virtualenv"
    "cantarell-fonts" # https://github.com/ManimCommunity/ManimPango/issues/110
)

build () {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"

    python -m venv --system-site-packages venv
    (
        source venv/bin/activate
        pip install ./dist/*.whl Cython pytest setuptools
        pip install -r requirements-dev.txt
        python setup.py build_ext -i
        python -m pytest -s
    )
    rm -rf venv
}

package () {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
