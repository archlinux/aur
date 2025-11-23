# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DearPyGui
pkgname=python-dearpygui
pkgver=2.1.1
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
b2sums=('432babcc901b04da2d5814e0def0e9f27911fbff468186f233c4119017bcd3ca3813a63efdd4a05ac1b9806cbd45c650173d8867656ca8e160b4e7369b60c372'
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
