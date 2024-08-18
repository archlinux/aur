# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=moderngl

pkgname=python-moderngl-git
pkgver=5.11.1.r0.g11d3e2ea
pkgrel=1
pkgdesc="Modern OpenGL binding for python."

arch=("any")
license=("MIT")
url="https://github.com/moderngl/moderngl"

source=("git+$url.git")
sha512sums=('SKIP')

options=(!emptydirs)
conflicts=(python-moderngl)

depends=(
    "libgl"
    "python"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-virtualenv"
)

pkgver () {
    cd "$srcdir/$_name"
    git describe --long --tags | sed 's/^networkx-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "$srcdir/$_name"
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name"


    python -m venv venv
    (
        source venv/bin/activate
        pip install ./dist/*.whl numpy pytest scipy setuptools
        python setup.py build_ext -i
        python -m pytest
    )
    rm -rf venv
}

package () {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
