# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=mathicsscript
pkgver=4.0.0
pkgrel=1
pkgdesc="A more advanced command-line interface to Mathics."
arch=("any")
url="https://github.com/Mathics3/mathicsscript"
license=('GPL3')
groups=()
depends=("mathics>=4.0.0" "mathics<4.1.0"
         "mathics-pygments>=1.0.2"
         "mathics-scanner>=1.2.4"
         "readline"
         "python-click" "python-colorama" "python-pygments"
         "python-columnize" "python-networkx"
         "python-prompt_toolkit>=3.0.18"
         "python-pygments>=2.9.0"
         "python-term-background>=1.0.1")
checkdepends=("python-pytest")
optdepends=(
    "python-matplotlib: For rending plots and graphs"
    "python-cariosvg: For rendering plots and graphs as SVGs via matplotlib"
    "python-pyqt5: For interactive display of graphs via matplotlib"
    "asymptote: 3D Graphics"
)
backup=() # Do we have any config files?
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1c0499a0b793e8ccab8d3992c4ecfb644ee7b69bf9a22c9ff074ad1d0fe27b8c')
validpgpkeys=()

prepare() {
    # We prepare a 'hack bin' for the tests
    cd "$pkgname-$pkgver"
    mkdir -p "hack-bin"
    echo -e '#!/bin/bash\npython3 -m mathicsscript "$@"' > "hack-bin/${pkgname}"
    chmod +x "hack-bin/${pkgname}"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

check() {
    cd "$pkgname-$pkgver"
    # Test environment needs this -_-
    # Essentially they assume we've already been installed
    export PYTHONPATH="."
    # NOTE: This includes a 'mathicsscript' executable
    export PATH="$PATH:$(pwd)/hack-bin"
    pytest test
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --prefix="usr/"
    # For some reason, setuptools seems to like including these
    # test files....
    rm -r "${pkgdir}"/usr/lib/python*/site-packages/test
}
