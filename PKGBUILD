# Maintainer: Groctel <aur@taxorubio.com>
# shellcheck disable=SC2034,SC2154,SC2164

_name=glcontext

pkgname=python-glcontext
pkgver=2.5.0
pkgrel=1
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."

arch=("any")
license=("MIT")
url="https://github.com/moderngl/glcontext"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('b85306c8a1a95bddc9d87a66e3102e45e1a2ae55dfa5b32a263ad4216421712bb31bf8653a1850a281c51b437a274d7c499feac9650035fecd36f5467c6c83a0')

depends=(
    "libx11"
    "egl-wayland"
    "python"
    "python-psutil"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-pytest"
)

build () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m build --wheel --no-isolation
}

check () {
    cd "$srcdir/$_name-$pkgver"

    if echo "$XDG_SESSION_TYPE" | grep -iq "x11"; then
        python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
        PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
    else
        echo "Tests only work on X11 sessions. Skipping..."
    fi
}

package () {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
