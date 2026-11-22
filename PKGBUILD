# Maintainer: bipin kumar <kbipinkumar at pm dot me>
# Contributor: Bao Trinh <qubidt at gmail dot com>

pkgbase=edlib
pkgname=('edlib' 'python-edlib')
pkgver=1.3.9.post1
pkgrel=1
pkgdesc='Lightweight, super fast C/C++ (& Python) library for sequence alignment using edit (Levenshtein) distance'
arch=(x86_64)
url=https://github.com/Martinsos/edlib
license=('MIT')
depends=()
makedepends=(
	'git'
	'cmake'
	'meson'
	'cython'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-cogapp'
)
source=("https://github.com/Martinsos/edlib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cd6209de5c3ac7e0fd817ed14fd9a0f3606655cbbad87e9cd4025ef6208bba7a')

prepare() {
    # patch Makefile to use recommended meson options as stated in Archwiki 
    sed -i 's|meson setup|arch-meson --prefix=/usr|g' "${srcdir}/${pkgname}-${pkgver}"/Makefile
    sed -i "/compiler_directives/d" "${srcdir}/${pkgbase}-${pkgver}/bindings/python/setup.py"

	cd "${srcdir}/${pkgname}-${pkgver}"
	make configure
	sed -Ei '/pip install (cython|cogapp)/d' "${srcdir}/${pkgbase}-${pkgver}/bindings/python/Makefile"
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
        make build
        cd "${srcdir}/${pkgbase}-${pkgver}/bindings/python"
        cp -rf ../../edlib .
        cython --cplus edlib.pyx -o edlib.bycython.cpp
        EDLIB_OMIT_README_RST=1 python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make test
}

package_edlib() {
    depends=('glibc' 'gcc-libs')
    pkgdesc='Lightweight, super fast C/C++ library for sequence alignment using edit (Levenshtein) distance'
	cd "${srcdir}/${pkgbase}-${pkgver}"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgbase}"
	DESTDIR="${pkgdir}" make install
    install -Dm644 ${srcdir}/${pkgbase}-${pkgver}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python-edlib() {
	pkgdesc="Python bindings for edlib"
    depends=('python' 'glibc' 'gcc-libs' 'edlib')

	cd "${srcdir}/${pkgbase}-${pkgver}/bindings/python"
	python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 ${srcdir}/${pkgbase}-${pkgver}/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
