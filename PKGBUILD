# Maintainer: Kef Schecter <furrykef@gmail.com>

pkgname=pyboy
pkgver=2.5.0
pkgrel=1
pkgdesc='A scriptable Game Boy emulator written in Python'
arch=('x86_64')
url='https://github.com/Baekalfen/PyBoy'
license=('LGPL-3.0-only')
depends=('python-numpy' 'python-pysdl2')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-opengl: OpenGL support'
            'python-pillow: screen/video capture support')
checkdepends=('python-cryptography' 'python-filelock' 'python-gitpython' 'python-pillow' 'python-pytest' 'python-pytest-benchmark' 'python-pytest-lazy-fixtures' 'python-matplotlib' 'python-pytest-xdist' 'xorg-server-xvfb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Baekalfen/PyBoy/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8358d09dd7cf01435526fc8283a70855fb4db56d0082917e15e2ddcd6b1a9405b19352f37122a21c3da87b24f6cfd80eb36041a3dc29d7be991696657c85c2bb')

build() {
    cd "PyBoy-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "PyBoy-$pkgver"
    # xvfb-run is used to avoid spawning windows during testing
    # test_swoosh is excluded because it turns out not to be portable in 2.5.0
    # This will probably change in future versions
    # The tests segfault with `pkgctl build` for reasons I don't yet understand
    # But they seem to work fine outside the chroot
    xvfb-run pytest -k "not test_swoosh"
}

package() {
    cd "PyBoy-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

