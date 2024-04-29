# Maintainer: Thomas <thomas.aur@brainfuck.space>

pkgname=python-pillow-jpegxl-plugin
_pkgname=pillow-jpegxl-plugin
pkgver=1.2.4
pkgrel=1
pkgdesc="A Python Pillow plugin that adds jxl support"
arch=("any")
url="https://github.com/Isotr0py/$_pkgname"
license=("MIT")
depends=("python" "python-pillow")
#TODO: check which dependencies are really required
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner" "python-maturin" "rust" "maturin" "patchelf")
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/Isotr0py/jpegxl-rs.git")
sha256sums=('ab34c9a1611d1ed5db1c4206554972465d440431b56a7e978e284c920bfa9596'
            'SKIP')

prepare() {
     cd "$srcdir/jpegxl-rs"
     git checkout plugin
     cd "${srcdir}/$_pkgname-$pkgver"
#    git submodule init
#    git config submodule.*.url "$srcdir/jpegxl-rs"
#    git -c protocol.file.allow=always submodule update
#    git submodule update --recursive
# only possible when pulling from git
     git clone "$srcdir/jpegxl-rs" jpegxl-rs

     cd jpegxl-rs
     git checkout plugin # checking it out in one go didn't work somehow
}

build() {
    cd "$_pkgname-$pkgver"
#    python -m build --wheel --no-isolation
#    maturin build --release --features vendored
     maturin build --release --features dynamic
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
