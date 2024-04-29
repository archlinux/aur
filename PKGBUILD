# Maintainer: Thomas <thomas.aur@brainfuck.space>

pkgname=python-pillow-jpegxl-plugin
_pkgname=pillow-jpegxl-plugin
pkgver=1.2.0
pkgrel=0
pkgdesc="A Python Pillow plugin that adds jxl support"
arch=("any")
url="https://github.com/Isotr0py/$_pkgname"
license=("MIT")
depends=("python" "python-pillow")
#TODO: check which dependencies are really required
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "python-pytest-runner" "python-maturin" "rust" "maturin")
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/Isotr0py/jpegxl-rs.git")
sha256sums=('ff64f5ab48ad45fa5eea5acd5e72cb9079c2837a1e7c3a187e44f287c093acc3'
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
    # Ugly hack to get it linking
#    sed -i 's/=static//g' build.rs
#    sed -i 's/-static//g' build.rs
#    python -m build --wheel --no-isolation
#    maturin build --release --features vendored
     maturin build --release --features dynamic
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
