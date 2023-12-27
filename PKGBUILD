# Maintainer: rodolpheh <rodolphe@lunai.re>
_commit=2341c6c
pkgname=python-leapc
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Open-source Python bindings for the Gemini LeapC API."
arch=("x86_64")
url="https://github.com/ultraleap/leapc-python-bindings"
license=('Apache-2.0')
groups=()
depends=("python" "python-cffi" "ultraleap-hand-tracking-service")
makedepends=("python-build" "python-setuptools")
checkdepends=()
optdepends=()
provides=("python-leapc")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/ultraleap/leapc-python-bindings.git#commit=$_commit"
        "leapc-python-api-init.patch")
noextract=()
sha256sums=(SKIP
            "8834bf822b6dc7eb8c44eaa7cb0b20db6f10c68d3c77e5c972f8ace7163399af")
validpgpkeys=()

prepare() {
    # We have to modify the binding as it will try to find the cffi module at the wrong place
    git apply --directory="leapc-python-bindings" leapc-python-api-init.patch
}

build() {
    cd "leapc-python-bindings"

    # Build the package with setup.py
    # This is a deprecated way and setuptools will tell you so, ignore the warnings
    # Upstream should switch to using a pyproject.toml
    cd "leapc-cffi"
    python setup.py build

    cd "../leapc-python-api"
    python setup.py build
}

package() {
    cd "leapc-python-bindings"

    # Package with setup.py
    cd "leapc-cffi"
    python setup.py install --root="$pkgdir" --optimize=1

    cd "../leapc-python-api"
    python setup.py install --root="$pkgdir" --optimize=1
}
