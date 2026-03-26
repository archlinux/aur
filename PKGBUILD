# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Yuuki Rika <yvvki@kekkon.nexus>

_pkg=pygame-ce
pkgbase=python-$_pkg
pkgname=('python-pygame-ce' 'python-pygame-ce-sdl3')
pkgver=2.5.7
pkgrel=1
pkgdesc="pygame - Community Edition"
arch=('x86_64')
url="https://pyga.me/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libpng' 'python' 'portmidi')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'meson-python'
    'cython'
    'python-sphinx-autoapi'
    'sdl2'
    'sdl2_ttf'
    'sdl2_image'
    'sdl2_mixer'
    'sdl3'
    'sdl3_ttf'
    'sdl3_image'
)
optdepends=(
    'python-numpy: for examples'
)

source=("https://pypi.io/packages/source/p/$_pkg/${_pkg//-/_}-$pkgver.tar.gz")
sha256sums=('86beb797cd73c141299a29b56f7df2b0543fbdc81d428022458329ff694aaa51')
b2sums=('e5df4c7d29edd6dde0ffaf406247d47e32bea8632c91e3528eb4080c45bf48b3624fb28b03d580e0d9a9a09d860ffcce17f04dcaef07e81ca01f9be4a333851e')
prepare() {
    cp -a ${_pkg//-/_}-$pkgver $srcdir/sdl2
    cp -a ${_pkg//-/_}-$pkgver $srcdir/sdl3
}

build() {
    msg2 "Building SDL2 version..."
    cd $srcdir/sdl2
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building SDL3 version..."
    cd $srcdir/sdl3
    # Derived from dev.py
    python -m build --wheel --no-isolation --skip-dependency-check \
        -Csetup-args="-Dsdl_api=3" \
        -Csetup-args="-Dmixer=disabled"
}

package_python-pygame-ce() {
    depends+=('sdl2' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer')
    conflicts=('python-pygame')
    provides=('python-pygame')

    cd $srcdir/sdl2
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-pygame-ce-sdl3() {
    depends+=('sdl3' 'sdl3_ttf' 'sdl3_image')
    conflicts=('python-pygame' 'python-pygame-ce')
    provides=('python-pygame' 'python-pygame-ce')

    cd $srcdir/sdl3
    python -m installer --destdir="$pkgdir" dist/*.whl
}
