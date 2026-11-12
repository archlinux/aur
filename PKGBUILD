# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=2.3.1
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(glibc gcc-libs libglvnd libx11 libxcursor libxi libxinerama libxrandr 'python>=3.8')
makedepends=(git cmake python-build python-installer python-setuptools python-wheel)
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/ocornut/imgui"
        "git+https://github.com/epezent/implot"
        "git+https://github.com/glfw/glfw")
b2sums=('866194c0d225b49a71f9952b58f6259fba14e8c71c881ec61be1b1fdd67c7cfad9a8cc47f682bf2c07e1cc140da840a6656480266f73f0b25a00b56ff0a5c1c3'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
    cd $_name
    git submodule init
    git config submodule.thirdparty/imgui.url "$srcdir/imgui"
    git config submodule.thirdparty/implot.url "$srcdir/implot"
    git config submodule.thirdparty/cpython.update none
    git config submodule.thirdparty/glfw.url "$srcdir/glfw"
    git config submodule.thirdparty/freetype.update none
    git config submodule.thirdparty/DearPyGui_Ext.update none
    git -c protocol.file.allow=always submodule update
}

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
