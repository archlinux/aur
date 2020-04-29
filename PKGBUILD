# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-edalize
pkgver=0.2
pkgrel=0
pkgdesc="Python Library for interacting with EDA tools."
arch=('any')
url="http://github.com/olofk/edalize/"
license=('BSD')
conflicts=('python-edalize-git' 'python-jinja')
provides=('python-edalize')
depends=('python' 'python-pytest' 'python-setuptools' 'python-markupsafe')

makedepends=('git')
optdepends=('iverilog: for simulating verilog designs'
	    'ghdl: for simulating VHDL designs'
	    'gtkwave: for visualizing waveforms')

options=(!emptydirs)
source=("git+https://github.com/olofk/edalize#tag=v${pkgver}.${pkgrel}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/edalize"
    python setup.py build
}

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps Jinja2==2.10.3
    python -O -m compileall "${pkgdir}/jinja2"
    cd "${srcdir}/edalize"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
