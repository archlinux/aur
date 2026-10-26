# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Yuuki Rika <yvvki@kekkon.nexus>

_pkg=pygame-ce
pkgbase=python-$_pkg
pkgname=('python-pygame-ce' 'python-pygame-ce-sdl3')
pkgver=2.5.8
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
sha256sums=('3c8e69088ead310037972c391306ea58e74d7296b35d1890067749235fd554ba')
b2sums=('68d6221eef955a0abd507c198f9dbb5a1d8f1476767c8f4379858e9e14d3f3b1f30922407139b2f37211d9ad6ba0286a58ef94a65b02128722dc039170fe8449')

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
