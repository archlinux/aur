# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=python-yappi
pkgver=1.3.3
_commit=e991cdf92052d8c647412b07dddcea58b478f957
pkgrel=1
pkgdesc='Yet Another Python Profiler, but this time thread&coroutine aware.'
url='https://github.com/sumerc/yappi'
license=(MIT)
arch=('x86_64')
depends=(python)
makedepends=(python-setuptools git)
checkdepends=(python-gevent)
source=("yappi-release::git+https://github.com/sumerc/yappi.git#commit=$_commit"
        "skip-test.patch")

sha256sums=('SKIP'
            'ca2a65fb92709b4ff48d8cf45592bb839c9ea2df3a19380fbc56bfe7ae937ea5')

prepare() {
    cd yappi-release
    git apply ../skip-test.patch
}

build() {
    cd yappi-release
    python setup.py build
}

package() {
    cd yappi-release
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd yappi-release

    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python run_tests.py
}
