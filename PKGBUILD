# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC1091,SC2034,SC2154,SC2164

_name=moderngl

pkgname=python-moderngl-git
pkgver=5.13.0.r14.gd99e5cc9
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
    "python-opengl"
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
    "python-numpy"
    "python-pytest"
    "python-scipy"
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

    python -m venv --system-site-packages venv
    source venv/bin/activate
    pip install ./dist/*.whl
    python setup.py build_ext -i
    pytest
    rm -rf venv
}

package () {
    cd "$srcdir/$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
