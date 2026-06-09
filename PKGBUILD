# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_name=bitsandbytes
pkgname=python-$_name-rocm-git
pkgdesc="Accessible large language models via k-bit quantization for PyTorch. (GIT Version, with ROCm support)"
license=("MIT")
url="https://github.com/bitsandbytes-foundation/$_name"
pkgver=head.r1159.g4c9bbeef
pkgrel=1
arch=("x86_64")
makedepends=(
    "make"
    "cmake"
    "rocm-hip-sdk>=7.2"
    "rocm-toolchain"
)
depends=(
    "hipblaslt"
    "hiprand"
    "hipsparse"
    "hipcub"
    "rocthrust"
    "python-setuptools"
    "python-pytest"
    "python-einops"
    "python-wheel"
    "python-scipy"
    "python-lion-pytorch"
    "python-pandas"
    "python-matplotlib"
)
provides=("python-$_name")
source=("$pkgname::git+$url.git#branch=main")
sha512sums=('SKIP')

prepare() {
    cd $pkgname
}

pkgver() {
    cd $pkgname

    printf "head.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname

    cmake -DCOMPUTE_BACKEND=hip -S .
    make
    python -m build --wheel --no-isolation
}

package() {
    # Install license
    install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install the python wheel
    python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
}
