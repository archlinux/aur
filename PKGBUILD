# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=1.11.0
pkgrel=2
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=('python>=3.8')
makedepends=(python-build python-installer python-wheel)
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/ocornut/imgui"
        "git+https://github.com/python/cpython"
        "git+https://github.com/glfw/glfw"
        "git+https://gitlab.freedesktop.org/freetype/freetype"
        "git+https://github.com/hoffstadt/DearPyGui_Ext")
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd $_name
    git submodule init
    git config submodule.thirdparty/imgui.url         "$srcdir/imgui"
    git config submodule.thirdparty/cpython.url       "$srcdir/cpython"
    git config submodule.thirdparty/glfw.url          "$srcdir/glfw"
    git config submodule.thirdparty/freetype.url      "$srcdir/freetype"
    git config submodule.thirdparty/DearPyGui_Ext.url "$srcdir/DearPyGui_Ext"
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
