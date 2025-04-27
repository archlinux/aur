# Contributor: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
pkgver=0.13.0
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion'
url='https://amzn.github.io/ion-docs/'
arch=('x86_64')
license=('Apache-2.0')
depends=('python')
makedepends=(
    'cmake'
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-pytest-runner' # AUR
)
source=("git+https://github.com/amazon-ion/ion-python.git#tag=v$pkgver"
        "git+https://github.com/amazon-ion/ion-c.git")
b2sums=('6053229fe5edf0f15aeca93632eb20cfa3c40d7466bfcfd214a8292c2bbd9af56a9ccf94ed7b3fd79e46dc017b524a81a2eb9352ae92e1ba05ccb1deea45d92e'
        'SKIP')

prepare() {
    cd ion-python
    git submodule init
    git config submodule.ion-c.url "$srcdir/ion-c"
    git -c protocol.file.allow=always submodule update ion-c
}

build() {
    # build ion-c (see build-release.sh)
    cd ion-python/ion-c
    export CFLAGS+=" -fpermissive"
    cmake -B build/release -DCMAKE_BUILD_TYPE=Release -DIONC_BUILD_TESTS=OFF .
    make -C build/release
    cd ..

    # build module
    python -m build --wheel --no-isolation
}

package() {
    cd ion-python
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
