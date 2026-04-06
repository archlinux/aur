# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pyimgui
pkgname=python-imgui
pkgver=2.0.0
pkgrel=4
pkgdesc='Cython-based Python bindings for dear imgui'
arch=(any)
url='https://github.com/pyimgui/pyimgui'
license=('MIT')
depends=(python python-glfw python-opengl)
makedepends=(
    cython
    git
    python-build
    python-click
    python-installer
    python-setuptools
    python-wheel
)
source=("git+$url#tag=$pkgver"
        "git+https://github.com/ocornut/imgui#commit=35b1148efb839381b84de9290d9caf0b66ad7d03"
        "cython3.patch")
b2sums=('7552cae9d75a8f8fbdb02d2192fc5f38045f15f7400c308c1d1401a72f4bfc050fc3f851a946dd4a70f8f0eb72ca301db6430c9372ee980b9ada276e870b83b2'
        '63f5745d9b6108a1dca3998a243821cf33c4704afed319611c78eabdf95ea1be89d8783af0b547cb15f8c86a7c55a2b81fb955dc1b733eb177b7255ad2510660'
        'c5ae39746c133a2a9d79015f666df65d65ea71373b3b3f104f6c7fbe0e709e9ee6b863a389476a5af36f0811e5882fa72c69c0f6f762df129deff94cebaae61a')

prepare() {
    cd $_name
    
    git submodule init
    git config submodule.imgui-cpp.url "$srcdir/imgui"
    git -c protocol.file.allow=always submodule update
    
    patch -f -p1 < ../cython3.patch
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
