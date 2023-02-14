# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-fusesoc
pkgver=2.0
pkgrel=0
pkgdesc="Package manager and build abstraction tool for FPGA/ASIC development."
arch=('any')
url="http://github.com/olofk/fusesoc/"
license=('GPLv3')
conflicts=('python-fusesoc-git')
provides=('python-fusesoc')
depends=('python' 'python-edalize' 'python-setuptools' 'python-pyaml' 'python-jsonschema')

makedepends=('git' 'python-pip')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/olofk/fusesoc#tag=${pkgver}.${pkgrel}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/fusesoc"
    python setup.py build
}

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps simplesat
    python -O -m compileall "${pkgdir}/simplesat"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ipyxact
    python -O -m compileall "${pkgdir}/ipyxact"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps okonomiyaki
    python -O -m compileall "${pkgdir}/okonomiyaki"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps zipfile2
    python -O -m compileall "${pkgdir}/zipfile2"
    cd "${srcdir}/fusesoc"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
