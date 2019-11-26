# Maintainer: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>
# Contributor: Sebastian Bøe <$(base64 --decode <<<'c2ViYXN0aWFuYm9vZUBnbWFpbC5jb20K')>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=yosys-git
pkgrel=1
pkgver=r7861.0466c485
pkgdesc='A framework for RTL synthesis'
arch=('x86_64' 'i686')
url='http://www.clifford.at/yosys/'
license=('custom:ISC')
provides=("yosys")
conflicts=("yosys")
depends=('tcl' 'libffi' 'python' 'boost-libs')
optdepends=('graphviz: Schematics display support' 'xdot: Design netlist display support')
makedepends=('git' 'mercurial' 'boost')
source=('git+https://github.com/cliffordwolf/yosys.git'
        'git+https://github.com/berkeley-abc/abc.git'
        'LICENSE')
sha512sums=('SKIP'
            'SKIP'
            'a3202289ff7828c55d3ec3e22d23ed78a34fcae165a7c666d71d3cedd9abe06f638a09750d8c2d43dfca5781f1b32a616f439c3713a12265c02473f88c0f426d')

build(){
    cd ${srcdir}/yosys
    mv ../abc ./
    make config-gcc
    echo "ENABLE_LIBYOSYS=1" >> Makefile.conf
    echo "ENABLE_PYOSYS=1" >> Makefile.conf
    echo "BOOST_PYTHON_LIB=-lboost_python38 -lpython3.8" >>Makefile.conf
    make
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/yosys
    make PREFIX=$pkgdir/usr/ PYTHON_PREFIX=$pkgdir/usr/ install

    install -D -m 644 \
    "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
